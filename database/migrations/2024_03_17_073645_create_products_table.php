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
        Schema::create('products', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('name', 191)->index();
            $table->text('description')->nullable();
            $table->double('price', null, 0)->default(0);
            $table->integer('tax')->nullable();
            $table->string('slug')->nullable()->index();
            $table->integer('quantity')->default(0);
            $table->boolean('status')->default(true);
            $table->integer('suggested')->nullable();
            $table->boolean('availability')->default(true);
            $table->boolean('product_source')->default(false);
            $table->unsignedBigInteger('seller_id')->nullable();
            $table->unsignedBigInteger('subcategory_id');
            $table->unsignedBigInteger('commission_id');
            $table->double('commission_value', null, 0);
            $table->double('discount', null, 0)->default(0);
            $table->boolean('discount_status')->default(false);
            $table->timestamps();

            $table->unique(['slug']);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('products');
    }
};
