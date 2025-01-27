<?php

namespace App\Http\Controllers\backend;

use App\Http\Controllers\Controller;
use App\Models\backend\DepartmentType;
use App\Models\backend\RoleType;
use App\Models\backend\Unit;
use App\Models\backend\UserHierarchy;
use App\Models\User; 
use Auth;
use Crypt;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\Rule; 
use Illuminate\Validation\Rules; 

class ManagerController extends Controller{
    public function index(){ 
        if(Auth::user()->role_type_id == 1 || Auth::user()->role_type_id == 2){
        $managers = User::with(['getDepartmentType', 'getHead', 'getUnit'])
        ->where('role_type_id', 5)->withTrashed(); 
        if(Auth::user()->role_type_id == 2){
            $managers = $managers->where('head_department_id', Auth::user()->id);
        }
        $managers = $managers->orderBy('id', 'desc')->paginate(10);   
        return view('backend.manager.index', compact('managers'));
        }else{
            abort('404');
        }
    }

    public function create(){
        try{ 
        $current_user = User::with('getUserHierarchie')->where('id', Auth::user()->id)->first();
        $heade_departments = User::with('getDepartmentType');
        if(Auth::user()->role_type_id == 2){
            $heade_departments = $heade_departments->where('id', Auth::user()->id);
        }
        if(Auth::user()->role_type_id == 4){
            $heade_departments = $heade_departments->where('id', $current_user->getUserHierarchie->head_department_id);
        }
        $heade_departments = $heade_departments->where('role_type_id', 2)->get();  
        return view('backend.manager.create', compact('heade_departments'));
        }catch(\Exception $e){
            return $e->getMessage();
        }
    }

    public function store(Request $request){ 
        $request->validate([
            'name' => ['required', 'string', 'max:255'],
            'email' => ['required', 'string', 'lowercase', 'email:dns', 'max:255', 'unique:'.User::class],
            'phone' => ['required', 'numeric', 'digits:10', 'unique:'.User::class],
            'password' => ['required', 'confirmed', Rules\Password::defaults()],
            'head_department' => ['required'],
            'hotel' => ['required'],
            'hotel_department' => ['required'],
        ]);  
        $name = $request->name;
        $email = $request->email;
        $phone = $request->phone;
        $head_department_id = $request->head_department;
        $hotel_id = $request->hotel;
        $hotel_department_id = $request->hotel_department;
        $password = Hash::make($request->password); 
        $manager = User::create([
            "name" => $name,
            "email" => $email,
            "phone" => $phone,
            "password" => $password,
            "role_type_id" => 5
        ]); 
        UserHierarchy::create([
            "user_id" => $manager->id,
            "head_department_id" => $head_department_id,
            "hotel_id" => $hotel_id,
            "hoted_department_id" => $hotel_department_id
        ]);
        return redirect()->route('backend.manager.index')->with('success', "Manager has been added successfully");
    }

    public function edit($id){
        if(Auth::user()->role_type_id == 1 || Auth::user()->role_type_id == 2){
            try{ 
                $decrypt_id = Crypt::decrypt($id);
                $manager = User::with(['getDepartmentType', 'getHead', 'getUnit'])->where('id', $decrypt_id)->first();
                $head_departments = User::where('role_type_id', 2)->get();
                $units = Unit::where('status', 1)->get(); 
                $role_types = RoleType::select('*'); 
                if(Auth::user()->role_type_id == 1){
                    $role_types = $role_types->whereIn('id', [2, 5, 6, 7]);
                }
                if(Auth::user()->role_type_id == 2){
                    $role_types = $role_types->whereIn('id', [5, 6, 7]);
                } 
                $role_types = $role_types->where('status', 1)->get(); 
                $department_types = DepartmentType::where('status', 1)->get();

                $team_leaders = User::where('role_type_id', 6)->where('status', 1);
                if(Auth::user()->role_type_id == 2){
                    $team_leaders = $team_leaders->where('head_department_id', Auth::user()->id)->where('manager_id', $manager->id);
                }
                $team_leaders = $team_leaders->get();

                $managers = User::where('role_type_id', 5)->where('status', 1)
                ->where('unit_id', $manager->unit_id)
                ->where('head_department_id', $manager->head_department_id)
                ->where('id', '!=', $decrypt_id)->get();

                return view('backend.manager.edit', compact('manager', 
                'head_departments', 'units', 'role_types', 'department_types', 'managers', 'team_leaders'));

            }catch(\Exception $e){
                abort('404');
            } 
        }else{
            abort('404');
        }
    }

    public function update(Request $request, $id){
        $decrypt_id = Crypt::decrypt($id);
        $request->validate([
            'f_name' => ['required', 'string', 'max:255', 'regex:/^[a-zA-Z\s]+$/'],
            'l_name' => ['required', 'string', 'max:255', 'regex:/^[a-zA-Z\s]+$/'],
            'phone' => ['required', 'numeric', 'digits:10', Rule::unique(User::class)->ignore($decrypt_id)],
            'head_department' => ['required'],
            'hotel' => ['required'],
        ]);
        $f_name = $request->f_name;
        $l_name = $request->l_name; 
        $phone = $request->phone;
        $head_of_department_id = $request->head_department;
        $unit_id = $request->hotel;  
        $head_of_dpt_row = User::where('id', $head_of_department_id)->first();
      
        $role_type_id = $request->role_type;
        if(Auth::user()->role_type_id == 1){
            // if logged in user is admin.
            if($role_type_id == 2){
                // if selected role type is head of department.
                User::where('id', $decrypt_id)->update([
                    "first_name" => $f_name,
                    "last_name" => $l_name,
                    "name" => $f_name .' '. $l_name,
                    "phone" => $phone,
                    "role_type_id" => $role_type_id,
                    "department_type_id" => $head_of_dpt_row->department_type_id, 
                ]); 
            }elseif($role_type_id == 5){
                // if selected role type is manamer.
                User::where('id', $decrypt_id)->update([
                    "first_name" => $f_name,
                    "last_name" => $l_name,
                    "name" => $f_name .' '. $l_name,
                    "phone" => $phone,
                    "role_type_id" => $role_type_id,
                    "department_type_id" => $head_of_dpt_row->department_type_id,
                    "head_department_id" => $request->head_department,
                    "unit_id" => $request->hotel,
                ]);
            }elseif($role_type_id == 6){
                // if selected role type is team leader.
                User::where('id', $decrypt_id)->update([
                    "first_name" => $f_name,
                    "last_name" => $l_name,
                    "name" => $f_name .' '. $l_name,
                    "phone" => $phone,
                    "role_type_id" => $role_type_id,
                    "department_type_id" => $head_of_dpt_row->department_type_id,
                    "head_department_id" => $request->head_department,
                    "unit_id" => $request->hotel,
                    "manager_id" => $request->manager,
                ]);
            }elseif($role_type_id == 7){
                // if selected role type is team member.
                User::where('id', $decrypt_id)->update([
                    "first_name" => $f_name,
                    "last_name" => $l_name,
                    "name" => $f_name .' '. $l_name,
                    "phone" => $phone,
                    "role_type_id" => $role_type_id,
                    "department_type_id" => $head_of_dpt_row->department_type_id,
                    "head_department_id" => $request->head_department,
                    "unit_id" => $request->hotel,
                    "manager_id" => $request->manager,
                    "team_leader_id" => $request->team_leader
                ]);
            }else{
                // bogus role type selected
                return response()->view('errors.405', [], 405);
            }
        }elseif(Auth::user()->role_type_id == 2){
            // if loggedin user is haed of departement.
            if($role_type_id == 5){
                // if sleected role type is manager.
                User::where('id', $decrypt_id)->update([
                    "first_name" => $f_name,
                    "last_name" => $l_name,
                    "name" => $f_name .' '. $l_name,
                    "phone" => $phone,
                    "role_type_id" => $role_type_id,
                    "unit_id" => $request->hotel,
                    "head_department_id" => $request->head_department
                ]); 
            }elseif($role_type_id == 6){
                // if selected role type is team leader.
                User::where('id', $decrypt_id)->update([
                    "first_name" => $f_name,
                    "last_name" => $l_name,
                    "name" => $f_name .' '. $l_name,
                    "phone" => $phone,
                    "unit_id" => $unit_id,
                    "manager_id" => $request->manager,
                    "head_department_id" => $request->head_department,
                    "role_type_id" => $role_type_id
                ]); 
            }elseif($role_type_id == 7){
                // if selected role type is team memeber.
                User::where('id', $decrypt_id)->update([
                    "first_name" => $f_name,
                    "last_name" => $l_name,
                    "name" => $f_name .' '. $l_name,
                    "phone" => $phone,
                    "unit_id" => $unit_id,
                    "manager_id" => $request->manager,
                    "head_department_id" => $request->head_department,
                    "role_type_id" => $role_type_id,
                    "team_leader_id" => $request->team_leader
                ]); 
            }else{
                // bogus role type is selecteedd.
                return response()->view('errors.405', [], 405);
            } 
        }else{
            return response()->view('errors.405', [], 405);
        }
        return redirect()->route('backend.manager.index')->with('updated', "Manager has been updated successfully");
    }

    public function destroy($id){
        try{
            $decrypt_id = Crypt::decrypt($id);
            if(Auth::user()->role_type_id == 1){
                $user = UserHierarchy::where('manager_id', $decrypt_id)->exists();
                if($user){ 
                    return redirect()->back()->with('already_in_use', 'This Manager has user you cant delete directly');
                }
                User::where('id', $decrypt_id)->delete();
                return redirect()->back()->with('deleted', "Manager has been deleted successfully");
            }
            else{
                return response()->view('errors.405', [], 405);
            }
        }catch(\Exception $e){
            abort('404');
        }
    }

    public function statusChange(Request $request){
        try{
            if($request->status == 0){
                User::where('id', $request->id)->update([
                    "status" => $request->status
                ]); 
                User::find($request->id)->delete();
            }else{ 
                User::onlyTrashed()->findOrFail($request->id)->restore();
                User::where('id', $request->id)->update([
                    "status" => $request->status
                ]); 
            }
            User::where('id', $request->id)->update([
                "status" => $request->status
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

    public function getTeamLeaderList(Request $request){
        try{
            $team_leader_list = User::where('unit_id', $request->unit_id)
            ->where('manager_id', $request->manager_id)
            ->where('status', 1)->get();
            return response()->json([
                "status" => "success",
                "team_leader_list" => $team_leader_list
            ], 200); 
        }catch(\Exception $e){
            return response()->json([
                "status" => "failed",
                "error" => $e->getMessage()
            ], 400);
        }
    }

    
}
