<?php

namespace App\Http\Controllers\backend;

use App\Http\Controllers\Controller;
use App\Models\backend\SubCategory;
use Illuminate\Http\Request;
// ------ using for the data from the main category -----//
use App\Models\backend\MainCategory;

class SubCategoryController extends Controller
{
    public function index()
    {
        $sub_categories = SubCategory::with('getMainCategory:id,name')->get();
        $main_categories = MainCategory::where('status', 1)->get();
        return view('backend.sub_category.index', compact('sub_categories', 'main_categories'));
    }

    public function edit($id)
    {      
        $main_categories = MainCategory::where('status', 1)->get();
        $sub_category = SubCategory::with('getMainCategory:id,name')->where('id', $id)->first();
        return view('backend.sub_category.edit', compact('sub_category', 'main_categories'));
    }


    public function store(Request $request)
    {
        $sub_category_name = $request->sub_category_name;
        $sub_category_disc = $request->sub_category_disc; 
        $main_category_id = $request->main_category_id;

        $existingCategory = SubCategory::where('name', $sub_category_name)->first();

        if ($existingCategory) {
            return redirect()->route('backend.sub_category.index')->with('warning', 'Sub Category Already Exists');
        }
        try {
            $newSubCategory = SubCategory::create([
                'name' => $sub_category_name,
                'description' => $sub_category_disc,
                'main_category_id' => $main_category_id,
                'status' => 1,
            ]);
    
            return redirect()->route('backend.sub_category.index')->with('success', 'Sub Category has been added successfully');
        } catch (\Exception $e) {
            return redirect()->route('backend.sub_category.index')->with('error', 'An error occurred while adding the subcategory');
        }
    } 

    public function destroy(Request $request)
    {
        $id = $request->id;
        try {
            SubCategory::where('id', $id)->delete();
            return response()->json([
                'status' => 200,
                'message' => "Sub Category has been deleted successfully"
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'status' => 500,
                'message' => "An error occurred"
            ]);
        }
    }


    
    public function update(Request $request, $id)
    {
        $category_name = $request->sub_category_name;
        $main_category_id = $request->main_category_id;
        $description = $request->discription;
        SubCategory::where('id', $id)->update([
            'name' => $category_name,
            'description' => $description,
            'main_category_id' => $main_category_id
        ]);
        return redirect()->route('backend.sub_category.index')->with('update', "Sub Category  has been update successfully");
    } 

 
 
}
