<?php

namespace App\Http\Controllers;

use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Routing\Controller as BaseController;
use Illuminate\Support\Facades\Hash;

class Controller extends BaseController
{
    use AuthorizesRequests, ValidatesRequests; 

    public function getpass(){
       $pass = Hash::make('sachin.gaur@cygnetthotels.com');
       return $pass;
    }

    public function emailTemplateTesting(){
        return view('emails.test');
    }
}
