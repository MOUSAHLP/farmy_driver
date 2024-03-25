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
        Schema::create('sellers', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('name')->index();
            $table->double('latitude', null, 0)->nullable();
            $table->double('longitude', null, 0)->nullable();
            $table->boolean('status')->default(true);
            $table->unsignedBigInteger('area_id')->index('sellers_area_id_foreign');
            $table->enum('type', ['internal', 'external']);
            $table->double('discount', null, 0)->default(0);
            $table->boolean('discount_status')->default(false);
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
        Schema::dropIfExists('sellers');
    }
};
