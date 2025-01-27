<?php

namespace App\Models\backend;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class MainCategory extends Model
{
    use HasFactory;

    protected $fillable = [
        "name",
        "description",
        "status"
    ];

    public function getSubCategory(){
        return $this->hasMany(SubCategory::class, 'main_category_id');
    }

    
}
