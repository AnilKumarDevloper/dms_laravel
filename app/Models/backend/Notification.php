<?php

namespace App\Models\backend;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Notification extends Model
{
    use HasFactory;

    protected $fillable = [
        "user_id",
        "title",
        "notification",
        "notification_for",
        "task_id",
        "document_id",
        "read_status",
        "status",
        "url",
        "icon"
    ];
}
