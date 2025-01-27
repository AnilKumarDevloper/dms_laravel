<?php

namespace App\Models\backend;

use App\Models\User;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class DepartmentType extends Model{
    use HasFactory, SoftDeletes;

    protected $fillable = [
        'name',
        'short_name',
        'user_id',
        'status'
    ];
    public function getDepartId(){
        return $this->hanMany(User::class, 'role_type_id');
    }

    public function getUser(){
        return $this->hasMany(User::class, 'department_type_id');
    }

    public function getMasterCheckLists() {
        return $this->hasMany(MasterCheckList::class, 'department_id');
    }

    public function folders(){
        return $this->hasMany(Folder::class);
    }

    public function getDocument(){
        return $this->hasMany(Document::class, 'department_type_id');
    }

    public function getAccessibleDepartmentList(){
        return $this->hasMany(UserMainFolderPermission::class, 'main_folder_permission_lists_id');
    }
    
}
