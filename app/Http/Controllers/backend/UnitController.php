<?php

namespace App\Http\Controllers\backend;

use App\Http\Controllers\Controller;
use App\Models\backend\City;
use App\Models\backend\State;
use  App\Models\backend\Unit;
use App\Models\backend\UserHierarchy;
use App\Models\User;
use Auth;
use Crypt;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule; 
use Illuminate\Validation\Rules; 

class UnitController extends Controller{
    public function index(){ 
        $units = Unit::with('getDepartmentHead');
        if(Auth::user()->role_type_id != 1){
            $units = $units->where('department_id', Auth::user()->id);
        }   
        $units = $units->orderBy('id', 'desc')->paginate(10);
        return view('backend.unit.index', compact( 'units'));
    }

    public function create(){
        $head_departments = User::
        with('getDepartmentType')
        ->where('role_type_id', 2);  
        if(Auth::user()->role_type_id != 1){
            $head_departments = $head_departments->where('id', Auth::user()->id);
        }
        $head_departments = $head_departments->get();  
        $states = State::where('status', 1)->get();
        return view('backend.unit.create', compact('head_departments', 'states'));
    }
 
    public function store(Request $request){
        $validate = $request->validate([
            "name" => ['required'],
            "address" => ['required'],
            "state" => ['required'],
            "city" => ['required'],
        ]);
     
        $unit = Unit::where('name', $request->name)
        ->where('city', $request->city)->exists();   

        $state = State::where('id', $request->state)->first(); 

        if($unit){
            return redirect()->route('backend.unit.create')->with('already_exist', 'The Unit with this name and in this city is already exists.');
        }else{
            Unit::create([
                'name' => $request->name,
                "state" =>$state->name,
                "city" => $request->city,
                'location' => $request->address, 
                'created_by' => Auth::user()->id
            ]);
        }
        return redirect()->route('backend.unit.index')->with('created', 'Unit has been created.');
    }

    public function edit($unit_id){
        try{
            $states = State::where('status', 1)->get();
            $decrypt_unit_id = Crypt::decrypt($unit_id);
            $unit = Unit::where('id', $decrypt_unit_id)->first();
            $selected_state = State::where('name', $unit->state)->first();
            $cities = City::where('state_id', $selected_state->id)->where('status', 1)->get();
            $head_departments = User::with('getDepartmentType')
            ->where('role_type_id', 2);  
            if(Auth::user()->role_type_id != 1){
                $head_departments = $head_departments->where('id', Auth::user()->id);
            }
            $head_departments = $head_departments->get();
            return view('backend.unit.edit', compact('unit', 'head_departments', 'states', 'cities'));
        }catch(\Exception $e){
            return $e->getMessage();
            abort('404');
        }
    }

    public function update(Request $request, $unit_id){
        $validate = $request->validate([
            "name" => ['required'],
            "address" => ['required'],
            "state" => ['required'],
            "city" => ['required'],
        ]); 
      $unit_exists = Unit::where('id', '!=', $unit_id)->where('name', $request->name)
        ->where('city', $request->city)->exists();
        $state = State::where('id', $request->state)->first();
        if(!$unit_exists){ 
            Unit::where('id', $unit_id)->update([
                'name' => $request->name,
                "state" =>$state->name,
                "city" => $request->city,
                'location' => $request->address,
            ]);
        }else{
            return redirect()->route('backend.unit.edit', [Crypt::encrypt($unit_id)])->with('already_exist', 'The Unit with this name and in this city is already exists.');
        }
        return redirect()->route('backend.unit.index')->with('updated', 'Unit has been updated.');
    }

    public function destroy(Request $request){
        $id = $request->id; 
        if(Auth::user()->role_type_id == 1){
            $user = UserHierarchy::where('hotel_id', $id)->exists();
            if($user){
                return response()->json([
                    "status" => "already_in_use"
                ]);
             }
            Unit::where('id', $id)->delete();
            return response()->json([
                "status" => "deleted"
            ]); 
        }else{
            return response()->json([
                "status" => "permission_denied"
            ]);
        }
    }   

    public function getCity(Request $request){
        try{ 
            $state_id = $request->state_id;
            $cities = City::where('state_id', $state_id)->where('status', 1)->get();
            return response()->json([
                "status" => "success",
                "cities" => $cities
            ]);
        }catch(\Exception $e){
            return response()->json([
                "status" => "failed",
                "error" => $e->getMessage()
            ]);
        }

    }

    public function updateStatus(Request $request){
        try{
            $id = $request->id;
            $status = $request->status;
            Unit::where('id', $id)->update([
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

}
