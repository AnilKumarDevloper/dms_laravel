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
        Schema::create('main_folder_permission_lists', function (Blueprint $table) {
            $table->id();
            $table->String('name')->nullable();
            $table->unsignedBigInteger('main_folder_id')->nullable();
            $table->unsignedBigInteger('department_type_id')->nullable();
            $table->String('group_name')->nullable();
            $table->Integer('group_id')->nullable();
            $table->tinyInteger('status')->default(1);
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('main_folder_permission_lists');
    }
};
