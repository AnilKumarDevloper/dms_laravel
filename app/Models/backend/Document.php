<?php

namespace App\Models\backend;

use App\Models\User;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Document extends Model
{
    use HasFactory, SoftDeletes;
    protected $fillable = [
       'name',
       'main_category_id',
       'sub_category_id',
       'description',
       'role_type_id',
       'user_id',
       'start_date',
       'start_time',
       'end_date',
       'end_date',
       'can_download',
       'doc_file',
       'admin_id',
       'disk',
       'status',
       'document_title',
       'main_folder_id',
       'sub_folder_id',
       'department_type_id', 
       'doc_path',
       'assigned_users', 
       'owner_id',
       'converted_file'
    ];
    protected $casts = [
        'assigned_users' => 'array'
    ];

    public function getMainFolder(){
        return $this->belongsTo(MainFolder::class, 'main_folder_id');
    }

    public function getSubFolder(){
        return $this->belongsTo(SubFolder::class, 'sub_folder_id');
    }

    public function getDepartmentType(){
        return $this->belongsTo(DepartmentType::class, 'department_type_id');
    }

    public function getTask(){
        return $this->hasMany(Task::class, 'document_id');
    }

    public function getOwner(){
        return $this->belongsTo(User::class, 'owner_id');
    }
    
    
}
