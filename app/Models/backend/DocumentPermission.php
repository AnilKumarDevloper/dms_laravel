<?php

namespace App\Models\backend;

use App\Models\User;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class DocumentPermission extends Model
{
    use HasFactory;

    protected $fillable = [
        "user_id",
        "document_id",
        "read",
        "write",
        "download",
        "access_given_by",
    ];

    public function document(){
        return $this->belongsTo(Document::class, 'doc_id');
    }

    public function user(){
        return $this->belongsTo(User::class, 'user_id');
    }
    
}

