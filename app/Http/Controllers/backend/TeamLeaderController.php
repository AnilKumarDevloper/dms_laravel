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

class TeamLeaderController extends Controller
{
    public function index(){
        $team_leaders = User::with(['getDepartmentType', 'getHead', 'getUnit', 'getManager']);
        if(Auth::user()->role_type_id == 2){
            $team_leaders = $team_leaders->where('head_department_id', Auth::user()->id);
        }
        if(Auth::user()->role_type_id == 5){
            $team_leaders = $team_leaders->where('manager_id', Auth::user()->id);
        }
        $team_leaders = $team_leaders->where('role_type_id', 6)->withTrashed()
        ->orderBy('id', 'desc')->paginate(10);
        return view('backend.team_leader.index', compact('team_leaders'));
    }
 
    public function edit($id){
        // try{
            if(Auth::user()->role_type_id == 1 || Auth::user()->role_type_id == 2 || Auth::user()->role_type_id == 5){
                $decrypt_id = Crypt::decrypt($id);
                $managers = '';
                $team_leaders = '';
                $team_leader = User::with(['getDepartmentType', 'getHead', 'getUnit', 'getManager'])
                ->where('id', $decrypt_id)->first(); 

                $department_heads = User::where('role_type_id', 2)
                ->where('status', 1)->get(); 
                $units = Unit::select('*');
                if(Auth::user()->role_type_id == 5){
                    $units = $units->where('id', Auth::user()->unit_id);
                }
                $units = $units->where('status', 1)->get(); 
                if($team_leader->head_department_id != ''){
                    $managers = User::where('role_type_id', 5)
                    ->where('head_department_id', $team_leader->head_department_id)
                    ->where('unit_id', $team_leader->unit_id)
                    ->get();
                }
                if($team_leader->manager_id != ''){
                    $team_leaders = User::where('role_type_id', 6)
                    ->where('manager_id', $team_leader->manager_id)
                    ->where('status', 1)->get();
                } 
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
                $department_types = DepartmentType::where('status', 1)->get();
                return view('backend.team_leader.edit', compact('team_leader', 'team_leaders',
                'department_heads', 'units', 'managers', 'role_types', 'department_types'));  
            }else{
                return response()->view('errors.405', [], 405);
            }
        // }catch(\Exception $e){
        //     abort('404');
        // } 
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
        $head_department_id = $request->head_department;
        $hotel_id = $request->hotel;
        $manager_id = $request->manager;
        $role_type_id = $request->role_type;

        if(Auth::user()->role_type_id == 1){
            // if logged in user is admin
            if($role_type_id == 2){
                // selected role is head of department.
                User::where('id', $decrypt_id)->update([
                    "first_name" => $f_name,
                    "last_name" => $l_name,
                    "name" => $f_name.' '.$l_name,
                    "phone" => $phone,
                    "role_type_id" => $role_type_id, 
                ]);

            }elseif($role_type_id == 5){
                // if selected role is manager.
                User::where('id', $decrypt_id)->update([
                    "first_name" => $f_name,
                    "last_name" => $l_name,
                    "name" => $f_name.' '.$l_name,
                    "phone" => $phone,
                    "role_type_id" => $role_type_id,
                    "unit_id" => $hotel_id, 
                ]); 
            }elseif($role_type_id == 6){
                // if selected role is team leader.
                User::where('id', $decrypt_id)->update([
                    "first_name" => $f_name,
                    "last_name" => $l_name,
                    "name" => $f_name.' '.$l_name,
                    "phone" => $phone,
                    "role_type_id" => $role_type_id,
                    "unit_id" => $hotel_id,
                    "manager_id" => $request->manager, 
                ]); 

            }elseif($role_type_id == 7){
                // if selected role is team member.
                User::where('id', $decrypt_id)->update([
                    "first_name" => $f_name,
                    "last_name" => $l_name,
                    "name" => $f_name.' '.$l_name,
                    "phone" => $phone,
                    "role_type_id" => $role_type_id,
                    "unit_id" => $hotel_id,
                    "manager_id" => $request->manager,
                    "team_leader_id" => $request->team_leader
                ]); 
            }
        }elseif(Auth::user()->role_type_id == 2){
            // if loggedin user is head of department
            if($role_type_id == 5){
                // if selected role is manager.
                User::where('id', $decrypt_id)->update([
                    "first_name" => $f_name,
                    "last_name" => $l_name,
                    "name" => $f_name.' '.$l_name,
                    "phone" => $phone,
                    "role_type_id" => $role_type_id,
                    "unit_id" => $hotel_id,
                ]);  
            }elseif($role_type_id == 6){
                // if selected role is team leader.
                User::where('id', $decrypt_id)->update([
                    "first_name" => $f_name,
                    "last_name" => $l_name,
                    "name" => $f_name.' '.$l_name,
                    "phone" => $phone,
                    "role_type_id" => $role_type_id,
                    "unit_id" => $hotel_id, 
                    "manager_id" => $request->manager,
                ]);  
            }elseif($role_type_id == 7){
                // if selected role is team member.
                User::where('id', $decrypt_id)->update([
                    "first_name" => $f_name,
                    "last_name" => $l_name,
                    "name" => $f_name.' '.$l_name,
                    "phone" => $phone,
                    "role_type_id" => $role_type_id,
                    "unit_id" => $hotel_id,
                    "manager_id" => $request->manager,
                    "team_leader_id" => $request->team_leader
                ]); 
            }
        }elseif(Auth::user()->role_type_id == 5){
            // if loggedin user is manager
            if($role_type_id == 6){
                // if selected role is team leader
                User::where('id', $decrypt_id)->update([
                    "first_name" => $f_name,
                    "last_name" => $l_name,
                    "name" => $f_name.' '.$l_name,
                    "phone" => $phone, 
                ]);
            }elseif($role_type_id == 7){
                // if selected role is team member
                User::where('id', $decrypt_id)->update([
                    "first_name" => $f_name,
                    "last_name" => $l_name,
                    "name" => $f_name.' '.$l_name,
                    "phone" => $phone,
                    "role_type_id" => $role_type_id,
                    "team_leader_id" => $request->team_leader
                ]);
            }
        } 
        return redirect()->route('backend.team_leader.index')->with('success', "Team Leader has been updated successfully");
    }
 

    public function destroy($id){
        try{
            $decrypt_id = Crypt::decrypt($id);
            if(Auth::user()->role_type_id == 1){
                $user = UserHierarchy::where('team_leader_id', $decrypt_id)->exists();
                if($user){ 
                    return redirect()->back()->with('already_in_use', 'This Team Leader has user you cant delete directly');
                }
                User::where('id', $decrypt_id)->delete();
                return redirect()->back()->with('deleted', "Team Leader has been deleted successfully");
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
            $manager_id = $request->manager_id;
            $team_leader_list = User::where('role_type_id', 6)->where('manager_id', $manager_id)->where('status', 1)->get();
            return response()->json([
                "status" => "success",
                "team_leader_list" => $team_leader_list
            ], 200);
        }catch(\Exception $e){
            return response()->json([
                "status" => "failed",
                "error" => $e->getMessage()
            ], 200);
        }
    }


}
