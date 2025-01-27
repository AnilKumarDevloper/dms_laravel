<?php

namespace App\Http\Controllers\backend;

use App\Http\Controllers\Controller;
use App\Models\backend\State;
use Auth;
use Crypt;
use Illuminate\Http\Request;

class StateController extends Controller
{
    public function index(){
        $states = State::orderBy('name')->paginate(20);
        return view('backend.state.index', compact('states'));
    }

    public function edit($id){
        try{
            $decrypt_id = Crypt::decrypt($id);
            $state = State::where('id', $decrypt_id)->first();
            return view('backend.state.edit', compact('state'));
        }catch(\Exception $e){
            abort('404');
        }
    }

    public function update(Request $request, $id){
        $decrypt_id = $id;
        State::where('id', $decrypt_id)->update([
            "name" => $request->name
        ]);
        return redirect()->route('backend.state.index')->with('updated', 'State has been updated !');
    }

    // public function searchState(Request $request){
    //     try{
    //         // $states = State::orderBy('name')->get(); 
    //         $states = State::orderBy('name')->paginate(10); 
    //            return response()->json([
    //             "status" => "success",
    //             "data" => $states
    //            ]);
    //     }catch(\Exception $e){
    //         return response()->json([
    //             "status" => "failed",
    //             "error" => $e->getMessage()
    //         ]);
    //     }
    // }


    public function searchState(Request $request){
        try{
            if(Auth::user()->role_type_id == 1){
                $states = State::select('*');
                if(isset($_GET['search_text'])){
                    $states = $states->where('name', 'LIKE', '%'.$request->search_text.'%');
                }
                $states = $states->orderBy('name', 'asc')->get();
                $states->transform(function ($state) {
                    $state->encrypted_id = Crypt::encrypt($state->id);
                    return $state;
                });
                return response()->json([
                "status" => "success",
                "state_list" => $states
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
            State::where('id', $id)->update([
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


 