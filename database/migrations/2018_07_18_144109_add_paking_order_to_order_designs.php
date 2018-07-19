<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AddPakingOrderToOrderDesigns extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('order_designs', function (Blueprint $table) {
            $table->integer('packing_order')->default(0)->after('sequence');
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
            $table->dropColumn('packing_order');
        });
    }
}
