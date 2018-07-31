<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AddStatusTrip extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        /*Schema::table('trips', function (Blueprint $table) {

            $table->dropForeign(['truck_id']);
            $table->dropColumn('truck_id');
        });*/

        Schema::table('trips', function (Blueprint $table) {

            $table->integer('truck_id')->after('finish_date')->unsigned()->nullable();
            $table->foreign('truck_id')->references('id')->on('trucks');

            $table->integer('foreign_truck')->after('truck_id')->unsigned()->nullable();
            $table->foreign('foreign_truck')->references('id')->on('catalogs');

            $table->integer('status')->after('foreign_truck')->unsigned()->nullable();
            $table->string('guide_number')->after('status')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('trips', function (Blueprint $table) {            
            $table->dropForeign(['truck_id']);
            $table->dropColumn('truck_id');

            $table->dropForeign(['foreign_truck']);
            $table->dropColumn('foreign_truck');

            $table->dropColumn('status');
            $table->dropColumn('guide_number');
        });
    }
}
