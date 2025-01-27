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
        Schema::create('assigned_check_lists', function (Blueprint $table) {
            $table->id();
            $table->String('category')->nullable();
            $table->integer('category_id')->nullable();
            $table->String('item_name')->nullable();
            $table->tinyInteger('is_checked')->nullable()->comment("0 = unchecked, 1 = checked");
            $table->String('make_model')->nullable();
            $table->String('make_manufacture')->nullable();
            $table->String('unit_location')->nullable();
            $table->String('qty')->nullable();
            $table->String('item_status')->nullable()->comment('1 = new, 2 = processing, 3 = complete');
            $table->String('remark')->nullable();
            $table->unsignedBigInteger('department_id')->nullable();
            $table->String('group_id')->nullable()->comment('group by category');
            $table->String('order')->nullable()->comment('order number');
            $table->unsignedBigInteger('check_list_information_id')->nullable();
            $table->String('status')->nullable()->comment('0 = Inactive, 1 = Active'); 
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('assigned_check_lists');
    }
};
