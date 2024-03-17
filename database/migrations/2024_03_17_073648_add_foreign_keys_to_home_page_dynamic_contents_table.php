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
        Schema::table('home_page_dynamic_contents', function (Blueprint $table) {
            $table->foreign(['banner_id'])->references(['id'])->on('banners')->onUpdate('restrict')->onDelete('cascade');
            $table->foreign(['category_id'])->references(['id'])->on('categories')->onUpdate('restrict')->onDelete('cascade');
            $table->foreign(['home_page_dynamic_id'])->references(['id'])->on('home_page_dynamics')->onUpdate('restrict')->onDelete('cascade');
            $table->foreign(['product_id'])->references(['id'])->on('products')->onUpdate('restrict')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('home_page_dynamic_contents', function (Blueprint $table) {
            $table->dropForeign('home_page_dynamic_contents_banner_id_foreign');
            $table->dropForeign('home_page_dynamic_contents_category_id_foreign');
            $table->dropForeign('home_page_dynamic_contents_home_page_dynamic_id_foreign');
            $table->dropForeign('home_page_dynamic_contents_product_id_foreign');
        });
    }
};
