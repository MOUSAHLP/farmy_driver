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
        Schema::create('user_addresses', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('name');
            $table->string('address')->nullable();
            $table->double('latitude', null, 0);
            $table->double('longitude', null, 0);
            $table->unsignedBigInteger('user_id')->index('user_addresses_user_id_foreign');
            $table->string('area')->nullable();
            $table->string('street')->nullable();
            $table->string('building')->nullable();
            $table->string('building_number')->nullable();
            $table->string('floor')->nullable();
            $table->tinyInteger('is_favourite')->default(0);
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
        Schema::dropIfExists('user_addresses');
    }
};
