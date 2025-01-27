<?php

namespace App\Http\Controllers\backend;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\backend\Menu;

class DataBaseEntryController extends Controller
{
    
    public function index()
    {
        return view('backend.database_entry.index');
    }
    public function create(Request $request)
    {
        $name = $request->name;
        $display_name = $request->display_name;
        $description = $request->description;
        $url = $request->url;
        $permission_name = $request->permission_name;
        $route_name = $request->route_name;
        $order = $request->order;
        $parent_menu_id = $request->parent_menu_id;

        $newMenu  = Menu::create([

            'name' => $name,
            'display_name' => $display_name, 
            'description' => $description,
            'url' => $url,
            'permission_name' => $permission_name,
            'route_name' => $route_name,
            'order' => $order,
            'parent_menu_id' => $parent_menu_id,
            'status' => 1,

        ]);
        return redirect()->route('backend.database_entry.index')->with('success', "User has been added successfully");
    }
}
