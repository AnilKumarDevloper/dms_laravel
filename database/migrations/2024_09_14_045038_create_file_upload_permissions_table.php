<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('file_upload_permissions', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('main_folder_id')->nullable();
            $table->unsignedBigInteger('sub_folder_id')->nullable();
            $table->json('user_ids')->nullable();
            $table->unsignedBigInteger('access_given_by')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('file_upload_permissions');
    }
};
