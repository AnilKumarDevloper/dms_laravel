<?php

namespace App\Models\backend;

use App\Models\User;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class LoginAudit extends Model
{
    use HasFactory;

    protected $fillable = [
        "user_id",
        "email",
        "ip",
        "latitude",
        "longitude",
        "status",
    ];

    public function getUser(){
        return $this->belongsTo(User::class, 'user_id');
    }
}
