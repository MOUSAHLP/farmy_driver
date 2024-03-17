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
        Schema::table('order_delivery_attributes', function (Blueprint $table) {
            $table->foreign(['delivery_attribute_id'])->references(['id'])->on('delivery_attributes')->onUpdate('restrict')->onDelete('cascade');
            $table->foreign(['order_id'])->references(['id'])->on('orders')->onUpdate('restrict')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('order_delivery_attributes', function (Blueprint $table) {
            $table->dropForeign('order_delivery_attributes_delivery_attribute_id_foreign');
            $table->dropForeign('order_delivery_attributes_order_id_foreign');
        });
    }
};
