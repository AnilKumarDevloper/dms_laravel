<?php

namespace App\Models\backend;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class FolderPermissionList extends Model
{
    use HasFactory, SoftDeletes;
    protected $table = 'sub_folder_permission_lists';

    protected $fillable = [
        "name",
        "folder_id",
        "department_type_id",
        "group_name",
        "group_id",
        "status",
        "main_folder_id",
        "sub_folder_id",
    
    ];
}
