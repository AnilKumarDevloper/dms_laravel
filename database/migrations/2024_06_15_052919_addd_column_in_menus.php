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
        Schema::table('menus', function (Blueprint $table) {
            $table->String('method')->nullable()->after('permission_name');
            $table->String('controller_name')->nullable()->after('method');
            $table->String('function')->nullable()->after('controller_name'); 
            $table->unsignedBigInteger('group_id')->nullable()->after('parent_menu_id');
            $table->String('group_name')->nullable()->after('group_id');
            


        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('menus', function (Blueprint $table) {
            //
        });
    }
};
