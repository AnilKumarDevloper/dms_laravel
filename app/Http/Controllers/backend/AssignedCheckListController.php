<?php

namespace App\Http\Controllers\backend;

use App\Http\Controllers\Controller;
use App\Models\backend\AssignedCheckList;
use App\Models\backend\CheckListInformation;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;

class AssignedCheckListController extends Controller{
    public function index(){
        $check_lists = CheckListInformation::select('*');
        if(Auth::user()->role_type_id == 1){
            $check_lists = $check_lists->get();
        }else{
            $check_lists = $check_lists->where('user_id', Auth::user()->id)->get();
        }
        return view('backend.assigned_check_list.index', compact('check_lists'));
    }

    public function view($id){
        $check_list = CheckListInformation::with('getAssignedCheckList')->where('id', $id)->first();
        $grouped_items = $check_list->getAssignedCheckList->groupBy('category');
        // return $grouped_items;
        return view('backend.assigned_check_list.view', compact('check_list', 'grouped_items'));
    }

    public function update(Request $request){
        $validated = $request->validate([
            'list_id' => 'required|array',
            'list_id.*' => 'required|integer', 
        ]);

        $ids = $validated['list_id'];  
        foreach ($ids as $id) {
            $make_model_val = 'make_model_' . $id;
            $make_and_manufacture_val = 'make_and_manufacture_' . $id;
            $unit_location_val = 'unit_location_' . $id;
            $qty_val = 'qty_' . $id;
            $status_val = 'status_' . $id;
            $remark_val = 'remark_' . $id;
            
            // Check if the dynamic keys exist in the request 
            $make_model = $request->input($make_model_val);
            $make_and_manufacture = $request->input($make_and_manufacture_val);
            $unit_location = $request->input($unit_location_val);
            $qty = $request->input($qty_val);
            $status = $request->input($status_val);
            $remark = $request->input($remark_val);
            
            AssignedCheckList::where('id', $id)->update([  
                'make_model' => $make_model,
                'make_manufacture' => $make_and_manufacture,
                'unit_location' => $unit_location,
                'qty' => $qty,
                'item_status' => $status,
                'remark' => $remark, 
            ]);
        } 
        return redirect()->route('backend.assigned_check_list.index')->with('updated', 'List updated successfully !');
    }
}
