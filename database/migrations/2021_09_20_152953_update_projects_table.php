<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class UpdateProjectsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('projects', function (Blueprint $table) {
            $table->integer('qoutation_status')->nullable();
            $table->integer('invoice_status')->nullable();
            $table->string('location')->nullable();
            $table->date('qoutation_date')->nullable();
            $table->date('invoice_date')->nullable();
            $table->string('invoice')->nullable();
            $table->string('qoutation')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('projects', function (Blueprint $table) {
            $table->dropColumn('qoutation_status');
            $table->dropColumn('invoice_status');
            $table->dropColumn('location');
            $table->dropColumn('qoutation_date');
            $table->dropColumn('invoice_date');
            $table->dropColumn('invoice');
            $table->dropColumn('qoutation');
        });
    }
}
