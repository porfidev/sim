<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AddDetailIdDistribution extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('distribution', function (Blueprint $table) {
            $table->integer('order_detail_id')->after('shop')->unsigned();
        });

        Schema::table('distribution', function (Blueprint $table) {
            
            $table->foreign('order_detail_id')->references('id')->on('order_details');

        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        //
    }
}
