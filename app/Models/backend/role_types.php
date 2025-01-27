<?php

namespace App\Models\backend;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\User;

class role_types extends Model
{
    use HasFactory;
    
    protected $fillable = [
        "name",
        "user_id",
        "status"
    ];
    public function getRoleName()
    {
        return $this->hanMany(User::class, 'role_type_id');
    }
}
