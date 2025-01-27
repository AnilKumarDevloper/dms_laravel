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
        Schema::table('file_upload_permissions', function (Blueprint $table) {
            $table->unsignedBigInteger('user_id')->nullable()->after('user_ids');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('file_upload_permissions', function (Blueprint $table) {
            //
        });
    }
};
