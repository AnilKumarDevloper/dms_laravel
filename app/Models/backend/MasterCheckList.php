<?php

namespace App\Models\backend;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class MasterCheckList extends Model
{
    use HasFactory;

    protected $fillable = [
        "category_id",
        "category",
        "item_name",
        "is_checked",
        "make_model",
        "make_manufacture",
        "unit_location",
        "qty",
        "item_status",
        "remark",
        "department_id",
        "group_id",
        "order",
        "status", 
    ];
}
