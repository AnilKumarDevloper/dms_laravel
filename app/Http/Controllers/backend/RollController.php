<?php

namespace App\Http\Controllers\backend;

use App\Http\Controllers\Controller;
use App\Models\backend\RoleType;
use App\Models\User;
use Illuminate\Http\Request;
use Spatie\Permission\Models\Role;

class RollController extends Controller
{
  

    // public function index(){
    //     $rolls = Role::all();
    //     return view('backend.roll_and_permission.roll.index', compact('rolls'));
    // }
    // public function create(){
    //     return view('backend.roll_and_permission.roll.create');
    // }
    // public function store(Request $request){
    //  Role::create(['name' => $request->roll_name])   ;
    //  return redirect()->back();        
    // }

    // public function assignRollStore(Request $request){
    //     $user = User::where('id', $request->user_id)->first();
    //     $user->assignRole($request->roll_name); 
    //     return redirect()->back();
    // } 
    // public function assignRollView(){
    //     $rolls = Role::all();
    //     $users = User::all();
    //     return view('backend.roll_and_permission.roll.assign_roll', compact('rolls', 'users'));
    // }
}
