<?php

namespace App\Http\Controllers\backend;

use App\Http\Controllers\Controller;
use App\Models\backend\{SubFolder, MainFolder};
use App\Models\backend\DepartmentType;
use App\Models\backend\Document;
use App\Models\backend\Unit;
use Illuminate\Http\Request;

class ApiController extends Controller
{
  public function getSubFolderList(Request $request){
    try{
        $department_id = $request->department_id;
        $main_folder_id = MainFolder::where('department_type_id', $department_id)->first()->id;
        $sub_folders = SubFolder::where('main_folder_id', $main_folder_id)->get();
         return response()->json([
            "status" => "success",
            "folders" => $sub_folders
         ], 200);
    }catch(\Exception $e){
        return response()->json([
            "status" => "error",
            "mesage" => $e->getMessage()
        ], 400);
    }
  }

  public function fetchChartData(){
    try{
      $departments = DepartmentType::withCount('getDocument')
      ->get(['name', 'get_document_count']); 
        $labels = $departments->pluck('short_name');
        $data = $departments->pluck('get_document_count'); 
        return response()->json([
          "status" => "success",
            'labels' => $labels,
            'data' => $data
        ]);
    }catch(\Exception $e){
      return response()->json([
        "status" => "failed",
        "error" => $e->getMessage()
      ]);
    }
  }

  public function getSFolderWithMfolderId(Request $request){
    try{
        $sub_folder_list = SubFolder::where('main_folder_id', $request->main_folder_id)->get();
        return response()->json([
          "status" => "success",
          "sub_folder_list" => $sub_folder_list,
        ], 200);
    }catch(\Exception $e){
      return response()->json([
        "status" => "failed",
        "error" => $e->getMessage()
      ], 400);
    }
  }

  public function getDocumentList(Request $request){
    try{
      $document_list = Document::where('main_folder_id', $request->main_folder_id)
      ->where('sub_folder_id', $request->sub_folder_id)->get();
      return response()->json([
        "status" => "success",
        "document_list" => $document_list
      ], 200);
    }catch(\Exception $e){
      return response()->json([
        "status" => "failed",
        "error" => $e->getMessage()
      ], 400);
    }
  }

  public function checkUnitExistence(Request $request){
    try{
      $unit = Unit::where('name', $request->name)
      ->where('city', $request->city)->exists();
      if($unit){
        return response()->json([
          "status" => "unit_already_exist",
        ]);
      }else{
        return response()->json([
          "status" => "success"
        ]);
      }
    }catch(\Exception $e){
      return response()->json([
        "status" => "failed",
        "error" => $e->getMessage()
      ]);
    }
  }
}
// testing