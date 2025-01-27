<?php

namespace App\Models\backend;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class UserMainFolderPermission extends Model
{
    use HasFactory;
    protected $fillable = [
        "main_folder_id",
        "user_id",
        "access_given_by",
        "status",
    ];

    public function getDepartmentType(){
        return $this->belongsTo(DepartmentType::class, 'main_folder_permission_lists_id');
    }
}
