<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class DeleteForeignBoxInAssignments extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('assignments', function (Blueprint $table) {
            $table->dropForeign('assignments_box_id_foreign');
        });

        Schema::table('assignments', function (Blueprint $table) {
            $table->dropColumn('box_id');
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
            $table->integer('box_id')->unsigned()->nullable()->after('order_id');
            $table->foreign('box_id')->references('id')->on('box_ids');
        });
    }
}
