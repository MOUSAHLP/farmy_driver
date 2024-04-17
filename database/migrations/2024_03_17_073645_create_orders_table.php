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
        Schema::create('orders', function (Blueprint $table) {
            $table->id();
            $table->integer('order_number')->default(1000)->autoIncrement();
            $table->unsignedBigInteger('user_id');
            $table->unsignedBigInteger('driver_id')->nullable();
            $table->integer('status');
            $table->unsignedBigInteger('delivery_method_id');
            $table->unsignedBigInteger('payment_method_id');
            $table->unsignedBigInteger('user_address_id');
            $table->unsignedBigInteger('city_id')->nullable();
            $table->time('start_time')->nullable();
            $table->time('end_time')->nullable();
            $table->double('latitude')->nullable();
            $table->double('longitude')->nullable();
            $table->boolean('payment_status')->default(0);
            $table->double('coupon_discount')->default(0);
            $table->double('delivery_fee')->default(0);
            $table->double('sub_total')->default(0);
            $table->double('total')->default(0);
            $table->date('date');
            $table->text('notes')->nullable();
            $table->integer('rate')->default(0);
            $table->text('change')->nullable();
            $table->softDeletes();
            $table->timestamps();

            $table->foreign('delivery_method_id')->references('id')->on('delivery_methods')->onDelete('cascade');
            $table->foreign('payment_method_id')->references('id')->on('payment_methods')->onDelete('cascade');
            $table->foreign('user_address_id')->references('id')->on('user_addresses')->onDelete('cascade');
            $table->foreign('user_id')->references('id')->on('users')->onDelete('cascade');
            $table->foreign('driver_id')->references('id')->on('drivers')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('orders');
    }
};
