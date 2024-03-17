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
        Schema::table('product_related_product', function (Blueprint $table) {
            $table->foreign(['product_id'])->references(['id'])->on('products')->onUpdate('restrict')->onDelete('restrict');
            $table->foreign(['related_product_id'])->references(['id'])->on('products')->onUpdate('restrict')->onDelete('restrict');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('product_related_product', function (Blueprint $table) {
            $table->dropForeign('product_related_product_product_id_foreign');
            $table->dropForeign('product_related_product_related_product_id_foreign');
        });
    }
};
