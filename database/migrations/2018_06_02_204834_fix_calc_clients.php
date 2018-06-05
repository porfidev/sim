<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class FixCalcClients extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('clients', function (Blueprint $table) {

            $table->dropColumn('P');
            $table->dropColumn('shops');
            $table->dropColumn('sku');
            $table->dropColumn('package');
            $table->dropColumn('D2');
            $table->dropColumn('TE');
            $table->dropColumn('CE');
            $table->dropColumn('TP');
            $table->dropColumn('average');
            $table->dropColumn('D');

        });

        Schema::table('clients', function (Blueprint $table) {

            $table->string('P')->after('code');
            $table->string('shops')->after('P');
            $table->string('sku')->after('shops');
            $table->string('package')->after('sku');
            $table->string('D2')->after('package');
            $table->string('TE')->after('D2');
            $table->string('CE')->after('TE');
            $table->string('TP')->after('CE');
            $table->string('average')->after('TP');
            $table->string('D')->after('average');     
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        
    }
}
