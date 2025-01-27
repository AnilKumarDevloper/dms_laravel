<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;
use App\Models\backend\DepartmentType;
use App\Models\backend\DocumentComment;
use App\Models\backend\DocumentPermission;
use App\Models\backend\Hotel;
use App\Models\backend\role_types;
use App\Models\backend\RoleType;
use App\Models\backend\Department;
use App\Models\backend\Unit;
use App\Models\backend\UserHierarchy;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;
use Spatie\Permission\Traits\HasRoles;
use Illuminate\Database\Eloquent\SoftDeletes;

class User extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable, SoftDeletes;
    use HasRoles;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'name',
        'email',
        'password',
        'phone',
        'profile_image',
        'created_by',
        'role_type_id',
        'status',
        'department_id',
        'department_type_id',
        'unit_id',
        'head_department_id',
        'manager_id',
        'team_leader_id',
        'unit_ids',
        'first_name',
        'last_name'
    ];

     
    /**
     * The attributes that should be hidden for serialization.
     *
     * @var array<int, string>
     */
    protected $hidden = [
        'password',
        'remember_token',
    ];

    /**
     * The attributes that should be cast.
     *
     * @var array<string, string>
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
          "unit_ids" => "array"
    ];

    

    // public function getHotels(){
    //     return $this->hasOne(Hotel::class, 'user_id');
    // }

    public function roleType(){
        return $this->belongsTo(RoleType::class, 'role_type_id');
    }

    public function getDepartmentType(){
        return $this->belongsTo(DepartmentType::class, 'department_type_id');
    }

    public function getUserHierarchie(){
        return $this->hasOne(UserHierarchy::class, 'user_id');
    }

    public function getHotelFromHotel(){
        return $this->hasOne(Hotel::class, 'user_id');
    }

    public function getDocumentComment(){
        return $this->hasOne(DocumentComment::class, 'user_id');
    }

    public function getDocumentPermission(){
        return $this->hasOne(DocumentPermission::class, 'user_id');
    }

    public function getUnit(){
        return $this->belongsTo(Unit::class, 'unit_id');
    }

    public function getHead(){
        return $this->belongsTo(User::class, 'head_department_id');
    }
    public function getManager(){
        return $this->belongsTo(User::class, 'manager_id');
    }
    public function getTeamLeader(){
        return $this->belongsTo(User::class, 'team_leader_id');
    }
    


}
