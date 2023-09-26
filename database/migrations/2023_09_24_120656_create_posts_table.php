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
        Schema::create('posts', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->integer('user_id');
            $table->text('text');
            $table->dateTime('uploaded_on');
            $table->integer('active');
            $table->text('text_color');
            $table->text('bg_color');
            $table->text('symbol');
            $table->text('emotion_text');
            $table->text('emotion_bg_color');
            $table->text('ratings');
            $table->text('total_rating');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('posts');
    }
};
