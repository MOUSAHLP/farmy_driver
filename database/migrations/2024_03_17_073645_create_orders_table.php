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
            $table->bigIncrements('id');
            $table->integer('order_number')->default(1000);
            $table->unsignedBigInteger('user_id')->index('orders_user_id_foreign');
            $table->unsignedBigInteger('driver_id')->nullable()->index('orders_driver_id_foreign');
            $table->tinyInteger('status');
            $table->unsignedBigInteger('delivery_method_id')->index('orders_delivery_method_id_foreign');
            $table->unsignedBigInteger('payment_method_id')->index('orders_payment_method_id_foreign');
            $table->unsignedBigInteger('user_address_id')->index('orders_user_address_id_foreign');
            $table->unsignedBigInteger('city_id')->nullable();
            $table->time('start_time')->nullable();
            $table->time('end_time')->nullable();
            $table->double('latitude', null, 0)->nullable();
            $table->double('longitude', null, 0)->nullable();
            $table->boolean('payment_status')->default(false);
            $table->double('total', null, 0)->default(0);
            $table->date('date');
            $table->text('notes')->nullable();
            $table->text('changes')->nullable();
            $table->softDeletes();
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
        Schema::dropIfExists('orders');
    }
};
