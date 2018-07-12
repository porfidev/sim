<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class RemoveQtyValidationToOrderDesigns extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('order_designs', function (Blueprint $table) {
            $table->dropColumn('quantity_validation');
            $table->integer('box_type_id')->unsigned()->nullable()->after('box_id');
            $table->foreign('box_type_id')->references('id')->on('boxes');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('order_designs', function (Blueprint $table) {
            $table->integer('quantity_validation')->default(0)->after('quantity');
        });
        Schema::table('order_designs', function (Blueprint $table) {
            $table->dropForeign('order_designs_box_type_id_foreign');
        });
        Schema::table('order_designs', function (Blueprint $table) {
            $table->dropColumn('box_type_id');
        });
    }
}
