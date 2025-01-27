<?php

namespace App\Models\backend;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Folder extends Model
{
    use HasFactory;
    protected $fillable = ['department_type_id', 'folder_name', 'status'];

    public function sub_folders(){
        return $this->hasMany(Folder::class);
    }
}
