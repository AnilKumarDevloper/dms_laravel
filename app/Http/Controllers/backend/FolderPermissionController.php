<?php

namespace App\Http\Controllers\backend;

use App\Http\Controllers\Controller;
use App\Mail\AllFolderPermissionAlertMail;
use App\Mail\DocumentUploadPermissionAlertMail;
use App\Mail\SingleFolderPermissionAlertMail;
use App\Models\backend\DepartmentType;
use App\Models\backend\FileUploadPermission;
use App\Models\backend\Folder;
use App\Models\backend\FolderPermissionList;
use App\Models\backend\FolderPermission;
use App\Models\backend\MainFolder;
use App\Models\backend\MainFolderPermissionList;
use App\Models\backend\SubFolder;
use App\Models\backend\UserFolderPermission;
use App\Models\backend\UserMainFolderPermission;
use App\Models\User;
use Auth;
use Illuminate\Http\Request;
use Crypt;
use Mail;
 
// Used table for folder permissions
// MainFolderPermissionList
// UserMainFolderPermission
// UserFolderPermissionList
// UserFolderPermission


class FolderPermissionController extends Controller{
    public function assignFolderPermission($user_id){
        try{
        $decrypt_user_id= Crypt::decrypt($user_id);
        $user = User::where('id', $decrypt_user_id);
        // if(Auth::user()->role_type_id != 1){
        //     $user = $user->where('head_department_id', Auth::user()->head_department_id);
        // }
        $user = $user->first(); 
        // if($user){
            $main_folder_permission_list = MainFolderPermissionList::all();
            $sub_folder_permission_list = FolderPermissionList::all();
            $user_main_folder_assigned_permission_list = UserMainFolderPermission::where('user_id', $decrypt_user_id)->pluck('main_folder_id')->toArray();
            $user_folder_assigned_permission_list = UserFolderPermission::where('user_id', $decrypt_user_id)->pluck('sub_folder_id')->toArray();
                 
            return view('backend.folder_permission.assign_folder_permission', compact(
                'user', 'sub_folder_permission_list', 'main_folder_permission_list', 
                'user_main_folder_assigned_permission_list',
                'user_folder_assigned_permission_list'));
                
            // }else{
            //     return response()->view('errors.405', [], 405);
            // }
        }catch(\Exception $e){
            // return $e->getMessage();
            abort(404, 'Invalid User ID');
        }
    }

    public function syncFolderPermission(Request $request){
        $user_id = Crypt::decrypt($request->user_id);
        $user = User::where('id', $user_id)->first();
        $user_email = $user->email;
        // if($user_id != 1){
        $main_folder_permission_ids = $request->main_folder_permission_ids;
        $sub_permission_ids = $request->sub_permission_ids;
        $existingMainfolder = UserMainFolderPermission::where('user_id', $user_id)
        ->where('access_given_by', Auth::user()->id)->pluck('main_folder_id')->toArray();
        $existingSubfolder = UserFolderPermission::where('user_id', $user_id)
        ->where('access_given_by', Auth::user()->id)->pluck('sub_folder_id')->toArray();
        UserMainFolderPermission::where('user_id', $user_id)->delete();
        UserFolderPermission::where('user_id', $user_id)->delete();

        if($main_folder_permission_ids != null){ 
            foreach($main_folder_permission_ids as $permission){ 
                UserMainFolderPermission::create([
                    'main_folder_id' => $permission,
                    'user_id' => $user_id,
                    'access_given_by' => Auth::user()->id,
                    'status' => 1
                ]);
            }
            if($sub_permission_ids != null){
                foreach($sub_permission_ids as $permission){
                    UserFolderPermission::create([
                        'sub_folder_id' => $permission,
                        'user_id' => $user_id,
                        'access_given_by' => Auth::user()->id,
                        'status' => 1
                    ]);
                }
            } 
        } 
        $all_folder_permission_alert_data = [
            "user_name" => $user->first_name .' '. $user->last_name,
            "sub_folders" => $sub_permission_ids,
            "main_folders" => $main_folder_permission_ids
        ];
        Mail::to($user_email)->send(new AllFolderPermissionAlertMail($all_folder_permission_alert_data));

        return redirect()->back()->with('updated', 'Permission has been updated !'); 
        // }else{
        //     return response()->view('errors.405', [], 405);  
        // }
    }

    public function AssignFolderPermissionDirect($m_folder, $s_folder){ 
        try{
        $decrypt_m_folder = Crypt::decrypt($m_folder);
        $decrypt_s_folder = Crypt::decrypt($s_folder); 
        $main_folder = MainFolder::where('id', $decrypt_m_folder)->first();
        $sub_folder = SubFolder::where('id', $decrypt_s_folder)->first(); 
        $users = User::select('*')->where('role_type_id', '!=', 1)
        ->where('id', '!=', Auth::user()->id);
// -------------------
            // if(Auth::user()->role_type_id == 2){
            //     $users = $users->where('head_department_id', Auth::user()->id);
            // }
            if(Auth::user()->role_type_id == 5){
                $users = $users->where('manager_id', Auth::user()->id);
            }
            if(Auth::user()->role_type_id == 6){
                $users = $users->where('team_leader_id', Auth::user()->id);
            }
// ------------------- 
        $users = $users->get(); 
        $assigned_users = UserFolderPermission::where('sub_folder_id', $decrypt_s_folder)
        ->where('access_given_by', Auth::user()->id)
        ->where('user_id', '!=', 1)->pluck('user_id')->toArray();
        
        $assigned_users_upload_access = FileUploadPermission::where('main_folder_id', $decrypt_m_folder)
        ->where('sub_folder_id', $decrypt_s_folder)
        ->where('access_given_by', Auth::user()->id)
        ->pluck('user_id')->toArray(); 

        return view('backend.folder_permission.assign_direct_permisssion', 
        compact('main_folder', 'sub_folder', 'users', 'assigned_users', 
        'assigned_users_upload_access'));
        }catch(\Exception $e){
            abort('404');
        }
    }

    public function SyncFolderPermissionDirect(Request $request){
        $m_folder_id = $request->m_folder_id;
        $s_folder_id = $request->s_folder_id;
        // return $s_folder_id;
        $users = $request->users; 
        
        $existing_user = UserFolderPermission::where('sub_folder_id', $s_folder_id)
        ->where('access_given_by', Auth::user()->id)->pluck('user_id')->toArray();
       
        // return $existing_user; 
        $folder_detail = SubFolder::with('getMainFolder')->where('id', $s_folder_id)->first();
        
        if($users == null){
            foreach($existing_user as $userId){ 
                $sub_folder_existence = UserFolderPermission::where('sub_folder_id', $s_folder_id)
                ->where('access_given_by', Auth::user()->id)->where('user_id', $userId)->delete();

                $getUser = User::where('id', $userId)->first();
                $single_folder_permission_alert_data = [
                 "user_name" => $getUser->first_name.' '. $getUser->last_name,
                 "message" => "We regret to inform you that your access to this folder has been revoked. You no longer have permission to view its contents",
                 "status" => 'denied',
                 "main_folder" => $folder_detail->getMainFolder?->name,
                 "sub_folder" => $folder_detail->name,
             ];
             Mail::to($getUser->email)->send(new SingleFolderPermissionAlertMail($single_folder_permission_alert_data));
            }
            return redirect()->back()->with('foler_permission_synced', 'Folder Permission has been updated successfully.');
        }
 
        $main_folder_existence = UserMainFolderPermission::where('main_folder_id', $m_folder_id)
        ->where('access_given_by', Auth::user()->id)->delete();

        $sub_folder_existence = UserFolderPermission::where('sub_folder_id', $s_folder_id)
        ->where('access_given_by', Auth::user()->id)->delete();

        $folder_detail = SubFolder::with('getMainFolder')->where('id', $s_folder_id)->first();
        
        foreach($existing_user as $userId){
            if(!in_array($userId, $users)){
               // removed user
               $getUser = User::where('id', $userId)->first(); 
               $single_folder_permission_alert_data = [
                "user_name" => $getUser->first_name.' '. $getUser->last_name,
                "message" => "We regret to inform you that your access to this folder has been revoked. You no longer have permission to view its contents",
                "status" => 'denied',
                "main_folder" => $folder_detail->getMainFolder?->name,
                "sub_folder" => $folder_detail->name,
            ];
            Mail::to($getUser->email)->send(new SingleFolderPermissionAlertMail($single_folder_permission_alert_data));
            }
        }

        foreach($users as $user){
            if(!in_array($user, $existing_user)){
                // new added user 
                $getUser = User::where('id', $user)->first(); 
                $single_folder_permission_alert_data = [ 
                    "user_name" => $getUser->first_name.' '. $getUser->last_name,
                    "message" => "We are pleased to inform you that you have been granted access to this folder. You can now view its contents" ,
                    "status" => 'granted',
                    "main_folder" => $folder_detail->getMainFolder?->name,
                    "sub_folder" => $folder_detail->name,
                ];
                Mail::to($getUser->email)->send(new SingleFolderPermissionAlertMail($single_folder_permission_alert_data));
            }

            // $main_folder_existence = UserMainFolderPermission::where('main_folder_id', $m_folder_id)->where('user_id', $user)->exists();
            // $sub_folder_existence = UserFolderPermission::where('sub_folder_id', $s_folder_id)->where('user_id', $user)->exists();
            // if(!$main_folder_existence){
                UserMainFolderPermission::create([
                    'main_folder_id' => $m_folder_id,
                    'user_id' => $user,
                    "access_given_by" => Auth::user()->id
                ]);
            // }

            // if(!$sub_folder_existence){
                UserFolderPermission::create([
                    'sub_folder_id' => $s_folder_id,
                    'user_id' => $user,
                    "access_given_by" => Auth::user()->id
                ]);
            // }

        }
        return redirect()->back()->with('foler_permission_synced', 'Folder Permission has been updated successfully.');
    }

    //this function is for insert all permission record in folder permission table remove after use "createFolderPermissionTest()"
    public function createFolderPermissionTest(){
        $main_folders = MainFolder::get();
        // foreach($main_folders as $main){
        //     MainFolderPermissionList::create([
        //                     "name" => $main->name,
        //                     "main_folder_id" => $main->id,
        //                     "group_name" => $main->name,
        //                     "group_id" => $main->id,  
        //                 ]);
        // }

        // foreach($main_folders as $main){
        //     $sub_folders = SubFolder::where('main_folder_id', $main->id)->get();
        //     foreach($sub_folders as $sub){
        //         $department = DepartmentType::where('name', $main->name)->first()->id;
        //         FolderPermissionList::create([
        //             "name" => $sub->name,
        //             "main_folder_id" => $main->id,
        //             "sub_folder_id" => $sub->id,
        //             "department_type_id" => $department,
        //             "group_name" => $main->name,
        //             "group_id" => $main->id,
        //             "status" => 1
        //         ]);
                
        //     }
        // }
        $folder_per = FolderPermissionList::get();
        return $folder_per;  
    }
 
        public function SyncFileUploadAccess(Request $request){
            $m_id = $request->m_folder_id;
            $s_id = $request->s_folder_id;
            $users = $request->users;   
            $existingUsers = FileUploadPermission::where('main_folder_id', $m_id)
            ->where('sub_folder_id', $s_id)->where('access_given_by', Auth::user()->id)
            ->pluck('user_id')->toArray(); 
            FileUploadPermission::where('main_folder_id', $m_id)
            ->where('sub_folder_id', $s_id)->where('access_given_by', Auth::user()->id)->delete();
            $folder_detail = SubFolder::with('getMainFolder')->where('id', $s_id)->first();
            if($users == null){
                foreach($existingUsers as $userId){
                    FileUploadPermission::where('main_folder_id', $m_id)->where('user_id', $userId)
                    ->where('sub_folder_id', $s_id)->where('access_given_by', Auth::user()->id)
                    ->delete();
                    $getUser = User::where('id', $userId)->first(); 
                    $document_upload_permission_alert_mail_data = [
                     "user_name" => $getUser->first_name.' '. $getUser->last_name,
                     "message" => "We are notifying you that your upload permissions for a specific folder have been removed. You no longer have access to upload documents to this folder.",
                     "status" => 'denied',
                     "main_folder" => $folder_detail->getMainFolder?->name,
                     "sub_folder" => $folder_detail->name, 
                 ];
                     Mail::to($getUser->email)->send(new DocumentUploadPermissionAlertMail($document_upload_permission_alert_mail_data));
                }
                return redirect()->back()->with('folder_permission_synced', 'File Permission has been updated.'); 
            } 
            foreach($existingUsers as $userId){
            if(!in_array($userId, $users)){
               // removed user
               $getUser = User::where('id', $userId)->first(); 
               $document_upload_permission_alert_mail_data = [
                "user_name" => $getUser->first_name.' '. $getUser->last_name,
                "message" => "We are notifying you that your upload permissions for a specific folder have been removed. You no longer have access to upload documents to this folder.",
                "status" => 'denied',
                "main_folder" => $folder_detail->getMainFolder?->name,
                "sub_folder" => $folder_detail->name, 
            ];
                Mail::to($getUser->email)->send(new DocumentUploadPermissionAlertMail($document_upload_permission_alert_mail_data));
            }
        } 
        foreach($users as $user){ 
            if(!in_array($user, $existingUsers)){
                // new added user 
                $getUser = User::where('id', $user)->first(); 
                $document_upload_permission_alert_mail_data = [ 
                    "user_name" => $getUser->first_name.' '. $getUser->last_name,
                    "message" => "We are notifying you that you have been granted upload permissions for a specific folder. You can now upload documents to this folder." ,
                    "status" => 'granted',
                    "main_folder" => $folder_detail->getMainFolder?->name,
                    "sub_folder" => $folder_detail->name,
                ];
                Mail::to($getUser->email)->send(new DocumentUploadPermissionAlertMail($document_upload_permission_alert_mail_data));
            } 
            FileUploadPermission::create([
                'main_folder_id' => $m_id,
                'sub_folder_id' => $s_id,
                'user_id' => $user,
                'access_given_by' => Auth::user()->id
            ]);
        } 
        return redirect()->back()->with('folder_permission_synced', 'File Permission has been updated.'); 
    }

 
}
