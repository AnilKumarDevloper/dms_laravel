<?php

namespace App\Http\Controllers\backend;

use App\Http\Controllers\Controller;
use App\Models\backend\LoginAudit;
use Auth;
use Illuminate\Http\Request;

class LoginAuditController extends Controller
{ 
    public function index(){
        if(Auth::user()->role_type_id == 1){
            $login_audits = LoginAudit::with('getUser')->orderBy('id', 'desc')->paginate(10);
            return view('backend.login_audit.index', compact('login_audits'));
        }else{
            abort('404');
        }
    }
}
