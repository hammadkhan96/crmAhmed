<?php

use Illuminate\Database\Seeder;
use App\Models\Permission;

class UpdatePermissionSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //client visit
        $createClientVisit = new Permission;
        $createClientVisit->display_name = 'Create Client Visit';
        $createClientVisit->name = 'client-visit-create';
        $createClientVisit->description = 'Permission to create client visit';
        $createClientVisit->grouping = 'client';
        $createClientVisit->save();

    }
}
