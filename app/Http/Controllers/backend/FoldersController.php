<?php

namespace App\Http\Controllers\backend;

use App\Http\Controllers\Controller;
use App\Models\backend\FolderPermissionList;
use App\Models\backend\MainFolderPermissionList;
use App\Models\backend\UserFolderPermission;
use App\Models\backend\UserMainFolderPermission;
use App\Models\User;
use Crypt;
use Illuminate\Http\Request;
use App\Models\backend\{DepartmentType, MainFolder, UserPermission, SubFolder, Document};
use Auth;

class FoldersController extends Controller
{
    public function index($id){
        try{  
        $decrypt_id = Crypt::decrypt($id);
        $subFolderIds = [];
        $ids = []; 
        $main_folder_assigned_permissions = UserMainFolderPermission::
        where('user_id', Auth::user()->id)->pluck('main_folder_id')->toArray(); 
        $main_folders_list = MainFolder::with('getSubFolder')->orderBy('name')->get();
        if(Auth::user()->role_type_id != 1){
            if(!in_array($decrypt_id, $main_folder_assigned_permissions)){
                return view('errors.405');
            }
        }
        $main_folder = MainFolder::where('id', $decrypt_id)->first();
        if(Auth::user()->role_type_id != 1){
            if($main_folder->status == 0){
                abort('404');
            }
        } 
        $sub_folder_ids = SubFolder::where('main_folder_id', $decrypt_id)->pluck('id')->toArray(); 
        if(Auth::user()->role_type_id == 1){
            $sub_folder_list = SubFolder::with('getDocument')->where('main_folder_id', $decrypt_id)->orderBy('name')->get(); 
        }else{
            $sub_folders = UserFolderPermission::with('getSubFolders')
            ->whereIn('sub_folder_id', $sub_folder_ids)
            ->where('user_id', Auth::user()->id)->pluck('sub_folder_id')->toArray(); 
            $sub_folder_list =  SubFolder::with('getDocument')->whereIn('id', $sub_folders)->where('status', 1)->orderBy('name')->get(); 
        }
        return view('backend.folders.index', compact(
            'sub_folder_list',
            'main_folder',
        ));
        }catch(\Exception $e){
            abort('404');
        }
    }

    public function store(Request $request, $id){
        $permission_check = UserPermission::where('user_id', Auth::user()->id)
        ->where('menu_id', 59)->exists();
        if($permission_check || Auth::user()->role_type_id == 1){
            $decrypt_id = Crypt::decrypt($id);
            $main_folder = MainFolder::where('id', $decrypt_id)->first();
            $check_s_folder = SubFolder::where('name', $request->folder_name)->where('main_folder_id', $main_folder->id)->exists();
            if($check_s_folder){
                return redirect()->back()->with('folder_already_exists', "The ".$request->folder_name." folder alredy exists .");
            }
            $folder = SubFolder::create([
                'main_folder_id' => $decrypt_id,
                'name' => $request->folder_name,
            ]);

            $folder_permission_list = FolderPermissionList::create([
                "name" => $request->folder_name,
                "main_folder_id" => $decrypt_id,
                "sub_folder_id" => $folder->id,
                "group_name" => $main_folder->name,
                "group_id" => $decrypt_id 
            ]);
            UserFolderPermission::create([
                "sub_folder_id" => $folder->id,
                "user_id" => 1,
                "status" => 1
            ]);
            if(Auth::user()->role_type_id != 1){
            UserFolderPermission::create([
                "sub_folder_id" => $folder->id,
                "user_id" => Auth::user()->id,
                "status" => 1
            ]);
        }
        return redirect('/admin/folders/' . $id)->with('success', 'Sub Folder Store Successfully');
        }else{
            return view('errors.405');
        } 
    }

    public function viewDocList($main_folde_id, $sub_folder_id){
        try{
        $decrypt_main_folder_id = Crypt::decrypt($main_folde_id);
        $decrypt_sub_folder_id = Crypt::decrypt($sub_folder_id);
        $check_permission = UserFolderPermission::where('sub_folder_id', $decrypt_sub_folder_id)
        ->where('user_id', Auth::user()->id)->exists();
        $documents = Document::with('getOwner')->where('main_folder_id', $decrypt_main_folder_id)
        ->where('sub_folder_id', $decrypt_sub_folder_id); 
        if($check_permission || Auth::user()->role_type_id == 1){
            $main_folder = MainFolder::where('id', $decrypt_main_folder_id)->first();
            $sub_folder = SubFolder::where('id', $decrypt_sub_folder_id)->first();  
             if(Auth::user()->role_type_id != 1){ 
            if($main_folder->status == 0){
                abort('404');
             }
             if($sub_folder->status == 0){
                abort('404');
             }
            }

            if(Auth::user()->role_type_id == 2){
                $user_ids = User::where('head_department_id', Auth::user()->id)->pluck('id')->toArray();
                $user_ids[] = Auth::user()->id;
                $documents = $documents->where(function ($query) use ($user_ids) {
                    $query->whereIn('owner_id', $user_ids)
                        ->orWhereJsonContains('assigned_users', Auth::user()->id);
                });
            }
            if(Auth::user()->role_type_id == 5){
                $user_ids = User::where('manager_id', Auth::user()->id)->pluck('id')->toArray();
                $user_ids[] = Auth::user()->id;
                    $documents = $documents->where(function ($query) use ($user_ids) {
                        $query->whereIn('owner_id', $user_ids)
                            ->orWhereJsonContains('assigned_users', Auth::user()->id);
                    });
            }
            if(Auth::user()->role_type_id == 6){
                $user_ids = User::where('team_leader_id', Auth::user()->id)
                ->pluck('id')->toArray();
                $user_ids[] = Auth::user()->id;
                // $documents = $documents->whereIn('owner_id', $user_ids);    
                $documents = $documents->where(function ($query) use ($user_ids) {
                    $query->whereIn('owner_id', $user_ids)
                        ->orWhereJsonContains('assigned_users', Auth::user()->id);
                });
            } 
            if(Auth::user()->role_type_id == 7){
                $documents = $documents->WhereJsonContains('assigned_users', Auth::user()->id)
                ->orWhere('owner_id', Auth::user()->id);
            }
            $documents = $documents->orderBy('id', 'desc')->paginate(10);  
            
            return view('backend.folders.doc_list', compact('documents', 
            'main_folder', 'sub_folder',
            'main_folde_id', 'sub_folder_id', 'decrypt_main_folder_id', 'decrypt_sub_folder_id'));
            }else{
                return view('errors.405');  
            }
        }catch(\Exception $e){
            abort('404');
        }
    }

    public function DeleteSubFolder($m_id, $s_id){
        $permission_check = UserPermission::where('user_id', Auth::user()->id)->where('menu_id', 65)->exists();
        if($permission_check || Auth::user()->role_type_id == 1){ 
            $decrypt_m_id = Crypt::decrypt($m_id);
            $decrypt_s_id = Crypt::decrypt($s_id);
            $document = Document::where('sub_folder_id', $decrypt_s_id)->exists();
            if($document){
                return redirect()->back()->with('in_used', 'Please Delete all document first from this folder.');
            }else{
                SubFolder::where('id', $decrypt_s_id)->delete();
                FolderPermissionList::where('sub_folder_id', $decrypt_s_id)->delete();
                return redirect()->back()->with('deleted', 'Sub Folder has been deleted.');
            }
        }else{
            return view('errors.405');
        }
    }

    public function mainFolderList(){
        $main_folder_assigned_permissions = UserMainFolderPermission::
        where('user_id', Auth::user()->id)->pluck('main_folder_id')->toArray(); 
        $main_folders_list = MainFolder::with('getSubFolder')->orderBy('name');
        if(Auth::user()->role_type_id != 1){
            $main_folders_list = $main_folders_list->where('status', 1);
        }

        $main_folders_list = $main_folders_list->get();
        // foreach($main_folders_list as $main_folder){
        //     if(in_array($main_folder->id, $main_folder_assigned_permissions)){
        //         return view('errors.405');
        //     }
        // } 
         
        return view('backend.folders.main_folder_list', compact('main_folder_assigned_permissions', 'main_folders_list'));
    }
    
    public function deleteMainFolder(Request $request){  
        try{
            $permission_check = UserPermission::where('user_id', Auth::user()->id)->where('menu_id', 65)->exists();
        if($permission_check || Auth::user()->role_type_id == 1){
            $main_folder_id = $request->id;  
            $s_folder = SubFolder::where('main_folder_id', $main_folder_id)->exists();
                if($s_folder){
                    return response()->json([
                        "status" => "warning",
                        "message" => "Please Delete all sub folder first from this folder"
                    ]);
                }else{
                    MainFolder::where('id', $main_folder_id)->delete(); 
                    MainFolderPermissionList::where('main_folder_id', $main_folder_id)->delete(); 
                    return response()->json([
                        "status" => "deleted",
                        "message" => "Main Folder has been deleted"
                    ]); 
                }
            }else{
                return response()->json([
                    "status" => "permission_denied", 
                ]); 
                // return view('errors.405');
            }
        }catch(\Exception $e){
            return response()->json([
                "status" => "failed",
                "error" => $e->getMessage()
            ]);
        }
        

    }

    // public function viewDocFolder($id){
        // $folder = DepartmentType::with('folders')->where('id', $id)->first();
        // return view('backend.all_document.viewDocumentSubFolder' , compact('folder'));
    // }

    // public function docView(){
        // return view('backend.all_document.viewDocFile');
    // }

    // public function viewFolderData(){
        //return view('backend.all_document.view_folder_data');
    // }

    // public function folderStore(Request $request){
        // $permission_check = UserPermission::where('user_id', Auth::user()->id)
        //     ->where('menu_id', 60)
        //     ->exists();
        // if ($permission_check) {
        //     $folder = Folder::create([
        //         'department_type_id' => $request->department_type_id,
        //         'folder_name' => $request->folder_name,
        //     ])     //     return redirect('/admin/folders')->with('success', 'Sub Folder Store Successfully');
        // } else {
        //     return response()->view('errors.405', [], 405);
        // }
    // }

    public function updateMainFolderStatus(Request $request){
        try{ 
            $id = $request->id;
            $status = $request->status;
            MainFolder::where('id', $id)->update([
                "status" => $status
            ]);
            return response()->json([
                "status" => "success",
            ]);
        }catch(\Exception $e){
            return response()->json([
                "status" => "failed",
                "error" => $e->getMessage()
            ]);
        }
    }
    public function updateSubFolderStatus(Request $request){
        try{ 
            $id = $request->id;
            $status = $request->status;
            SubFolder::where('id', $id)->update([
                "status" => $status
            ]);
            return response()->json([
                "status" => "success",
            ]);
        }catch(\Exception $e){
            return response()->json([
                "status" => "failed",
                "error" => $e->getMessage()
            ]);
        }
    }

}
