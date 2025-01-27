<?php

namespace App\Http\Controllers\backend;

use App\Http\Controllers\Controller;
use App\Models\backend\AssignedCheckList;
use App\Models\backend\CheckListInformation;
use App\Models\backend\Department;
use App\Models\backend\DepartmentType;
use App\Models\backend\MasterCheckList;
use App\Models\backend\Hotel;
use Illuminate\Foundation\Auth\User;
use Illuminate\Http\Request;

class CheckListController extends Controller
{
    public function index(){
        $departments = DepartmentType::whereHas('getMasterCheckLists')
        ->where('status', 1)
        ->get();
        
        return view('backend.master_check_list.index', compact('departments'));
    } 
    public function edit($dept_id){
        $categories = [
            'epabx' => MasterCheckList::where('department_id', $dept_id)->where('category_id', 1)->get(),
            'cctv' => MasterCheckList::where('department_id', $dept_id)->where('category_id', 2)->get(),
            'sound_system' => MasterCheckList::where('department_id', $dept_id)->where('category_id', 3)->get(),
            'it_hardware' => MasterCheckList::where('department_id', $dept_id)->where('category_id', 4)->get(),
            'networking' => MasterCheckList::where('department_id', $dept_id)->where('category_id', 5)->get(),
            'software' => MasterCheckList::where('department_id', $dept_id)->where('category_id', 6)->get(),
            'lised_line' => MasterCheckList::where('department_id', $dept_id)->where('category_id', 7)->get(),
            'broadband' => MasterCheckList::where('department_id', $dept_id)->where('category_id', 8)->get(),
            'attendance_system' => MasterCheckList::where('department_id', $dept_id)->where('category_id', 9)->get(),
            'cable_tv' => MasterCheckList::where('department_id', $dept_id)->where('category_id', 10)->get(),
            'pa_system' => MasterCheckList::where('department_id', $dept_id)->where('category_id', 11)->get(),
            'e_mail_for_all_department' => MasterCheckList::where('department_id', $dept_id)->where('category_id', 12)->get(),
            'computer_security' => MasterCheckList::where('department_id', $dept_id)->where('category_id', 13)->get()
        ];
        $users = User::where('department_type_id', $dept_id)->get();
        $hotels = Hotel::get();
        return view('backend.master_check_list.edit', compact('categories', 'dept_id', 'users', 'hotels')); 
    }


    public function updateCheckList(Request $request, $dept_id){ 
        $validated = $request->validate([
            'list_id' => 'required|array',
            'list_id.*' => 'required|integer',
            'hotel_name' => 'required',
            'hotel_detail' => 'required',
            'title' => 'required',
            'description' => 'required',
            'start_date' => 'required',
            'end_date'  => 'required'
        ]);
        $check_list_info = CheckListInformation::create([
            "hotel_name" => $request->hotel_name,
            "hotel_detail" => $request->hotel_detail,
            "title" => $request->title,
            "description" => $request->description,
            "start_date" => $request->start_date,
            "end_date" => $request->end_date,
            "user_id" => $request->department_user
        ]); 
        $ids = $validated['list_id']; 
        MasterCheckList::where('department_id', $dept_id)->where('group_id', 1)->update([
            'is_checked' => 0
        ]);
        foreach ($ids as $id) {
            $make_model_val = 'make_model_' . $id;
            $make_and_manufacture_val = 'make_and_manufacture_' . $id;
            $unit_location_val = 'unit_location_' . $id;
            $qty_val = 'qty_' . $id;
            $status_val = 'status_' . $id;
            $remark_val = 'remark_' . $id;
            $is_checked_val = 'is_checked_' . $id;

            $category_val = 'category_' . $id;
            $category_id_val = 'category_id_' . $id;
            $department_id_val = 'department_id_' . $id;
            $group_id_val = 'group_id_' . $id;
            $order_val = 'order_' . $id;

            $item_name_val = 'item_name_' . $id;
 
            // Check if the dynamic keys exist in the request 
            $make_model = $request->input($make_model_val);
            $make_and_manufacture = $request->input($make_and_manufacture_val);
            $unit_location = $request->input($unit_location_val);
            $qty = $request->input($qty_val);
            $status = $request->input($status_val);
            $remark = $request->input($remark_val);
            $is_checked = $request->input($is_checked_val);

            $category = $request->input($category_val);
            $category_id = $request->input($category_id_val);
            $department_id = $request->input($department_id_val);
            $group_id = $request->input($group_id_val);
            $order = $request->input($order_val);
            $item_name = $request->input($item_name_val);
 
            MasterCheckList::where('id', $id)->update([
                'is_checked' => $is_checked,
                'make_model' => $make_model,
                'make_manufacture' => $make_and_manufacture,
                'unit_location' => $unit_location,
                'qty' => $qty,
                'item_status' => $status,
                'remark' => $remark
            ]); 
            AssignedCheckList::create([
                'is_checked' => $is_checked,
                'item_name' => $item_name,
                'make_model' => $make_model,
                'make_manufacture' => $make_and_manufacture,
                'unit_location' => $unit_location,
                'qty' => $qty,
                'item_status' => $status,
                'remark' => $remark,
                'category' => $category,
                'category_id' => $category_id,
                'department_id' => $department_id,
                'group_id' => $group_id,
                'order' => $order,
                "check_list_information_id" => $check_list_info->id,
                'status' => 1
            ]);
        } 
     return redirect()->route('backend.check_list.index')->with('updated', 'Check List has been updated successfully !');
    }
    public function getHotel(Request $request)
    {
        $id = $request->id;
        // return $id;
    $hotel_list = Hotel::where('id', $id)->first(); 
        return response([
            'status' => '200',
            'data' => $hotel_list
        ]);
        

    }
    
}
