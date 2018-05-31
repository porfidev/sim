<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateProductsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('products', function (Blueprint $table) {
            $table->increments('id');
            $table->string('sku', 50)->unique();
            $table->string('concept', 150)->nullable();
            $table->string('alias', 150)->nullable();
            $table->float('weight_per_piece', 15, 2)->default(0);
            $table->integer('items_per_display')->default(0);
            $table->integer('display_per_box')->default(0);
            $table->float('weight_per_display', 15, 2)->default(0);
            $table->float('weight_per_box', 15, 2)->default(0);
            $table->float('width', 15, 2)->default(0);
            $table->float('height', 15, 2)->default(0);
            $table->float('depth', 15, 2)->default(0);
            $table->string('barcode', 150)->nullable();
            $table->string('display_barcode', 150)->nullable();
            $table->string('corrugated_barcode', 150)->nullable();
            $table->integer('user_id')->nullable()->unsigned();
            $table->foreign('user_id')->references('id')->on('users');
            $table->timestamps();
            $table->softDeletes();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('products');
    }
}
