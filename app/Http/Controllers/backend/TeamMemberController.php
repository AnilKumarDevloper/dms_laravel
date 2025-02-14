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
use Illuminate\Validation\Rules\Password;

class TeamMemberController extends Controller{
    public function index(){ 
        $team_members = User::with(['getDepartmentType', 'getHead', 'getUnit', 'getManager', 'getTeamLeader']);
        if(Auth::user()->role_type_id == 2){
            $team_members = $team_members->where('head_department_id', Auth::user()->id);
        }
        if(Auth::user()->role_type_id == 5){
            $team_members = $team_members->where('manager_id', Auth::user()->id);
        }
        if(Auth::user()->role_type_id == 6){
            $team_members = $team_members->where('team_leader_id', Auth::user()->id);
        }
        $team_members = $team_members->where('role_type_id', 7)->withTrashed()
        ->orderBy('id', 'desc')->paginate(10);
        return view('backend.team_member.index', compact('team_members'));
    }

    public function create(){
        $heade_departments = User::with('getDepartmentType')->where('role_type_id', 2)->get(); 
        return view('backend.team_member.create', compact('heade_departments'));
    }
 
    public function edit($id){
        try{
            if(Auth::user()->role_type_id == 6){
                return response()->view('errors.405', [], 405);
            }
          
            $decrypt_id = Crypt::decrypt($id);
            $head_departments = User::where('role_type_id', 2)->get();
            $team_member = User::with(['getDepartmentType', 'getHead', 'getUnit', 'getManager', 'getTeamLeader'])
            ->where('id', $decrypt_id)->first();
            $units = Unit::where('status', 1)->get();
                if($team_member->head_department_id != ''){
                    $managers = User::where('head_department_id', $team_member->head_department_id)
                    ->where('unit_id', $team_member->unit_id)
                    ->where('role_type_id', 5)->get();
                }else{
                    $managers = User::where('role_type_id', 5)->get();
                }
            $team_leaders = User::where('head_department_id', $team_member->head_department_id)
            ->where('unit_id', $team_member->unit_id);
                if($team_member->manager_id != ''){
                    $team_leaders = $team_leaders->where('manager_id', $team_member->manager_id);
                }
            $team_leaders = $team_leaders->where('role_type_id', 6)->get();
            $department_types = DepartmentType::where('status', 1)->get();
            $role_types = RoleType::select('*');
            if(Auth::user()->role_type_id == 1){
                $role_types = $role_types->whereIn('id', [2, 5, 6, 7]);
            }
            if(Auth::user()->role_type_id == 2){
                $role_types = $role_types->whereIn('id', [5, 6, 7]);
            }
            if(Auth::user()->role_type_id == 5){
                $role_types = $role_types->whereIn('id', [6, 7]);
            }
            $role_types = $role_types->where('status', 1)->get(); 
            return view('backend.team_member.edit', compact(['team_member',
            'head_departments', 'managers', 'team_leaders', 'units', 'role_types', 'department_types']));  
        }catch(\Exception $e){
            return $e->getMessage();
            abort('404');
        }
    }
 
    public function update(Request $request, $id){   
        $decrypt_id  = Crypt::decrypt($id);
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
        $role = $request->role_type;
        $unit = $request->hotel;
        $manager = $request->manager;
        $team_leader = $request->team_leader;
        if(Auth::user()->role_type_id == 5){
            // if logged in user is manager
            $department_head = $request->head_department; 
            if($role == 6){
                // if manager select role as team leader
                User::where('id', $decrypt_id)->update([
                    "first_name" => $f_name,
                    "last_name" => $l_name,
                    "name" => $f_name .' '. $l_name,
                    "phone" => $phone,
                    "role_type_id" => $role,
                    "department_type_id" => Auth::user()->department_type_id,
                    "head_department_id" => $department_head,
                    "unit_id" => $unit,
                    "manager_id" => $manager,
                ]);
            }elseif($role == 7){
                // if manager select role as team member
                User::where('id', $decrypt_id)->update([
                    "first_name" => $f_name,
                    "last_name" => $l_name,
                    "name" => $f_name .' '. $l_name, 
                    "phone" => $phone,
                    "role_type_id" => $role,
                    "department_type_id" => Auth::user()->department_type_id,
                    "head_department_id" => $department_head,
                    "unit_id" => $unit,
                    "manager_id" => $manager,
                    "team_leader_id" => $team_leader,
                ]);
            }
        }elseif(Auth::user()->role_type_id == 2){
            // if logged in user is head of department
            if($role == 5){
                // if head of department select role as manager 
                User::where('id', $decrypt_id)->update([
                    "first_name" => $f_name,
                    "last_name" => $l_name,
                    "name" => $f_name .' '. $l_name,
                    "phone" => $phone,
                    "role_type_id" => $role,
                    "department_type_id" => Auth::user()->department_type_id,
                    "head_department_id" => Auth::user()->id,
                    "unit_id" => $unit
                ]);
            }elseif($role == 6){
                // if head of department select role as team leader 
                User::where('id', $decrypt_id)->update([
                    "first_name" => $f_name,
                    "last_name" => $l_name,
                    "name" => $f_name .' '. $l_name,
                    "phone" => $phone,
                    "role_type_id" => $role,
                    "department_type_id" => Auth::user()->department_type_id,
                    "head_department_id" => Auth::user()->id,
                    "unit_id" => $unit,
                    "manager_id" => $manager,
                ]);
            }elseif($role == 7){
                // if head of department select role as team member 
                User::where('id', $decrypt_id)->update([
                    "first_name" => $f_name,
                    "last_name" => $l_name,
                    "name" => $f_name .' '. $l_name, 
                    "phone" => $phone,
                    "role_type_id" => $role,
                    "department_type_id" => Auth::user()->department_type_id,
                    "head_department_id" => Auth::user()->id,
                    "unit_id" => $unit,
                    "manager_id" => $manager,
                    "team_leader_id" => $team_leader,
                ]);
            }
        }elseif(Auth::user()->role_type_id == 1){
            // if loogged in user is admin
            $head_of_department = User::where('id', $request->head_department)->first();
            if($role == 2){
                // if admin select role as head of department.
                User::where('id', $decrypt_id)->update([
                    "first_name" => $f_name,
                    "last_name" => $l_name,
                    "name" => $f_name .' '.$l_name,
                    "phone" => $phone,
                    "role_type_id" => $role,
                    "department_type_id" => $request->department_type
                ]); 
            }elseif($role == 5){
                // if admin select role as manager.
                User::where('id', $decrypt_id)->update([
                    "first_name" => $f_name,
                    "last_name" => $l_name,
                    "name" => $f_name .' '.$l_name,
                    "phone" => $phone,
                    "role_type_id" => $role,
                    "department_type_id" => $head_of_department->department_type_id,
                    "head_department_id" => $head_of_department->id,
                    "unit_id" => $unit
                ]);
            }elseif($role == 6){
                // if admin select role as team leader.
                User::where('id', $decrypt_id)->update([
                    "first_name" => $f_name,
                    "last_name" => $l_name,
                    "name" => $f_name .' '.$l_name,
                    "phone" => $phone,
                    "role_type_id" => $role,
                    "department_type_id" => $head_of_department->department_type_id,
                    "head_department_id" => $head_of_department->id,
                    "unit_id" => $unit,
                    "manager_id" => $manager,
                ]);
            }elseif($role == 7){
                // if admin selet role as team member. 
                User::where('id', $decrypt_id)->update([
                    "first_name" => $f_name,
                    "last_name" => $l_name,
                    "name" => $f_name .' '. $l_name,
                    "phone" => $phone,
                    "role_type_id" => $role,
                    "department_type_id" => $head_of_department->department_type_id,
                    "head_department_id" => $head_of_department->id,
                    "unit_id" => $unit,
                    "manager_id" => $manager,
                    "team_leader_id" => $team_leader
                ]);
            }
        } 
        return redirect()->route('backend.team_member.index')->with('success', "Team Member has been updated successfully");
    }
 
    public function getTeamLeader(Request $request){
        try{
            $manager_id = $request->manager;
            $team_leader_list = UserHierarchy::where('manager_id', $manager_id)->get();
            $user_ids = [];
            foreach($team_leader_list as $tl){
                $user_ids[] = $tl->user_id;
            }
            $team_leaders = User::whereIn('id', $user_ids)->where('role_type_id', 6)->get();
            return response()->json([
                "status" => "success",
                "team_leader" => $team_leaders
            ], 200); 
        }catch(\Exception $e){
            return response()->json([
                "status" => "failed",
                "error" => $e->getMessage()
            ], 400);
        }
    }
 
    public function destroy($id){
        try{
            $decrypt_id = Crypt::decrypt($id);
            if(Auth::user()->role_type_id == 1){
                $user = UserHierarchy::where('team_leader_id', $decrypt_id)->exists();
                User::where('id', $decrypt_id)->delete();
                return redirect()->back()->with('deleted', "Team Member has been deleted successfully");
            }else{
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
}
