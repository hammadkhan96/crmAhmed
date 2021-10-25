<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;
use App\Models\Permission;

class CreateStockInsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('stock_ins', function (Blueprint $table) {
            $table->id();
            $table->string('product_name');
            $table->string('external_id');
            $table->text('description')->nullable();
            $table->integer('quantity');
            $table->integer('price');
            $table->date('received_date');
            $table->string('received_from');
            $table->integer('received_by');
            $table->timestamps();
        });

        $s1 = Permission::create([
            'display_name' => 'Add stock-In',
            'name' => 'stockIn-create',
            'description' => 'Be able to create stock-In',
            'grouping' => 'stockIn',
        ]);

        $s2 = Permission::create([
            'display_name' => 'Edit stock-In',
            'name' => 'stockIn-edit',
            'description' => 'Be able to edit Stock-In',
            'grouping' => 'stockIn',
        ]);

        $s3 = Permission::create([
            'display_name' => 'Delete Stock-In',
            'name' => 'stockIn-delete',
            'description' => 'Be able to delete Stock-In',
            'grouping' => 'stockIn',
        ]);

        $roles = \App\Models\Role::whereIn('name', ['owner', 'administrator'])->get();
        foreach ($roles as $role) {
            $role->permissions()->attach([$s1->id, $s2->id, $s3->id]);
        }
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('stock_ins');
    }
}
