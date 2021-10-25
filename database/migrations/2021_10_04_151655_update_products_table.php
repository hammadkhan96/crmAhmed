<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class UpdateProductsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('products', function (Blueprint $table) {
            $table->integer('joint_width')->nullable();
            $table->integer('visible_surface')->nullable();
            $table->integer('profile_height')->nullable();
            $table->integer('total_width')->nullable();
            $table->string('surface')->nullable();
            $table->integer('movement_capacity')->nullable();
            $table->string('load_capacity')->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('products', function (Blueprint $table) {
            $table->dropColumn('joint_width');
            $table->dropColumn('visible_surface');
            $table->dropColumn('profile_height');
            $table->dropColumn('total_width');
            $table->dropColumn('surface');
            $table->dropColumn('movement_capacity');
            $table->dropColumn('load_capacity');
        });
    }
}
