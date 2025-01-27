<?php

namespace App\Models\backend;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SubCategory extends Model
{
    use HasFactory;

    protected $fillable = [
        'name',
        'description',
        'main_category_id',
        'status'
    ];


    public function getMainCategory(){
        return $this->belongsTo(MainCategory::class, 'main_category_id');
    }
}
