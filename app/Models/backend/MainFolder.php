<?php

namespace App\Models\backend;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Backend\Document;
use Illuminate\Database\Eloquent\SoftDeletes;

class MainFolder extends Model
{
    use HasFactory, SoftDeletes;

    protected $fillable = [
        "name",
        "department_type_id",
        "status"
    ];

    public function getDocumnet(){
        return $this->hasMany(Document::class, 'main_folder_id');
    }

    public function getSubFolder(){
        return $this->hasMany(SubFolder::class, 'main_folder_id');
    }
}
