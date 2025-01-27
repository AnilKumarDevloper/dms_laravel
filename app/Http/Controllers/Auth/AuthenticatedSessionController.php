<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Http\Requests\Auth\LoginRequest;
use App\Models\backend\LoginAudit;
use App\Models\backend\Notification;
use App\Models\User;
use App\Providers\RouteServiceProvider;
use Illuminate\Http\RedirectResponse;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

use Illuminate\View\View;

class AuthenticatedSessionController extends Controller
{
    /**
     * Display the login view.
     */
    public function create(): View
    {
        return view('auth.login');
    }

    /**
     * Handle an incoming authentication request.
     */
    public function store(LoginRequest $request): RedirectResponse{
        // $request->authenticate();
        // $request->session()->regenerate(); 
        $credentials = $request->only('email', 'password');
        $remember = $request->filled('remember');
        $user = User::where('email', $request->email)->first();
        if (!$user){
            return back()->withErrors([
                'email' => 'This Email id does not exist.',
            ]);
        } 
        if (Auth::attempt($credentials, $remember)) {
            $request->session()->regenerate(); 
            Notification::create([
                "user_id" => Auth::user()->id,
                "title" =>  "New Login",
                "notification" => Auth::user()->name . ' Login',
                "notification_for" => 1,
                "icon" => '<i class="fa fa-sign-in" aria-hidden="true"></i>',
                "read_status" => 0,
                "status" => 1,
            ]); 
            $ipAddress = $request->ip();
            LoginAudit::create([
                "user_id" => Auth::user()->id,
                "email" => Auth::user()->email,
                "ip" => $ipAddress,
            ]); 
            return redirect()->intended(RouteServiceProvider::HOME);
        } return back()->withErrors([ 
            'password' => 'Wrong Password.',
        ]); 
    }

    /**
     * Destroy an authenticated session.
     */
    public function destroy(Request $request): RedirectResponse{
        Auth::guard('web')->logout(); 
        $request->session()->invalidate(); 
        $request->session()->regenerateToken(); 
        return redirect('/');
    }
}
