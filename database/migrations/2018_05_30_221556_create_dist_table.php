<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateDistTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('dist', function (Blueprint $table) {
            $table->increments('id');
            $table->string('place');
            $table->integer('days');
            $table->integer('points');
            $table->timestamps();
        });

        Schema::table('calculations', function (Blueprint $table) {

            $table->dropColumn('Dist');
            
            $table->integer('dist_id')->unsigned()->after('order_id');
            $table->foreign('dist_id')->references('id')->on('dist');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('dist');
    }
}
