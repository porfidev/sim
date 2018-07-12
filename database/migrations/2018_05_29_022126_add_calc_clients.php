<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class AddCalcClients extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('clients', function (Blueprint $table) {
            $table->string('P')->unique()->after('code');
            $table->string('shops')->unique()->after('P');
            $table->string('sku')->unique()->after('shops');
            //$table->string('package')->unique()->after('sku');
            $table->string('D2')->unique()->after('sku');
            //$table->string('TE')->unique()->after('D2');
            $table->string('CE')->unique()->after('D2');
            $table->string('TP')->unique()->after('CE');
            $table->string('average')->unique()->after('TP');
            //$table->string('D')->unique()->after('average');     
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
