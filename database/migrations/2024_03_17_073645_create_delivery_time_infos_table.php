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
        Schema::create('delivery_time_infos', function (Blueprint $table) {
            $table->increments('id');
            $table->time('start_time')->nullable();
            $table->time('end_time')->nullable();
            $table->string('before_message')->nullable();
            $table->string('after_message')->nullable();
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
        Schema::dropIfExists('delivery_time_infos');
    }
};
