<?php

namespace App\Http\Controllers\backend;

use App\Http\Controllers\Controller;
use App\Mail\SendPasswordToAdminMail;
use App\Models\backend\Unit;
use App\Models\backend\UserHierarchy;
use App\Models\backend\UserPermission;
use App\Models\User;
use Crypt;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\Rules;
use Mail;


class HotelDepartmentController extends Controller
{
    public function index(){ 
        $hotel_departments = User::with(['getUserHierarchie.getHeadDepartment.getDepartmentType', 'getUserHierarchie.getHotel', 'getUnit']);
        if(Auth::user()->role_type_id != 1){
            $hotel_departments = $hotel_departments->whereHas('getUserHierarchie.getHeadDepartment', function($query){
                $query = $query->where('head_department_id', Auth::user()->id);
            });
        }
        $hotel_departments = $hotel_departments->where('role_type_id', 4)->get();
        return view('backend.hotel_department.index', compact('hotel_departments'));
    }

    public function create(){ 
        if(Auth::user()->role_type_id == 1){
            $heade_departments = User::with('getDepartmentType')->where('role_type_id', 2)->where('status', 1)->get();
            $hotels = User::where('role_type_id', 3)->where('status', 1)->get();
            return view('backend.hotel_department.create', compact('heade_departments', 'hotels'));
        }elseif(Auth::user()->role_type_id == 2){
            $heade_departments = User::with('getDepartmentType')->where('id', Auth::user()->id)->where('status', 1)->get();
            $hotels = Unit::where('department_id', Auth::user()->id)->get();
            return view('backend.hotel_department.create', compact('heade_departments', 'hotels'));
        }
        else{
            return response()->view('errors.405', [], 405);
        }
    }

    public function store(Request $request){ 
        $request->validate([
            'name' => ['required', 'string', 'max:255'],
            'email' => ['required', 'string', 'lowercase', 'email', 'max:255', 'unique:'.User::class],
            'phone' => ['required', 'numeric', 'digits:10', 'unique:'.User::class], 
            'head_department' => ['required'],
            'hotel' => ['required'],
        ]);
        $name = $request->name; 
        $email = $request->email;
        $phone = $request->phone;
        $heade_department_id = $request->head_department;
        $hote_id = $request->hotel;
        $randompassword = substr(str_shuffle('0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz'), 0, 10);
        $password = Hash::make($randompassword);
        $user = User::create([
            "name" => $name,
            "email" => $email,
            "phone" => $phone,
            "password" => $password,
            "role_type_id" => 4,
            "created_by" => Auth::user()->id,
            'unit_id' => $hote_id,
            "status" => 1
        ]);
        UserHierarchy::create([
            "user_id" => $user->id,
            "head_department_id" => $heade_department_id,
            "hotel_id" => $hote_id,
            "status" => 1
        ]);

        $user_detail_mail_data = [
            "message" => "Email Message",
            "name" => $name,
            "email" => $email,
            "phone" => $phone,
            "password" => $randompassword,
            "login_url" => route('login')
        ];
        $admin_email = User::where('role_type_id', 1)->first();
        Mail::to($admin_email->email)->send(new SendPasswordToAdminMail($user_detail_mail_data));
        Mail::to($email)->send(new SendPasswordToAdminMail($user_detail_mail_data));
        return redirect()->route('backend.hotel_department.index')->with('success', "Hotel Department has been added successfully");
    }

    public function edit($id){
        try{
            $decrypt_id = Crypt::decrypt($id); 
            if(Auth::user()->role_type_id == 1){
                $hotel_department = User::where('id', $decrypt_id)->with(['getUserHierarchie.getHeadDepartment', 'getUserHierarchie.getHotel'])->first();
                $head_departments = User::with('getDepartmentType')->where('role_type_id', 2)->where('status', 1)->get();
                $hotels = User::where('role_type_id', 3)->where('status', 1)->get();
                return view('backend.hotel_department.edit', compact('hotel_department', 'head_departments', 'hotels'));                
            }else{
                return response()->view('errors.405', [], 405);
            }
        }catch(\Exception $e){
            abort('404');
        }
    }

    public function update(Request $request, $id){
        try{ 
            $request->validate([
                'name' => ['required', 'string', 'max:255'],
                'email' => ['required', 'string', 'lowercase', 'email:dns', 'max:255'],
                'phone' => ['required', 'numeric', 'digits:10'],
                'head_department' => ['required'],
                'hotel' => ['required'],
            ]);   
            $name = $request->name; 
            $phone = $request->phone;
            $head_department_id = $request->head_department;
            $hotel_id = $request->hotel;
            $email = $request->email;
            $decrypt_id = Crypt::decrypt($id); 
            User::where('id', $decrypt_id)->update([
                "name" => $name, 
                "phone" => $phone,
                "email" => $email,
            ]);
            UserHierarchy::where('user_id', $decrypt_id)->update([
                "head_department_id" => $head_department_id,
                "hotel_id" => $hotel_id
            ]); 
            if($request->new_pasword != ''){
                User::where('id', $decrypt_id)->update([
                    'password' => Hash::make($request->new_pasword), 
                ]);   
            }
            return redirect()->route('backend.hotel_department.index')->with("update", "Hotel Department has been successfully updated.");
        }catch(\Exception $e){
            return $e->getMessage();
            // abort('404');
        }
    }

    public function getHotelList(Request $request){ 
       $department_head = User::where('id', $request->head_department)->first();  
       $hotels = Unit::where('department_id', $department_head->id)->get();
       return response()->json([
        "status" => "success",
        "hotel_list" => $hotels
       ]);
    }

    public function destroy($id){
        try{
            $decrypt_id = Crypt::decrypt($id);
            if(Auth::user()->role_type_id == 1){
                $user = UserHierarchy::where('hoted_department_id', $decrypt_id)->exists();
                if($user){ 
                    return redirect()->back()->with('already_in_use', 'This Hotel Department has user you cant delete directly');
                }
                User::where('id', $decrypt_id)->delete();
                return redirect()->back()->with('deleted', "Hotel Department has been deleted successfully");
            }
            else{
                return response()->view('errors.405', [], 405);
            }
        }catch(\Exception $e){
            abort('404');
        }
    }

}
