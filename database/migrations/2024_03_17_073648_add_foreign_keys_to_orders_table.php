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
        Schema::table('orders', function (Blueprint $table) {
            $table->foreign(['delivery_method_id'])->references(['id'])->on('delivery_methods')->onUpdate('restrict')->onDelete('cascade');
            $table->foreign(['driver_id'])->references(['id'])->on('drivers')->onUpdate('restrict')->onDelete('cascade');
            $table->foreign(['payment_method_id'])->references(['id'])->on('payment_methods')->onUpdate('restrict')->onDelete('cascade');
            $table->foreign(['user_address_id'])->references(['id'])->on('user_addresses')->onUpdate('restrict')->onDelete('cascade');
            $table->foreign(['user_id'])->references(['id'])->on('users')->onUpdate('restrict')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('orders', function (Blueprint $table) {
            $table->dropForeign('orders_delivery_method_id_foreign');
            $table->dropForeign('orders_driver_id_foreign');
            $table->dropForeign('orders_payment_method_id_foreign');
            $table->dropForeign('orders_user_address_id_foreign');
            $table->dropForeign('orders_user_id_foreign');
        });
    }
};
