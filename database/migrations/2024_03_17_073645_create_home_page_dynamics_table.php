<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('home_page_dynamics', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->enum('type', ['category', 'section', 'slider']);
            $table->string('order');
            $table->string('title_ar');
            $table->string('title_en');
            $table->string('link')->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('home_page_dynamics');
    }
};
