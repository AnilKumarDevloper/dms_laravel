<?php

namespace App\Models\backend;

use App\Models\User;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Department extends Model
{
    use HasFactory;

    protected $fillable = [
        'name',
        'user_id',
        'status'
    ];
    public function getDepartId(){
        return $this->hanMany(User::class, 'role_type_id');
    }

    public function getUser(){
        return $this->hasMany(User::class, 'department_id');
    }

    public function getMasterCheckLists() {
        return $this->hasMany(MasterCheckList::class);
    }

    public function folders()
    {
        return $this->hasMany(Folder::class);
    }


}
