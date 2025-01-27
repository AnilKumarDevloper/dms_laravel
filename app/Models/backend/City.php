<?php

namespace App\Models\backend;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class City extends Model
{
    use HasFactory;
    protected $fillable = [
        'name',
        'state_id',
        'status'
    ];

    public function getState(){
        return $this->belongsTo(State::class, 'state_id');
    }
}
