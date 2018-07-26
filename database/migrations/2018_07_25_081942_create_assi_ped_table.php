<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateAssiPedTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        /*Schema::create('trip_ord', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('trip_id')->unsigned();
            $table->foreign('trip_id')->references('id')->on('trips');
            $table->integer('order_id')->unsigned();
            $table->foreign('order_id')->references('id')->on('orders');
            $table->timestamps();
        });*/

        Schema::table('trip_pallets', function (Blueprint $table) {

            $table->dropForeign('trip_pallets_pallet_id_foreign');
        });

        Schema::table('trip_pallets', function (Blueprint $table) {
            
            $table->dropColumn('pallet_id');
        });

        Schema::table('trip_pallets', function (Blueprint $table) {

            $table->integer('pallet_id')->unsigned()->after("trip_id")->nullable();
            $table->foreign('pallet_id')->references('id')->on('pallet');
            $table->integer('box_id')->unsigned()->after("pallet_id")->nullable();
            $table->foreign('box_id')->references('id')->on('box_ids');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('trip_ord');
    }
}
