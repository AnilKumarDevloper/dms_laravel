<?php

namespace App\Http\Middleware;

use App\Models\backend\DepartmentType;
use Auth;
use Closure;
use Illuminate\Http\Request;
use Symfony\Component\HttpFoundation\Response;

class DepartmentTypeStatusCheck
{
    /**
     * Handle an incoming request.
     *
     * @param  \Closure(\Illuminate\Http\Request): (\Symfony\Component\HttpFoundation\Response)  $next
     */
    public function handle(Request $request, Closure $next): Response{
        if(Auth::user()->role_type_id != 1){
        if(Auth::user()->department_type_id != ''){
            $departmet = DepartmentType::where('id', Auth::user()->department_type_id)->first();
            if($departmet->status != 1){
                Auth::guard('web')->logout(); 
                $request->session()->invalidate(); 
                $request->session()->regenerateToken();  
                return redirect('/')->withErrors([
                    'email' => 'Your department is currently inactive. Please contact the administrator for assistance.',
                ]);
            }   
            }   
        } 
        return $next($request);
    }
}
