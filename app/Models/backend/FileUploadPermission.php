<?php

namespace App\Models\backend;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class FileUploadPermission extends Model
{
    use HasFactory;

    protected $fillable = [
        "main_folder_id",
        "sub_folder_id",
        "user_ids",
        "access_given_by", 
        "user_id", 
    ];

    protected $casts = [
        "user_ids" => 'array'
    ];
}

