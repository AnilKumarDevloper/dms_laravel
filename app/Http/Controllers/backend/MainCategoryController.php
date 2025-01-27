<?php

namespace App\Http\Controllers\backend;

use App\Http\Controllers\Controller;
use App\Models\backend\MainCategory;
use App\Models\backend\SubCategory;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class MainCategoryController extends Controller
{
    public function index(){
        $main_categories = MainCategory::get();
        return view('backend.main_category.index', compact('main_categories'));
    }

    public function edit($id)
    {
        $main_categories = MainCategory::where('id', $id)->first();
        return view('backend.main_category.edit', compact('main_categories'));
    }



    public function update(Request $request, $id)
    {
        $category_name = $request->category_name;
        $description = $request->discription;
        MainCategory::where('id', $id)->update([
            'name' => $category_name,
            'description' => $description
        ]);
        return redirect()->route('backend.main_category.index')->with('update', "Main Category has been update successfully");
    }
    
    // public function destroy($id){
    //     $main_category = MainCategory::with('getSubCategory:id,main_category_id')->where('id', $id)->first();

    //     if ($main_category) {
    //         if ($main_category->getSubCategory->isEmpty()) {
    //             $main_category->delete();
    //             return redirect()->route('backend.main_category.index')->with('success', "Main Category has been deleted successfully");
    //         } else {
    //             return redirect()->route('backend.main_category.index')->with('warning', "Main Category cannot be deleted because it has associated Sub Categories");
    //         }
    //     } else {
    //         return redirect()->route('backend.main_category.index')->with('error', "Main Category not found");
    //     }
    // }
    public function destroy($id)
    {
        // $id = $request->id;
        $main_category = MainCategory::with('getSubCategory:id,main_category_id')->where('id', $id)->first();

        if($main_category){
            if($main_category->getSubCategory->isEmpty()){
                $main_category->delete();
                try {
                    MainCategory::where('id', $id)->delete();
                    return response()->json([
                        'status' => 200,
                        'message' => "Main Category has been deleted successfully"
                    ]);
                } catch (\Exception $e) {
                    return response()->json([
                        'status' => 500,
                        'message' => "An error occurred while deleting main category"
                    ]);
                }
            } else {
                return response()->json([
                    'status' => 400,
                    'message' => "Main Category cannot be deleted because it has associated Sub Categories"
                ]);
            }
        } else {
            return response()->json([
                'status' => 404,
                'message' => "Main Category not found"
            ]);
        }
    }
    
    public function store(Request $request){
        $category_name = $request->category_name;
        $description = $request->discription;
        $existingCategory = MainCategory::where('name', $category_name)->first();
        if ($existingCategory) {
            return redirect()->route('backend.main_category.index')->with('warning', "Main Category Already Exists");
        }
        $newMainCategory = MainCategory::create([
            'name' => $category_name,
            'description' => $description,
            'status' => 1,
        ]);

        return redirect()->route('backend.main_category.index')->with('success', "Main Category has been added successfully");
    }


    // public function updateStatus(Request $request){
    //     $id = $request->id;
    //     $status = $request->status;
    //     MainCategory::where('id', $id)->update([
    //         'status' => $status
    //     ]);
    //     return response()->json([
    //         'status' => 200,
    //         'message' => "success"
    //     ]);
    // }
}
