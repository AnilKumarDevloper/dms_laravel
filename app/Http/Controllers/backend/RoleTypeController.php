<?php

namespace App\Http\Controllers\backend;

use App\Http\Controllers\Controller;
use App\Models\backend\RoleType;
use Crypt;
use Illuminate\Http\Request;

class RoleTypeController extends Controller{
    public function index(){
        $role_types = RoleType::whereNotIn('id', [1, 3, 4])->get();
            return view('backend.role_type.index', compact('role_types'));
        }

    public function edit($id){
        try{
            $decrypt_id = Crypt::decrypt($id);
            $role_type = RoleType::where('id', $decrypt_id)->first();
            return view('backend.role_type.edit', compact('role_type'));
        }catch(\Exception $e){
            abort('404');
        }
    }

    public function update(Request $request, $id){
        $decrypt_id = $id;
        RoleType::where('id', $decrypt_id)->update([
            "name" => $request->name
        ]);
        return redirect()->route('backend.role_type.index')->with('updated', 'Role has been updated successfully.');
    }

    public function updateStatus(Request $request){
        try{
            $id = $request->id;
            $status = $request->status;
            RoleType::where('id', $id)->update([
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
