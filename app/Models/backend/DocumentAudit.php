<?php

namespace App\Models\backend;

use App\Models\User;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class DocumentAudit extends Model
{
    use HasFactory;
   protected $fillable = [
    "user_id",
    "document_id",
    "main_folder_id",
    "sub_folder_id",
    "operation",
    "status",
    "status",
    "status",
    "changes",
    "batch_code",
    "role_type_id"
   ];

   protected $casts = [
     'changes' => 'array', // Cast JSON to PHP array
 ];


   public function getUser(){
    return $this->belongsTo(User::class, 'user_id');
   }

   public function getDocument(){
    return $this->belongsTo(Document::class, 'document_id')->withTrashed();
   }

   public function getMainFolder(){
        return $this->belongsTo(MainFolder::class, 'main_folder_id');
   }

   public function getSubFolder(){
        return $this->belongsTo(SubFolder::class, 'sub_folder_id');
   }

   public function getRoleType(){
     return $this->belongsTo(RoleType::class, 'role_type_id');
   }

}
