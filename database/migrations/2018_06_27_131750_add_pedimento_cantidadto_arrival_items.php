<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AddPedimentoCantidadtoArrivalItems extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('arrival_items', function (Blueprint $table) {
            $table->string('pedimento')->after('ItemCode')->nullable(); 
            $table->timestamp('caducidad_minima')->after('u_Caducidad')->nullable();
            $table->integer('cantidad_rec')->after('quantity')->unsigned()->nullable();

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
