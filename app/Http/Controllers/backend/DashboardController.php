<?php

namespace App\Http\Controllers\backend;

use App\Http\Controllers\Controller;
use App\Models\backend\DepartmentType;
use App\Models\backend\Document;
use App\Models\backend\UserPermission;
use App\Models\User;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class DashboardController extends Controller{
    public function dashboard(){  
        // $permission_check = UserPermission::where('user_id', Auth::user()->id)->where('menu_id', 1)->exists();
        // if($permission_check){ 

        $current_date = Carbon::now();
        $recently_added_documents = Document::where('created_at', '>=', Carbon::now()->subHours(2))->get();
        $recently_added_users = User::where('created_at', '>=', Carbon::now()->subHours(2))->get();
        $todal_doc_count = Document::count();
        $total_users_count = User::count();
        $total_dept_count = DepartmentType::count();  

            if(Auth::user()->role_type_id == 1){
                $current_date = Carbon::now();
                $recently_added_documents = Document::where('created_at', '>=', Carbon::now()->subHours(6))->get();
                $recently_added_users = User::where('created_at', '>=', Carbon::now()->subHours(6))->get();
                $todal_doc_count = Document::count();
                $total_users_count = User::count();
                $total_dept_count = DepartmentType::count();  
            return view('backend.dashboard.super_admin_dashboard', 
            compact('recently_added_documents', 'recently_added_users',
            'todal_doc_count', 'total_users_count', 'total_dept_count'));
            }else if(Auth::user()->role_type_id == 2){
              return view('backend.dashboard.super_admin_dashboard', 
            compact('recently_added_documents', 'recently_added_users',
            'todal_doc_count', 'total_users_count', 'total_dept_count'));
                // return view('backend.dashboard.admin_dashboard');
            }else if(Auth::user()->role_type_id == 3){
                return view('backend.dashboard.super_admin_dashboard', 
                compact('recently_added_documents', 'recently_added_users',
                'todal_doc_count', 'total_users_count', 'total_dept_count'));
                // return view('backend.dashboard.department_dashboard'); 
            }else if(Auth::user()->role_type_id == 4){
                return view('backend.dashboard.super_admin_dashboard', 
                compact('recently_added_documents', 'recently_added_users',
                'todal_doc_count', 'total_users_count', 'total_dept_count'));
                // return view('backend.dashboard.employee_dashboard');1
            }else if(Auth::user()->role_type_id == 5){
                return view('backend.dashboard.super_admin_dashboard', 
                compact('recently_added_documents', 'recently_added_users',
                'todal_doc_count', 'total_users_count', 'total_dept_count'));
                // return view('backend.dashboard.employee_dashboard');1
            }else if(Auth::user()->role_type_id == 6){
                return view('backend.dashboard.super_admin_dashboard', 
                compact('recently_added_documents', 'recently_added_users',
                'todal_doc_count', 'total_users_count', 'total_dept_count'));
                // return view('backend.dashboard.employee_dashboard');1
            }else if(Auth::user()->role_type_id == 7){
                return view('backend.dashboard.super_admin_dashboard', 
                compact('recently_added_documents', 'recently_added_users',
                'todal_doc_count', 'total_users_count', 'total_dept_count'));
                // return view('backend.dashboard.employee_dashboard');1
            }
        // }else{
        //     return response()->view('errors.405', [], 405);
        // }
    }
    public function redirectDashboard(){
        return redirect('admin/dashboard'); 
    }
 
}
