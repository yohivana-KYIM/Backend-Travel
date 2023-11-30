<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    /**
     * Run the migrations.
     */
    public function up(): void
{
   Schema::create('buses', function (Blueprint $table) {
       $table->id();

       $table->integer('capacitemaximale')->default(200);
       $table->string('photo');
       $table->enum('statut', ['active', 'inactif'])->default('inactif');
       $table->string('modelebus');

       $table->foreignId('trajet_id')->constrained('trajets')->cascadeOnDelete();
       $table->softDeletes();
       $table->timestamps();
   });
}


    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('buses');
    }
};
