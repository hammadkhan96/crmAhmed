<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class UpdateClientsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('clients', function (Blueprint $table) {
            $table->dropColumn('vat');
            $table->dropColumn('company_type');
            $table->dropColumn('zipcode');
            $table->longText('purpose')->nullable();
            $table->date('date')->nullable();
            $table->time('time')->nullable();
            $table->string('category')->nullable();
            $table->tinyInteger('status_id')->index();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('clients', function (Blueprint $table) {
            $table->string('vat');
            $table->string('company_type');
            $table->string('zipcode');
            $table->dropColumn('purpose');
            $table->dropColumn('date');
            $table->dropColumn('time');
            $table->dropColumn('category');
            $table->dropColumn('status_id');
        });
    }
}
