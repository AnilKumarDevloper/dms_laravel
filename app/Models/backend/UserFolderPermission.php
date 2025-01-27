<?php

namespace App\Models\backend;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class UserFolderPermission extends Model
{
    use HasFactory;
    protected $table = 'user_sub_folder_permissions';

    protected $fillable = [
        "sub_folder_id",
        "user_id",
        "status",
        "access_given_by",
    ];

    public function getSubFolders(){
        return $this->belongsTo(SubFolder::class, 'sub_folder_id');
    }
    
}
