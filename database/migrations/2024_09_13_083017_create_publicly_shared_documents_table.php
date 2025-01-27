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
        Schema::create('publicly_shared_documents', function (Blueprint $table) {
            $table->id();
            $table->String('doc_file')->nullable();
            $table->String('shared_url')->nullable();
            $table->String('email')->nullable(); 
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('publicly_shared_documents');
    }
};
