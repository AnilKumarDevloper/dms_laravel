<?php

namespace App\Http\Controllers\backend;

use App\Http\Controllers\Controller;
use App\Models\backend\Menu;
use App\Models\backend\UserPermission;
use App\Models\User;
use Crypt;
use Illuminate\Http\Request;

class CustomPermissionController extends Controller{
    public function assignCustomPermission($id){ 
        try{ 
            $decrypt_id= Crypt::decrypt($id);
            $employee = User::findOrFail($decrypt_id); 
            $menus = Menu::all()->where('status',1)->groupBy(['order_id', 'group_name']);
            $permission_list = UserPermission::where('user_id', $decrypt_id)->pluck('menu_id')->toArray();
            return view('backend.employee.assign_permission', compact('employee', 'menus', 'permission_list'));
        }catch(\Exception $e){
            abort(404);
        }
    }

    public function syncCustomPermission(Request $request){
        $user_id = $request->user_id;
        $new_permissions = $request->permission_ids;
        UserPermission::where('user_id', $user_id)->delete(); 
        if($new_permissions != null){
            foreach($new_permissions as $permission){
                UserPermission::create([
                    'menu_id' => $permission,
                    'user_id' => $user_id,
                    'status' => 1
                ]);
            }
        }
        return redirect()->back()->with('updated', 'Permission has been updated !');
    }
}
