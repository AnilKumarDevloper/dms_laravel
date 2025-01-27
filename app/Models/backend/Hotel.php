<?php

namespace App\Models\backend;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\User;
class Hotel extends Model
{
    use HasFactory;
    protected $fillable = [
        'name',
        'location',
        'user_id',
        'status'

    ];
    // public function getUser(){
    //     return $this->belongsTo(User::class, 'user_id');
    // }
    
    public function getUserForHotel(){
        return $this->belongsTo(User::class, 'id');
    }

    
}
