<?php

namespace App\Models\backend;

use App\Models\User;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;   

class Unit extends Model
{
    use HasFactory, SoftDeletes ;

    protected $fillable = [
        "name",
        "email",
        "phone",
        "location",
        "created_by",
        "department_id",
        "state",
        "city"
    ];

    public function getDepartmentHead(){
        return $this->belongsTo(User::class, 'department_id');
    }
}
