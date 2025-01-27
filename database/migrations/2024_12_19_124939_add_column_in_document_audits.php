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
        Schema::table('document_audits', function (Blueprint $table) {
            $table->json('changes')->nullable()->after('operation');
            $table->String('batch_code')->nullable()->after('changes');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('document_audits', function (Blueprint $table) {
            //
        });
    }
};
