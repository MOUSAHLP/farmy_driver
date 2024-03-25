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
        Schema::create('users', function (Blueprint $table) {
            $table->bigIncrements('id');
            $table->string('first_name');
            $table->string('last_name');
            $table->date('birthday')->nullable();
            $table->string('email')->nullable()->index();
            $table->string('password');
            $table->string('address')->nullable();
            $table->bigInteger('phone')->index();
            $table->unsignedBigInteger('role_id')->default(2);
            $table->double('latitude', null, 0)->nullable();
            $table->double('longitude', null, 0)->nullable();
            $table->boolean('status')->default(true);
            $table->text('fcm_token')->nullable();
            $table->unsignedBigInteger('city_id')->nullable()->index('users_city_id_foreign');
            $table->rememberToken();
            $table->softDeletes();
            $table->timestamps();

            $table->unique(['email']);
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('users');
    }
};
