<?php

namespace App\Models\Backend;

use App\Models\User;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use App\Models\backend\Document;
use App\Models\backend\MainFolder;
use App\Models\backend\SubFolder;

class Task extends Model
{
    use HasFactory, SoftDeletes;

    protected $fillable = [
        "document_id",
        "assign_date",
        "doc_uploaded_by",
        "assigned_by",
        "assigned_to",
        "main_folder_id",
        "sub_folder_id",
        "document_name",
        "ducument_url",
        "start_date",
        "start_time",
        "end_date",
        "end_time",
        "deleted_by",
        "status",
        "current_status",
        "description",
        "title"
    ];

    public function getDocument(){
        return $this->belongsTo(Document::class, 'document_id');
    }

    public function getAssignedTo(){
        return $this->belongsTo(User::class, 'assigned_to');
    }

    public function getAssignedBy(){
        return $this->belongsTo(User::class, 'assigned_by');
    }

    public function getMainFolder(){
        return $this->belongsTo(MainFolder::class, 'main_folder_id');
    }

    public function getSubFolder(){
        return $this->belongsTo(SubFolder::class, 'sub_folder_id');
    }

    
}
