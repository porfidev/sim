<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreatePallBoxTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('pall_box', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('box_id')->unsigned();
            $table->foreign('box_id')->references('id')->on('box_ids');
            $table->integer('pallet_id')->unsigned();
            $table->foreign('pallet_id')->references('id')->on('pallet');
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
        Schema::dropIfExists('pall_box');
    }
}
