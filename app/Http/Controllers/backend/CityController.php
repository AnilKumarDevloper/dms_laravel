<?php

namespace App\Http\Controllers\backend;

use App\Http\Controllers\Controller;
use App\Models\backend\City;
use Auth;
use Crypt;
use Illuminate\Http\Request;

class CityController extends Controller{
    public function index(){
        $cities = City::with('getState')->orderBy('name')->paginate(20);
        return view('backend.city.index', compact('cities'));
    }

    public function edit($id){
        try{
            $decrypt_id = Crypt::decrypt($id);
            $city = City::where('id', $decrypt_id)->first();
            return view('backend.city.edit', compact('city'));
        }catch(\Exception $e){
            abort('404');
        }
    }

    public function update(Request $request, $id){
        $decrypt_id = $id;
        City::where('id', $decrypt_id)->update([
            "name" => $request->name
        ]);
        return redirect()->route('backend.city.index')->with('updated', 'City has been updated successfully.');
    }

    public function searchCity(Request $request){
        try{
            if(Auth::user()->role_type_id == 1){
                $cities = City::select('*')->with('getState:id,name'); 
                if(isset($_GET['search_text'])){
                    $cities = $cities->where('name', 'LIKE', '%'.$request->search_text.'%');
                }
                $cities = $cities->orderBy('name', 'asc')->get();
                $cities->transform(function ($city) {
                    $city->encrypted_id = Crypt::encrypt($city->id);
                    return $city;
                }); 
                return response()->json([
                "status" => "success",
                "city_list" => $cities
               ]); 
            }else{
                abort('404');
            } 
        }catch(\Exception $e){
            return response()->json([
                "status" => "failed",
                "error" => $e->getMessage()
            ]);
        }
    }

    public function updateStatus(Request $request){
        try{
            $id = $request->id;
            $status = $request->status;
            City::where('id', $id)->update([
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
