<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up()
    {
     Schema::table('buses', function (Blueprint $table) {
         $table->foreignId('chauffeur_id')->constrained('chauffeurs')->onDelete('cascade');
     });
    }
    

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('buses', function (Blueprint $table) {
            $table->foreignId('chauffeur_id')->constrained('chauffeurs')->onDelete('cascade');
        });
    }
};
