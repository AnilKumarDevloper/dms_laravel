<?php

namespace App\Models\backend;

use App\Models\User;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class UserHierarchy extends Model
{
    use HasFactory;

    protected $fillable = [
        "user_id",
        "head_department_id",
        "hotel_id",
        "hoted_department_id",
        "manager_id",
        "team_leader_id",
        "status"
    ];

    public function getUser(){
        return $this->belongsTo(User::class, 'user_id');
    }

    public function getHeadDepartment(){
        return $this->belongsTo(User::class, 'head_department_id');
    }

    public function getHotel(){
        return $this->belongsTo(User::class, 'hotel_id');
    }
    public function getHotelDepartment(){
        return $this->belongsTo(User::class, 'hoted_department_id');
    }
    public function getManager(){
        return $this->belongsTo(User::class, 'manager_id');
    }
    public function getTeamLeader(){
        return $this->belongsTo(User::class, 'team_leader_id');
    }
    
  
        

}
