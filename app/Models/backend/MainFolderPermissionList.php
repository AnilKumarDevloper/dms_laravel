<?php

namespace App\Models\backend;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class MainFolderPermissionList extends Model
{
    use HasFactory, SoftDeletes;

    protected $fillable = [
        "name",
        "main_folder_id",
        "department_type_id",
        "group_name",
        "group_id",
        "status",
    ];

  
}
