<?php

namespace App\Models\backend;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PubliclySharedDocument extends Model
{
    use HasFactory;

    protected $fillable = [
        "doc_file",
        "shared_url",
        "email",
        "link_valid_until"
    ];
}
