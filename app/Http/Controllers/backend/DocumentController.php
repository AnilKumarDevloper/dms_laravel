<?php

namespace App\Http\Controllers\backend;

use App\Http\Controllers\Controller;
use App\Mail\DocumentReadWritePermissionAlertMail;
use App\Mail\PubliclySharedDocumentMail;
use App\Models\backend\DocumentAudit;
use App\Models\backend\DocumentComment;
use App\Models\backend\DocumentPermission;
use App\Models\backend\FileUploadPermission;
use App\Models\backend\PubliclySharedDocument;
use App\Models\backend\UserPermission;
use App\Services\DocumentAuditService;
use Carbon\Carbon;
use Crypt;
use File;
use Illuminate\Http\Request;
use App\Models\User;
use App\Models\backend\{MainCategory ,SubCategory, DepartmentType, Document, MainFolder, SubFolder};
use Auth;
use Mail;
use Response; 
use PhpOffice\PhpSpreadsheet\IOFactory;
use PhpOffice\PhpWord\IOFactory as WordIOFactory;
use Spatie\PdfToImage\Pdf;
use Mpdf\Mpdf;

class DocumentController extends Controller{
    protected $documentAuditService;
    public function __construct(DocumentAuditService $documentAuditService){
        $this->documentAuditService = $documentAuditService;
    }
   
    private function convertToImageOrPdf($filePath, $extension, $outputPath){
        try {
            $convertedFileName = null;
            try{  
            }catch(\PhpOffice\PhpWord\Exception\Exception $e) {
                return 'Error reading Word file: ' . $e->getMessage();
            }
            return $convertedFileName;
        }catch(\Exception $e){
            return 'General error: ' . $e->getMessage();
        }
    } 
    public function index(){
        $permission_check = UserPermission::where('user_id', Auth::user()->id)->where('menu_id', 14)->exists();
        if($permission_check){
            $documents = Document::with('getMainFolder:id,name', 'getSubFolder:id,name', 'getDepartmentType:id,name');
            if(Auth::user()->role_type_id != 1){
                $documents = $documents->whereJsonContains('assigned_users', Auth::user()->id)->orWhere('owner_id', Auth::user()->id);
            }
            $documents = $documents->orderBy('id', 'desc')->paginate(10);
            return view('backend.document.index', compact('documents'));
        }else{  
            return response()->view('errors.405', [], 405);
        }
    }
    public function create(){
        $permission_check = UserPermission::where('user_id', Auth::user()->id)->where('menu_id', 15)->exists();
        if($permission_check){
            // here default department type is not getting this is an issue check latter
            $departments_list = DepartmentType::select('*');
            if(Auth::user()->role_type_id != 1 ){
                $departments_list = $departments_list->whereHas('getAccessibleDepartmentList', callback: function($query){
                    $query = $query->where('user_id', Auth::user()->id);
                });
            }
            $departments_list = $departments_list->get();  
            $users = User::where('created_by', Auth::user()->id)->get();   
            return view('backend.document.create', compact('departments_list', 'users'));
        }else{
            return response()->view('errors.405', [], 405);
        }
    }
    public function store(Request $request){ 
        $validate = $request->validate([
            'document_title' => ['required', 'max:100'],
            'department' => ['required'],
            'sub_folder' => ['required'],
            'document' => ['required', 'mimes:pdf,png,doc,docx,xls,xlsx,xlsm,pptx,gif,jpg', 'max:512000',]
        ],
[
            'document.max' => 'The document field must not be greater than 500 MB.',
        ]);
        $permission_check = UserPermission::where('user_id', Auth::user()->id)->where('menu_id', 15)->exists();
        if($permission_check){
         $existingDocument = Document::where('document_title', strip_tags($request->document_title))
        ->where('main_folder_id', $request->department)
        ->where('sub_folder_id', $request->sub_folder)
        ->first();
        if($existingDocument){
            return redirect()->back()->withErrors(['document_title' => 'A document with the same title already exists in the selected folder.']);
        }
        $title = strip_tags($request->document_title); 
        $department_id = $request->department;
        $assigned_users = $request->users;
        if($assigned_users != ''){
            $assigned_users = array_map('intval', $assigned_users);
        }
        $main_folder = MainFolder::where('department_type_id', $department_id)->first();
        $sub_folder_id = $request->sub_folder;
        $sub_folder = SubFolder::where('id', $sub_folder_id)->first();
        $document = Document::create([
            'document_title' => $title,
            'main_folder_id' => $main_folder->id,
            'sub_folder_id' => $sub_folder_id,
            'department_type_id' => $department_id, 
            'assigned_users' => $assigned_users,
            'owner_id' => Auth::user()->id
        ]);
        if($request->hasFile('document')){
            $documentFile = $request->file('document');
            $extension = $documentFile->getClientOriginalExtension();
            $documentName = time() . '.' . $extension;  
            $documentPath = public_path('folders/' . $main_folder->name . '/' . $sub_folder->name);
            $documentFilePath = $documentPath . '/' . $documentName;  
            $documentFile->move($documentPath, $documentName); 
            Document::where('id', $document->id)->update([
                'doc_file' => $documentName,
                'doc_path' => 'public/folders/' . $main_folder->name . '/' . $sub_folder->name, 
            ]);
        }
        return redirect()->route('backend.document.index')->with('created', 'Document has been uploaded successfully.');
        }else{
            return response()->view('errors.405', [], 405);
        } 
    }
    public function edit($id){
        try{
        $decrypt_id = Crypt::decrypt($id);
        $document = Document::with('getMainFolder:id,name,status', 'getSubFolder:id,name,status')->where('id', $decrypt_id)->first();
        $departments_list = DepartmentType::get(); 
        if(Auth::user()->role_type_id != 1){
            if($document->getMainFolder?->status == 0 || $document->getSubFolder?->status == 0){
                abort('404');
            }
        }   
        $users = User::select('*'); 
        if(Auth::user()->role_type_id == 5){
            $users = $users->where('manager_id', Auth::user()->id);
        }
        if(Auth::user()->role_type_id == 6){
            $users = $users->where('team_leader_id', Auth::user()->id);
        }
        $users = $users->get();
        $sub_folder_list = SubFolder::where('main_folder_id', $document->main_folder_id)->get();
        $permission_check_write = DocumentPermission::where('user_id', Auth::user()->id)
        ->where('write', 1)->where('document_id', $document->id)->exists();
        if(Auth::user()->role_type_id == 2){
            $user_ids = User::where('head_department_id', Auth::user()->id)->pluck('id')->toArray(); 
        }
        if(Auth::user()->role_type_id == 5){
            $user_ids = User::where('manager_id', Auth::user()->id)->pluck('id')->toArray(); 
        }
        if(Auth::user()->role_type_id == 6){
            $user_ids = User::where('team_leader_id', Auth::user()->id)->pluck('id')->toArray(); 
        }
        $user_ids[] = Auth::user()->id;
        if(Auth::user()->role_type_id == 1 || $permission_check_write || in_array($document->owner_id, $user_ids)){
            $document = Document::where('id', $decrypt_id)->first();
            return view('backend.document.edit', compact('document', 
            'departments_list', 'users', 'sub_folder_list'));
        }
        // $permission_check = UserPermission::where('user_id', Auth::user()->id)->where('menu_id', 17)->exists();
        //     if(Auth::user()->role_type_id == 1 || $document->owner_id == Auth::user()->id){
        //         $document = Document::where('id', $decrypt_id)->first();
        //         return view('backend.document.edit', compact('document', 
        //         'departments_list', 'users', 'sub_folder_list'));

        //     }else{
        //     $permission_check = DocumentPermission::where('user_id', Auth::user()->id)
        //     ->where('write', 1)->where('document_id', $decrypt_id)
        //     ->exists();
        //     if($permission_check){
        //         return view('backend.document.edit', compact('document', 'departments_list', 'users', 'sub_folder_list'));
        //         }else{
        //             return response()->view('errors.405', [], 405);
        //         }     
        // }
        }catch(\Exception $e){
            abort('404');
        } 
    } 
    public function update(Request $request, $id){
        // $permission_check = UserPermission::where('user_id', Auth::user()->id)->where('menu_id', 17)->exists();
        // if($permission_check){ 
        $validate = $request->validate([
            'document_title' => ['required', 'max:100'],
            'department' => ['required'],
            'sub_folder' => ['required'],
            'document' => ['mimes:pdf,png,doc,docx,xls,xlsx,xlsm,pptx,gif,jpg', 'max:512000',]
        ],
        [
            'document.max' => 'The document field must not be greater than 500 MB.',
        ]);  
        $title =  strip_tags($request->document_title);
        $department_id = $request->department;
        $assigned_users = $request->users;
        if($assigned_users != ''){
            $assigned_users = array_map('intval', $assigned_users);
        }
        $main_folder = MainFolder::where('department_type_id', $department_id)->first();
        $sub_folder_id = $request->sub_folder;
        $sub_folder = SubFolder::where('id', $sub_folder_id)->first();
        // ----------------------------------------------------------------------------------------------------------
            // Fetch the existing document
            $existingDocument = Document::find($id);    
            // Prepare the new values
            $newValues = [
                'document_title' => $title,
                'main_folder_id' => $main_folder->id,
                'sub_folder_id' => $sub_folder_id,
                'department_type_id' => $department_id,
                'assigned_users' => $assigned_users,
            ];
             // Compare and log changes
             $changes = [];

            foreach ($newValues as $field => $newValue) {
                $oldValue = $existingDocument->{$field}; 
                if($oldValue != $newValue) {
                    $changes[$field] = [
                        'old' => $oldValue,
                        'new' => $newValue
                    ];
                }
            }
            if (!empty($changes)) {
            DocumentAudit::create([
                'user_id' => Auth::user()->id,
                'role_type_id' => Auth::user()->role_type_id,
                'document_id' => $id,
                'main_folder_id' => $main_folder->id,
                'sub_folder_id' => $sub_folder_id,
                'operation' => 'update',
                'changes' => $changes
            ]);
        }
        // ----------------------------------------------------------------------------------------------------------
 
        $document_id = Document::where('id', $id)->update([
            'document_title' => $title,
            'main_folder_id' => $main_folder->id,
            'sub_folder_id' => $sub_folder_id,
            'department_type_id' => $department_id, 
            'assigned_users' => $assigned_users
        ]); 
        $doc_per = DocumentPermission::where('document_id', $id)
        ->where('access_given_by', Auth::user()->id)->get(); 
        if($assigned_users!= ''){ 
            foreach($assigned_users as $user){
            $doc_per = DocumentPermission::where('document_id', $id)
            ->where('access_given_by', Auth::user()->id)
            ->where('user_id', $user)->first();
                if($doc_per == ''){
                    DocumentPermission::create([
                        "user_id" => $user,
                        "document_id" => $id,
                        "read" => 1,
                        "write" => 0,
                        "access_given_by" => Auth::user()->id,
                    ]);
                }
            } 
        }   
        if($request->hasFile('document')){
            $document_name = time().'.'.$request->file('document')->getClientOriginalExtension();
            $request->file('document')->move(public_path('folders/'.$main_folder->name.'/'.$sub_folder->name), $document_name); 
            Document::where('id', $id)->update([
               'doc_file'  => $document_name,
               'doc_path' => 'public/folders/'.$main_folder->name.'/'.$sub_folder->name
            ]);
        }
        // $this->documentAuditService->CreateDocumentAudit(
        //     Auth::user()->id,
        //     $id,
        //     $main_folder->id,
        //     $sub_folder_id,
        //     "update" 
        // );
        return redirect()->back()->with('updated', 'Document has been updated successfully.');
         // }else{
        //     return response()->view('errors.405', [], 405);
        // }
    }
    public function view($file){
        try{
            $decrypt_file = Crypt::decrypt($file);
            $doc = Document::withTrashed()->where('doc_file', $decrypt_file)->first();
            $file_type = File::extension($decrypt_file);
            $can_download = 0;
            // $permission_check = UserPermission::where('user_id', Auth::user()->id)->where('menu_id', 21)->exists();
            $document = Document::with('getMainFolder:id,name,status', 'getSubFolder:id,name,status')->withTrashed()->where('doc_file', $decrypt_file)->first(); 
            if(Auth::user()->role_type_id != 1){
                if($document->getMainFolder?->status == 0 || $document->getSubFolder?->status == 0){
                    abort('404');
                }
            }
            if(Auth::user()->role_type_id == 1 || $doc->owner_id == Auth::user()->id){
                $this->documentAuditService->CreateDocumentAudit(
                    Auth::user()->id,
                    Auth::user()->role_type_id,
                    $doc->id,
                    $doc->main_folder_id,
                    $doc->sub_folder_id,
                    "view" 
                );
                $can_download = 1; 
                return view('backend.document.view', compact('document',
                'file_type', 'can_download')); 
            }elseif( Auth::user()->role_type_id == 2){
                $owner = User::where('id', $doc->owner_id)->first();
                if($owner->head_department_id == Auth::user()->id){
                    return view('backend.document.view', compact('document',
                    'file_type', 'can_download')); 
                }else{
                    return response()->view('errors.405', [], 405);
                }
            }
            else{
                // $permission_check = DocumentPermission::where('user_id', Auth::user()->id)
                // ->where('read', 1)->where('document_id', $doc->id)->exists();
                // if($permission_check){ 
                    $document = Document::with('getMainFolder:id,name', 'getSubFolder:id,name')
                    ->where('doc_file', $decrypt_file)->whereJsonContains('assigned_users', Auth::user()->id);
                    // if(Auth::user()->role_type_id != 1){
                    //     $document = $document->whereJsonContains('assigned_users', Auth::user()->id);
                    // } 
                    $document = $document->first();
                    $this->documentAuditService->CreateDocumentAudit(
                        Auth::user()->id,
                        Auth::user()->role_type_id,
                        $doc->id,
                        $doc->main_folder_id,
                        $doc->sub_folder_id,
                        "view" 
                    ); 
                    $chek_wirte_permision = DocumentPermission::where('user_id', Auth::user()->id)
                    ->where('document_id', $doc->id)->where('write', 1)->exists();
                     if($chek_wirte_permision){
                            $can_download = 1;
                     } 
                    if($document){
                        return view('backend.document.view', compact('document','file_type', 'can_download'));
                    }else{
                    return response()->view('errors.405', [], 405);
                    }
                // }else{
                //     return response()->view('errors.405', [], 405);
                // } 
            }
        }catch(\Exception $e){  
            abort('404');
        }
    }
    public function comment($id){
        try{
            $decrypt_id = Crypt::decrypt($id); 
            $document = Document::where('id', $decrypt_id)->first();
            $comments = DocumentComment::with(['getUser:id,name,email',
            'getReplys', 'getReplys.getUser:id,name'])
            ->where('document_id', $decrypt_id)->where('parent_id', NULL)->get(); 
            return view('backend.document.comment', compact('document', 'comments'));
        }catch(\Exception $e){
            abort('404');
        }
    }
    public function commentStore(Request $request){
        $comment = $request->comment;
        $doc_id = $request->document_id;
        DocumentComment::create([
            "document_id" => $doc_id,
            "user_id" => Auth::user()->id,
            "comment" => $comment,
            "publish_status" => 1,
            "status" => 1
        ]);
        return redirect()->back();
    }
    public function replyStore(Request $request){
        $reply = $request->reply;
        $doc_id = $request->document_id;
        $parent_id = $request->parent_id;
        DocumentComment::create([
            "document_id" => $doc_id,
            "user_id" => Auth::user()->id,
            "parent_id" => $parent_id,
            "comment" => $reply,
            "publish_status" => 1,
            "status" => 1
        ]);
        return redirect()->back(); 
    }
    public function directUpload($m_id, $s_id){
        try{
            $decrypt_m_id = Crypt::decrypt($m_id);
            $decrypt_s_id = Crypt::decrypt($s_id);
            $m_folder = MainFolder::where('id', $decrypt_m_id)->first();
            $s_folder = SubFolder::where('id', $decrypt_s_id)->first();
            if(Auth::user()->role_type_id == 1 || Auth::user()->department_type_id == $decrypt_m_id){
                return view('backend.document.direct_upload', compact('decrypt_m_id',
                 'decrypt_s_id', 'm_folder', 's_folder'));
            }else{
            $check_permission = FileUploadPermission::where('main_folder_id', $decrypt_m_id)->where('sub_folder_id', $decrypt_s_id)->where('user_id', Auth::user()->id)->exists();
            if($check_permission){
                return view('backend.document.direct_upload', compact('decrypt_m_id',
                 'decrypt_s_id', 'm_folder', 's_folder'));
            }else{
                return response()->view('errors.405', [], 405);
            }
        }
        }catch(\Exception $e){
            abort('404');
        }
    }
 
    public function DirectUploadStore(Request $request){
            $validate = $request->validate([
                'document_title' => ['required', 'max:100'],
                'document' => ['required', 'mimes:pdf,png,doc,docx,xls,xlsx,xlsm,pptx,gif,jpg', 'max:512000',]
                ],
        [
                'document.max' => 'The document field must not be greater than 500 MB.',
                ]
            );
        $m_id = $request->m_id;
        $s_id = $request->s_id;
        $title = $request->document_title;
        $main_folder = MainFolder::where('id', $m_id)->first();
        $sub_folder = SubFolder::where('id', $s_id)->first();

        $document_exists = Document::where('document_title', strip_tags($request->document_title))
        ->where('main_folder_id', $m_id)->where('sub_folder_id', $s_id)->first();
        if($document_exists){
            return redirect()->back()->withErrors(['document_title' => 'A document with the same title already exists in this folder.']);
        }
        $document_id = Document::create([
            'document_title' => strip_tags($title),
            'main_folder_id' => $m_id,
            'sub_folder_id' => $s_id,
            'department_type_id' => $m_id,
            'owner_id' => Auth::user()->id
        ]);
         if($request->hasFile('document')){
            $document_name = time().'.'.$request->file('document')->getClientOriginalExtension();
            $request->file('document')->move(public_path('folders/'.$main_folder->name.'/'.$sub_folder->name), $document_name); 
            Document::where('id', $document_id->id)->update([
               'doc_file'  => $document_name,
               'doc_path' => 'public/folders/'.$main_folder->name.'/'.$sub_folder->name
            ]);
        }
        return redirect()->route('backend.folders.view_doc_list',[Crypt::encrypt($m_id), Crypt::encrypt($s_id)]);
    }
    public function DocumentAccess($id){
        try{
            $decrypt_id = Crypt::decrypt($id); 
            $document = Document::with('getSubFolder', 'getMainFolder')
            ->where('id', $decrypt_id)->first(); 
            if(Auth::user()->role_type_id != 1){
                if($document->getMainFolder?->status == 0 || $document->getSubFolder?->status == 0){
                    abort('404');
                }
            }  
            $users = User::with('getDocumentPermission')
            ->whereIn('role_type_id', [2,3,4,5,6,7])
            ->whereIn('id', $document->assigned_users)
            ->with('getDocumentPermission', function ($query) use ($decrypt_id){
                $query->where('document_id', $decrypt_id);
            })->orderBy('role_type_id', 'asc')->get();    
            return view('backend.document_permission.assign_document_permission', compact('document', 'users'));
        }catch(\Exception $e){
            abort('404');
        }
    }
    public function DocumentAccessSync(Request $request, $id){ 
        $allRecords = json_decode($request->input('all_records'), true);
        $w = '';
        $r = '';  
        foreach ($allRecords as $record) { 
            $doc_per = DocumentPermission::where('user_id', $record['user_id'])
            ->where('document_id', $id)->where('access_given_by', Auth::user()->id)
            ->first(); 
            $getUser = User::where('id', $record['user_id'])->first();
            $document = Document::with(['getMainFolder', 'getSubFolder'])->where('id', $id)->first();
            $user = User::where('id', $record['user_id'])->first();
            DocumentPermission::where('user_id', $record['user_id'])
            ->where('document_id', $id)->delete(); 
            if($doc_per != ''){
                if($doc_per->read == 0 && $record['read'] == 0){
                    $r = 0; 
                }else if($doc_per->read == 1 && $record['read'] == 0){
                    $r = 1; 
                }else if($doc_per->read == 0 && $record['read'] == 1){
                    $r = 1; 
                }else if($doc_per->read == 1 && $record['read'] == 1){
                    $r = 0; 
                } 
                if($doc_per->write == 0 && $record['write'] == 0){
                    $w = 0; 
                }else if($doc_per->write == 1 && $record['write'] == 0){
                    $w = 1; 
                }else if($doc_per->write == 0 && $record['write'] == 1){
                    $w = 1; 
                }else if($doc_per->write == 1 && $record['write'] == 1){
                    $w = 0; 
                }     
            }else{
                if($record['read'] == 0){ 
                    $r = 0; 
                }else if($record['read'] == 1){ 
                    $r = 1; 
                }
                if($record['write'] == 0){ 
                    $w = 0; 
                }else if($record['write'] == 1){ 
                    $w = 1; 
                }  
            }
            if($r == 1 || $w == 1){ 
                $doc_r_w_permission_mail_data = [
                    'read' => $record['read'],
                    'write' => $record['write'],
                    'user_name' => $getUser->first_name.' '.$getUser->last_name,
                    'doc_title' => $document->document_title,
                    'document_path' => $document->doc_path,
                    'doc_file' => $document->doc_file,
                    'main_folder' => $document->getMainFolder?->name,
                    'sub_folder' => $document->getSubFolder?->name
                ];
                Mail::to($getUser->email)->send(new DocumentReadWritePermissionAlertMail($doc_r_w_permission_mail_data));
            } 
            DocumentPermission::create([
                'document_id' => $id, 
                'user_id' => $record['user_id'],
                'read' => $record['read'],
                'write' => $record['write'],
                'access_given_by' => Auth::user()->id
            ]);
        } 
        return redirect()->back()->with('document_access_synced', 'Document access has been assigned successfully.'); 
    }
    public function PubliclySharedDocument($id){
        try{
        $decrypt_id = Crypt::decrypt($id);
        $document = Document::with('getMainFolder:id,name,status', 'getSubFolder:id,name,status')->where('id', $decrypt_id)->first();
        if(Auth::user()->role_type_id != 1){
            if($document->getMainFolder?->status == 0 || $document->getSubFolder?->status == 0){
                abort('404');
            }
        }
        return view('backend.document.publicly_shared_document', compact('decrypt_id', 'document'));
        }catch(\Exception $e){
            abort('404');
        }
    }
    public function PubliclySharedDocumentSend(Request $request){
        $emails = explode(',', $request->email);
        $doc_id = $request->doc_id;
        $date = $request->date;
        $document = Document::where('id', $doc_id)->first();
        $shared_row = PubliclySharedDocument::create([
            'doc_file' => $document->doc_file, 
            'shared_url' => $document->doc_path,
            'link_valid_until' => $date
        ]);

        $shared_document_url = [
            'shared_url' => route('frontend.publicly_shared_document_view', [$document->doc_file, $shared_row->id]),
            'doc_file' => $document->doc_file,
            'doc_path' => $document->doc_path,
            'row_id' => $shared_row->id,
            'valid_until' => $shared_row->link_valid_until
        ];
        foreach($emails as $email){
            $shared_document_url['user_email'] = $email;
            Mail::to($email)->send(new PubliclySharedDocumentMail(shared_document_url: $shared_document_url));
        }
        return redirect()->back();
        //return route('frontend.publicly_shared_document_view', $document->doc_file);
    }
    public function PubliclySharedDocumentView($file, $row_id){ 
        try{ 
            $file_type = '';
            $decrypt_file = Crypt::decrypt($file);
            $decrypt_row_id = Crypt::decrypt($row_id);
            $current_date = Carbon::now()->format('Y-m-d');
            $file_url = route('frontend.publicly_shared_document_view', [$file, $row_id]); 
            // $document = Document::where('doc_file', $file)->first();
            $document = PubliclySharedDocument::where('doc_file', $decrypt_file)->where('id', $decrypt_row_id)->first(); 
        if($document){
            $file_type = File::extension($document->doc_file);
            if($document->link_valid_until != NULL){
            $link_valid_until = Carbon::parse($document->link_valid_until)->format('Y-m-d'); 
            if($link_valid_until >= $current_date){
                return view('backend.document.publicly_shared_document_view', compact('document', 'file_type'));
            }else{
                return response()->view('errors.410', [], 410);
            }
            }else{
                return view('backend.document.publicly_shared_document_view', compact('document', 'file_type')); 
            } 
        }else{
            return response()->view('errors.404', [], 404);
        }
        }catch(\Exception $e){
            abort('404');
        } 
    } 
    public function delete(Request $request){
        try{
        $decrypt_id = Crypt::decrypt($request->id);
        $document = Document::with('getMainFolder:id,name,status', 'getSubFolder:id,name,status')->where('id', $decrypt_id)->first();
        if(Auth::user()->role_type_id != 1){
            if($document->getMainFolder?->status == 0 || $document->getSubFolder?->status == 0){
                return response()->json([
                    "status" => "folder_not_available"
                ]);
            }
        }
        if($document->owner_id == Auth::user()->id || Auth::user()->role_type_id == 1){
        $document->delete();
        $this->documentAuditService->CreateDocumentAudit(
            Auth::user()->id,
            Auth::user()->role_type_id,
            $decrypt_id,
            $document->main_folder_id,
            $document->sub_folder_id,
            "delete" 
        );
        return response()->json([
            "status" => "deleted", 
        ]); 
        }else{
            return response()->json([
                "status" => "permission_denied"
            ]);
            // return response()->view('errors.405', [], 405);
        }
        }catch(\Exception $e){
            return response()->json([
                "status" => "something_went_wrong",
                "error" => $e->getMessage(),
                'document' => $document
            ]);
            // abort('404');
        }

    }
    public function uploadNewFile($id){
        try{
            $document_id = Crypt::decrypt($id);
            $document = Document::with('getMainFolder:id,name,status', 'getSubFolder:id,name,status')->where('id', $document_id)->first();
            if(Auth::user()->role_type_id != 1){
                if($document->getMainFolder?->status == 0 || $document->getSubFolder?->status == 0){
                    abort('404');
                }
            }
        }catch(\Exception $e){
            abort('404');
        }
        return view('backend.document.upload_new_file', compact('document_id', 'document'));
    }
    public function uploadNewFileStore(Request $request, $id){
        $validate = $request->validate([
            'document' => ['required', 'mimes:pdf,png,doc,docx,xls,xlsx,xlsm,pptx,gif,jpg', 'max:512000',]
        ],
        [
            'document.max' => 'The document field must not be greater than 500 MB.',
        ]);
        $decrypt_id = Crypt::decrypt($id); 
        $document = Document::where('id', $decrypt_id)->first();
        if($request->hasFile('document')){
            $document_name = time().'.'.$request->file('document')->getClientOriginalExtension();
            $request->file('document')->move($document->doc_path, $document_name); 
            Document::where('id', $decrypt_id)->update([
               'doc_file'  => $document_name,
            ]);
        }
        $this->documentAuditService->CreateDocumentAudit(
            Auth::user()->id,
            Auth::user()->role_type_id,
            $decrypt_id,
            $document->main_folder_id,
            $document->sub_folder_id,
            "file replace" 
        );
        return redirect()->back();

    }
    public function download($id){ 
        try{
        $decrypt_id = Crypt::decrypt($id);
         $document = Document::withTrashed()->findOrFail($decrypt_id);  
         $filePath = $document->doc_path . '/' . $document->doc_file;
         if (!file_exists($filePath)) {
             return abort(404); 
         } 
         $this->documentAuditService->CreateDocumentAudit(
            Auth::user()->id,
            Auth::user()->role_type_id,
            $decrypt_id,
            $document->main_folder_id,
            $document->sub_folder_id,
            "download" 
        );
         return Response::download($filePath);  
        }catch(\Exception $e){
            abort('404');
        }
    }
    public function archivedDocuments(){
        if(Auth::user()->role_type_id == 1){
            $documents = Document::onlyTrashed()->with('getMainFolder:id,name', 'getSubFolder:id,name', 'getDepartmentType:id,name');
            if(Auth::user()->role_type_id != 1){
                $documents = $documents->whereJsonContains('assigned_users', Auth::user()->id)->orWhere('owner_id', Auth::user()->id);
            }
            $documents = $documents->orderBy('id', 'desc')->paginate(10);  
            return view('backend.archived_document.index', compact('documents'));
        }else{
            abort('404');
        }   
    }
    
    public function restore($id){
        try{
            $decrypt_id = Crypt::decrypt($id); 
            $document = Document::onlyTrashed()->findOrFail($decrypt_id); 
            $document->restore();
            $this->documentAuditService->CreateDocumentAudit(
                Auth::user()->id,
                Auth::user()->role_type_id,
                $decrypt_id,
                $document->main_folder_id,
                $document->sub_folder_id,
                "restore" 
            ); 
            return redirect()->back()->with('success', 'Document restored successfully.');
        }catch(\Exception $e){
            abort('404');
        }
    }
    public function PermanentDelete(Request $request){
        try{
            $decrypt_id = $request->id;
            $document = Document::onlyTrashed()->findOrFail($decrypt_id); 
            $document->forceDelete(); 
            return response()->json([
                "status" => "deleted"
            ]);
        }catch(\Exception $e){
           return response()->json([
            "status" => "failed",
            "error" => $e->getMessage()
           ]);
        }
    }
  
    public function searchArchivedDocuments(Request $request){
        try{
            if(Auth::user()->role_type_id == 1){ 
                $documents = Document::onlyTrashed()->with('getMainFolder:id,name', 'getSubFolder:id,name', 'getDepartmentType:id,name');
                if(Auth::user()->role_type_id != 1){
                    $documents = $documents->whereJsonContains('assigned_users', Auth::user()->id)->orWhere('owner_id', Auth::user()->id);
                } 
                if(isset($_GET['search_text'])){
                    $documents = $documents->where('document_title', 'LIKE', '%'.$request->search_text.'%');
                }
                $documents = $documents->orderBy('id', 'desc')->get();
                $documents->transform(function ($document) {
                    $document->encrypted_id = Crypt::encrypt($document->id);
                    return $document;
                }); 
                return response()->json([
                "status" => "success",
                "document_list" => $documents
               ]); 
            }else{
                abort('404');
            } 
        }catch(\Exception $e){
            return response()->json([
                "status" => "failed",
                "error" => $e->getMessage()
            ]);
        }


    }
    
    public function checkDocumentTitleExistence(Request $request){
        try{
            $title = $request->title;
            $department_id = $request->department_id;
            $sub_folder_id = $request->sub_folder_id; 
            $doc_id = $request->doc_id;
           $document = Document::select('*');
           $document = $document->where('document_title', $title);
           if($department_id != null){
               $document = $document->where('main_folder_id', $department_id);
           }
           if($sub_folder_id != null){
            $document = $document->where('sub_folder_id', $sub_folder_id);
        }
        if($doc_id != null){
               $document = $document->where('id', '!=', $doc_id);
           }
           $document = $document->first(); 
           if($document){
            return response()->json([
                "status" => "success",
                "title_existence" => true,
                "document" => $document
            ], 200);
        }else{
            return response()->json([
                "status" => "success",
                "title_existence" => false,
                "document" => $document
            ], 200);
        }
        }catch(\Exception $e){
            return response()->json([
                "status" => "failed",
                "error" => $e->getMessage()
            ], 400);
        }
    }
}
