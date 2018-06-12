<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreatePurchaseItemsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('purchase_items', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('purchase_id')->unsigned();
            $table->foreign('purchase_id')->references('id')->on('purchases');
            $table->string('ItemCode', 50)->nullable();
            $table->integer('product_id')->unsigned()->nullable();
            $table->float('quantity', 19, 6)->default(0);
            $table->string('CodeBars', 254)->nullable();
            $table->float('u_CantReq', 19, 6)->default(0)->nullable();
            $table->string('DistNumber', 36)->nullable();
            $table->timestamp('u_Caducidad')->nullable();
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
        Schema::dropIfExists('purchase_items');
    }
}
