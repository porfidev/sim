<?php

use Illuminate\Database\Seeder;

use App\Rol;

class UsersTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $admin = Rol::where('rol', '=', 'ADMIN')->first();
        DB::table('users')->insert(
            array(
                'rol_id'   => $admin->id,
                'name'     => 'Jaime Ulises Cruz Macías',
                'email'    => 'jaimeucm@gmail.com',
                'password' => bcrypt('J41m3Ul1s3s.')
            )
        );

        DB::table('users')->insert(
            array(
                'rol_id'   => $admin->id,
                'name'     => 'Enrique López Aldama',
                'email'    => 'enriqueprogra@gmail.com',
                'password' => bcrypt('enriqueprogra.')
            )
        );
    }
}
