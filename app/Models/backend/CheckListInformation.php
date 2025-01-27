<?php

namespace App\Models\backend;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class CheckListInformation extends Model
{
    use HasFactory;

    protected $fillable = [
        "hotel_name",
        "hotel_detail",
        "title",
        "description",
        "start_date",
        "start_time",
        "end_date",
        "end_time",
        "status",
        "user_id"
    ];  
public function getAssignedCheckList(){
    return $this->hasMany(AssignedCheckList::class, 'check_list_information_id');
}

}
