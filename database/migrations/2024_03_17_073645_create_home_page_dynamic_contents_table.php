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
        Schema::create('home_page_dynamic_contents', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->unsignedBigInteger('home_page_dynamic_id')->index('home_page_dynamic_contents_home_page_dynamic_id_foreign');
            $table->unsignedBigInteger('product_id')->nullable()->index('home_page_dynamic_contents_product_id_foreign');
            $table->unsignedBigInteger('category_id')->nullable()->index('home_page_dynamic_contents_category_id_foreign');
            $table->unsignedBigInteger('banner_id')->nullable()->index('home_page_dynamic_contents_banner_id_foreign');
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
        Schema::dropIfExists('home_page_dynamic_contents');
    }
};
