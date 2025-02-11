<?php
namespace App\Http\Controllers\backend;
use App\Http\Controllers\Controller;
use App\Models\backend\MainFolderPermissionList;
use App\Models\backend\UserMainFolderPermission;
use App\Models\backend\UserPermission;
use App\Models\User;
use Crypt;
use DB;
use Illuminate\Http\Request;
use App\Models\backend\RoleType;
use App\Models\backend\{DepartmentType, MainFolder};
use Illuminate\Support\Facades\Auth;
class DepartmentController extends Controller{
    public function index(){
        $permission_check = UserPermission::where('user_id', Auth::user()->id)->where('menu_id', 38)->exists();
        if($permission_check){
        $roles = DepartmentType::orderBy('id', 'desc')->paginate(10);
        return view('backend.departments.index', compact('roles'));
        }else{
            return response()->view('errors.405', [], 405);
        }
    }

    public function getAllDepartmentList(){
        try{
            $permission_check = UserPermission::where('user_id', Auth::user()->id)->where('menu_id', 38)->exists();
            if($permission_check){
            $roles = DepartmentType::orderBy('id', 'desc')->get()->map(function ($role){
                return [
                    'id' => $role->id,
                    'encrypt_id' => Crypt::encrypt($role->id),
                    'name' => $role->name,
                    'short_name' => $role->short_name,
                    'user_id' => $role->user_id,
                    'status' => $role->status,
                ];
            });
            $role_type_id = Auth::user()->role_type_id;
            return response()->json([
                "status" => "success",
                "data" => $roles,
                "role_type_id" => $role_type_id
            ], 200);
             }else{
                return response()->json([
                    "status" => "permission_denied"
                ], 403);
            }
        }catch(\Exception $e){
            return response()->json([
                "status" => "failed",
                "error" => $e->getMessage()
            ] ,400);
        }
    }


    public function update(Request $request, $id){
        $validate = $request->validate([
            "department_full_name" => ['required'],
            "department_short_name" => ['required']
        ]);
        $permission_check = UserPermission::where('user_id', Auth::user()->id)->where('menu_id', 41)->exists();
        if($permission_check){
        $department_full_name = $request->department_full_name;
        $department_short_name = $request->department_short_name;
        DepartmentType::where('id', $id)->update([
            'name' => $department_full_name,
            'short_name' => $department_short_name,
        ]);
        return redirect()->route('backend.department.index')->with('update', "Department has been update successfully");
        }else{
            return response()->view('errors.405', [], 405);
        } 
    }

    public function edit($id){
        try{
            $decrypt_id = Crypt::decrypt($id); 
            $permission_check = UserPermission::where('user_id', Auth::user()->id)->where('menu_id', 41)->exists();
            if($permission_check){
            $role_name = DepartmentType::where('id', $decrypt_id)->first();
            return view('backend.departments.edit', compact('role_name'));
        }else{
            return response()->view('errors.405', [], 405);
        }
        }catch(\Exception $e){
            abort('404');
        }
    }
 
    public function store(Request $request){
        $validate = $request->validate([
            "department_full_name" => ['required', 'max:50'],
            "department_short_name" => ['required', 'max:10']
        ]); 
        $permission_check = UserPermission::where('user_id', Auth::user()->id)->where('menu_id', 41)->exists();
        if($permission_check){
            $name = $request->department_full_name;
            $short_name = $request->department_short_name; 
            $check_department = DepartmentType::where('name', $request->department_full_name)->exists();
            if($check_department){
                return redirect()->back()->with('already_exist', "The department with this name is already exists.");
            } 
            $lastGroupId = DB::table('main_folder_permission_lists')->max('group_id');  
            $newGroupId = $lastGroupId ? $lastGroupId + 1 : 1;
            $department = DepartmentType::create([
                'name' => $name,
                'short_name' => $short_name,
                'status' => 1
            ]);
            $main_folder = MainFolder::create([
                'name' => $name,
                'department_type_id' => $department->id
            ]);
            MainFolderPermissionList::create([
                'name' => $name,
                'main_folder_id' => $main_folder->id,
                'group_name' => $newGroupId,
                'status' => 1
            ]);
            UserMainFolderPermission::create([
                "main_folder_id" => $main_folder->id,
                "user_id" => 1,
                "status" => 1
            ]); 
            return redirect()->route('backend.department.index')->with('success', "New Department has been added successfully");
        }else{
            return response()->view('errors.405', [], 405);
        }
    }
 
    public function updateStatus(Request $request){
        try{
            $id = $request->id;
            $status = $request->status;
            DepartmentType::where('id', $id)->update([
                'status' => $status
            ]); 
            return response()->json([
                'status' => 200,
                'message' => "success"
            ], 200);
        }catch(\Exception $e){
            return response()->json([
                'status' => "failed",
                'error' => $e->getMessage()
            ], 400);
        }  
    }
    public function destroy(Request $request){
        try{
        $decrypt_id = $request->id;
        if(Auth::user()->role_type_id == 1){
            $user = User::where('department_type_id', $decrypt_id)->exists();
            if($user){
                return response()->json([
                    "status" => "already_in_use",
                    "message" => "This department has user you cant delete directly"
                ], 200);
             } 
            $main_folder = MainFolder::where('department_type_id', $decrypt_id)->exists();
            if($main_folder){
                return response()->json([
                    "status" => "already_in_use",
                    "message" => "Main Folder is using this department. You cant delete directly."
                ], 200);
             }
            DepartmentType::where('id', $decrypt_id)->delete();
            return response()->json([
                "status" => "success",
                "message" => "Department has been Deleted successfully"
            ], 200); 
        }else{
            abort('405'); 
        }
        }catch(\Exception $e){
            abort('404');
        }
    }
    
}
