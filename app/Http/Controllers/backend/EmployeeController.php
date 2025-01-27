<?php

namespace App\Http\Controllers\backend;

use App\Http\Controllers\Controller;
use App\Models\backend\Menu;
use App\Models\backend\UserPermission;
use Illuminate\Http\Request;
use App\Models\backend\RoleType;
use App\Models\User;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\Rules;

class EmployeeController extends Controller{


    // This controller is only for testing purpose delete after project complete
        public function index(){
        $roles = User::with(['roleType:id,name', 'getDepartmentType:id,name'])->get();
        return view('backend.employee.index', compact('roles'));
    }
   
 
}
