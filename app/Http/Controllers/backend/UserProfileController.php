<?php

namespace App\Http\Controllers\backend;

use App\Http\Controllers\Controller;
use App\Models\User;
use Auth;
use Hash;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;
use Illuminate\Validation\Rules;

class UserProfileController extends Controller
{
    public function index(){
        $user = User::with(['roleType', 'getDepartmentType', 'getHead', 'getUnit', 'getManager', 'getTeamLeader'])->where('id', Auth::user()->id)->first();
        return view('backend.user_profile.index', compact('user'));
    }

    public function update(Request $request){
         
        $validate = $request->validate([
            "f_name" => ['required'], 
            "l_name" => ['required'], 
            "phone" => ['required', 'numeric', 'digits:10', Rule::unique(User::class)->ignore(Auth::user()->id)],
        ]); 
        $f_name = $request->f_name; 
        $l_name = $request->l_name; 
        $phone = $request->phone; 
        if($request->new_password != ''){
            $validate = $request->validate([ 
                "new_password" => [Rules\Password::defaults()],
            ]); 
            User::where('id', Auth::user()->id)->update([
                "password" => Hash::make($request->new_password)
            ]);
        } 
        User::where('id', Auth::user()->id)->update([
            "first_name" => $f_name, 
            "last_name" => $l_name, 
            "name" => $f_name.' '.$l_name, 
            "phone" => $phone
        ]); 
        
        if($request->hasFile('profile_image')){
            $profile_name = time().'.'.$request->file('profile_image')->getClientOriginalExtension();
            $request->file('profile_image')->move(public_path('assets/backend/assets/images/upload/profile_image'), $profile_name);
            User::where('id', Auth::user()->id)->update([
                "profile_image" => $profile_name
            ]);
        }   
        return redirect()->back()->with("profile_updated", "Profile has been updated successfully.");
    } 
    
}
