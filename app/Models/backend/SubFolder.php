<?php

namespace App\Models\backend;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;


class SubFolder extends Model
{
    use HasFactory, SoftDeletes;

    protected $fillable = [
        "name",
        "main_folder_id",
        "status",
    ];

    public function getDocument(){
        return $this->hasMany(Document::class, 'sub_folder_id');
    }
    public function getUserPermissionList(){
        return $this->hasOne(UserFolderPermission::class, 'folder_permission_list_id');
    }

    public function getMainFolder(){
        return $this->belongsTo(MainFolder::class, 'main_folder_id');
    }
}
