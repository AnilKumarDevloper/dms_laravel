<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void{
        Schema::create('tasks', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('document_id')->nullable();
            $table->DateTime('assign_date')->nullable();
            $table->unsignedBigInteger('doc_uploaded_by')->nullable();
            $table->unsignedBigInteger('assigned_by')->nullable();
            $table->unsignedBigInteger('assigned_to')->nullable();
            $table->unsignedBigInteger('main_folder_id')->nullable();
            $table->unsignedBigInteger('sub_folder_id')->nullable();
            $table->String('document_name')->nullable();
            $table->String('ducument_url')->nullable();
            $table->Date('start_date')->nullable();
            $table->Time('start_time')->nullable();
            $table->Date('end_date')->nullable();
            $table->Time('end_time')->nullable();
            $table->unsignedBigInteger('deleted_by')->nullable();
            $table->tinyInteger('status')->nullable();
            $table->softDeletes(); 
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void{
        Schema::dropIfExists('tasks');
    }
};
