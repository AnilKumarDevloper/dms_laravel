<?php

namespace App\Models\backend;

use App\Models\User;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class RoleType extends Model
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
