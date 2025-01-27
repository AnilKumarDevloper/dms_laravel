<?php

namespace App\Http\Controllers\backend;

use App\Http\Controllers\Controller;
use App\Models\backend\Hotel;
use App\Models\backend\UserHierarchy;
use App\Models\User;
use Crypt;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\Rules;


class HotelController extends Controller
{
    public function index(){
        $hotels = User::
        with(['getUserHierarchie.getHeadDepartment.getDepartmentType', 'getHotelFromHotel']);
        if(Auth::user()->role_type_id != 1){
            $hotels = $hotels->whereHas('getUserHierarchie.getHeadDepartment', function($query){
                $query = $query->where('head_department_id', Auth::user()->id);
            });
        }
        $hotels = $hotels->where('role_type_id', 3)->get(); 
        return view('backend.hotels.index', compact( 'hotels'));
    }

    public function create(){  
        $head_departments = User::
        with('getDepartmentType')
        ->where('role_type_id', 2);
        if(Auth::user()->role_type_id != 1){ 
            $head_departments = $head_departments->where('department_type_id', Auth::user()->department_type_id);
        } 
        $head_departments = $head_departments->get(); 
        return view('backend.hotels.create', compact('head_departments'));
    }
    public function store(Request $request){
        // try{ 
       $validate = $request->validate([
            'name' => ['required', 'string', 'max:255'],
            'email' => ['required', 'string', 'lowercase', 'email:dns', 'max:255', 'unique:'.User::class],
            'phone' => ['required', 'digits:10', 'unique:'.User::class], 
        ]); 
        $hotel_name = $request->name;
        $hotel_location = $request->hotel_location; 
        $email = $request->email;
        $phone = $request->phone;
        $department_id = $request->head_department;
        $password = Hash::make($request->email);

        $user = User::create([
            "name" => $hotel_name,
            "email" => $email,
            "phone" => $phone,
            "password" => $password,
            "role_type_id" => 3,
            "created_by" => Auth::user()->id,
            "status" => 1
        ]);
        UserHierarchy::create([
            "user_id" => $user->id,
            "head_department_id" => $department_id,
            "status" => 1
        ]); 
        $newHotel = Hotel::create([
            'name'=> $hotel_name,
            'location'=> $hotel_location,
            'user_id' => $user->id,
            'status' => 1
        ]);

        // permissions:- dashboard, department, documents, employees
        return redirect()->route('backend.hotel.index')->with('success', "Hotel has been added successfully");
    // }catch(\Exception $e){
    //     return $e->getMessage();
    // } 
    }


    public function edit($id){
        try{

        
        $decrypt_id = Crypt::decrypt($id);
        $head_departments = User::with('getDepartmentType')->where('role_type_id', 2)->where('status', 1)->get();
        $hotel = User::with('getUserHierarchie', 'getHotelFromHotel')->where('id', $decrypt_id)->first();
        return view('backend.hotels.edit', compact('head_departments', 'hotel'));
    }catch(\Exception $e){
        abort('404');
    }
}

    public function update(Request $request, $id){

        $request->validate([
            'name' => ['required', 'string', 'max:255'],
            'email' => ['required', 'string', 'lowercase', 'email', 'max:255'],
            'phone' => ['required', 'numeric', 'digits:10'],
            'head_department' => ['required'], 
        ]);

        $hotel_name = $request->name;
        $hotel_location = $request->hotel_location; 
        $email = $request->email;
        $phone = $request->phone;
        $department_id = $request->head_department;

        $user = User::where('id', $id)->update([
            "name" => $hotel_name,
            "email" => $email,
            "phone" => $phone,    
        ]);
        UserHierarchy::where('user_id', $id)->update([ 
            "head_department_id" => $department_id, 
        ]);
        $newHotel = Hotel::where('user_id', $id)->update([
            'name'=> $hotel_name,
            'location'=> $hotel_location, 
        ]);

        if($request->new_pasword != ''){
            $newUser = User::where('id', $id)->update([
                'password' => Hash::make($request->new_pasword), 
            ]);
        }

        return redirect()->route('backend.hotel.index')->with('success', "Hotel has been updated successfully");
 
    }

    public function updateStatus(Request $request){
        $id = $request->id;
        $status = $request->status;
        Hotel::where('id', $id)->update([
            'status' => $status
        ]);
        return response()->json([
            'status' => 200,
            'message' => "success"
        ]);
    }
 


    public function destroy($id){
        try{
            $decrypt_id = Crypt::decrypt($id);
            if(Auth::user()->role_type_id == 1){
                $user = UserHierarchy::where('hotel_id', $decrypt_id)->exists();
                if($user){
                    return redirect()->back()->with('already_in_use', 'This hotel has user you cant delete directly');
                }
                User::where('id', $decrypt_id)->delete();
                return redirect()->back()->with('deleted', "Hotel has been deleted successfully");
            }else{
                return response()->view('errors.405', [], 405);
            }
        }catch(\Exception $e){
            abort('404');
        }
    }

}
