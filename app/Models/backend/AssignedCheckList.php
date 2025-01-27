<?php

namespace App\Models\backend;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class AssignedCheckList extends Model
{
    use HasFactory;

    protected $fillable = [
        "category",
        "category_id",
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
        "check_list_information_id",
        "status",
        "user_id"
    ];

    
    public function getCheckListInformation(){
        return $this->belongsTo(CheckListInformation::class, 'check_list_information_id');
    }
}
