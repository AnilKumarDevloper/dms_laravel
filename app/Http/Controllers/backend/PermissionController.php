<?php

namespace App\Http\Controllers\backend;

use App\Http\Controllers\Controller;
use App\Models\User;
use Illuminate\Http\Request;
use Spatie\Permission\Models\Permission;
use Spatie\Permission\Models\Role;

class PermissionController extends Controller
{
    public function index(){
        $permissions = Permission::all();
        return view('backend.roll_and_permission.permission.index', compact('permissions'));
    }
    public function create(){ 
        return view('backend.roll_and_permission.permission.create');
    }
    public function store(Request $request){  
        Permission::create(['name' => $request->permission_name]);
        return redirect()->back();
    }
 
    public function assignPermissionStore(Request $request){
        $role = Role::findOrFail($request->role_id);
        $role->syncPermissions($request->permissions); 
        return redirect()->back();
    }
    
    public function assignPermissionView(){
        $permissions = Permission::all();
        $roles = Role::all();
        return view('backend.roll_and_permission.permission.assign_permission', compact('permissions', 'roles'));
    }
}
