<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AddDesignToAssigments extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('assignments', function (Blueprint $table) {
            $table->integer('order_design_id')->unsigned()->nullable()->after('order_id');
            $table->foreign('order_design_id')->references('id')->on('order_designs');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('assignments', function (Blueprint $table) {
            $table->dropForeign('assignments_order_design_id_foreign');
        });

        Schema::table('assignments', function (Blueprint $table) {
            $table->dropColumn('order_design_id');
        });
    }
}
