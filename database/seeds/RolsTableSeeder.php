<?php

use Illuminate\Database\Seeder;

class RolsTableSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        DB::table('rols')->insert(
            array(
                'rol'         => 'ADMIN',
                'description' => 'Administrador del sistema'
            )
        );

        /* ********************* */
        /*  Jefatura de almacén  */
        /* ********************* */
        DB::table('rols')->insert(
            array(
                'rol'         => 'DIRECCION',
                'description' => 'Dirección General'
            )
        );

        DB::table('rols')->insert(
            array(
                'rol'         => 'JEFE_ALMACEN',
                'description' => 'Jefe de Almacén'
            )
        );

        /* ********************* */
        /*    Recibo y Almacén   */
        /* ********************* */
        DB::table('rols')->insert(
            array(
                'rol'         => 'RECIBO_Y_ALMACEN',
                'description' => 'Responsable de recibo y Almacen'
            )
        );

        DB::table('rols')->insert(
            array(
                'rol'         => 'SURTIDO_A',
                'description' => 'Encargado de Surtido a Almacén'
            )
        );

        DB::table('rols')->insert(
            array(
                'rol'         => 'PASILLO',
                'description' => 'Encargado de pasillo'
            )
        );

        DB::table('rols')->insert(
            array(
                'rol'         => 'A_GENERAL',
                'description' => 'Ayudante General'
            )
        );

        /* ************************** */
        /*   Preparación de pedidos   */
        /* ************************** */
        DB::table('rols')->insert(
            array(
                'rol'         => 'EMBALAJE',
                'description' => 'Responsable de Embalaje'
            )
        );

        DB::table('rols')->insert(
            array(
                'rol'         => 'SURTIDO_PP',
                'description' => 'Responsable de surtido'
            )
        );

        DB::table('rols')->insert(
            array(
                'rol'         => 'PP_GENERAL',
                'description' => 'Ayudante General'
            )
        );

        /* ************************** */
        /*        Devoluciones        */
        /* ************************** */
        DB::table('rols')->insert(
            array(
                'rol'         => 'DEVOLUCIONES',
                'description' => 'Responsable de devoluciones'
            )
        );

        /* ******************************* */
        /*     Jefatura de distribución    */
        /* ******************************* */
        DB::table('rols')->insert(
            array(
                'rol'         => 'COORDINADOR',
                'description' => 'Coordinador de distribución'
            )
        );

        DB::table('rols')->insert(
            array(
                'rol'         => 'CAPTURISTA',
                'description' => 'Capturista'
            )
        );

        DB::table('rols')->insert(
            array(
                'rol'         => 'AUXILIAR',
                'description' => 'Auxiliar administrativo'
            )
        );

        /* ******************************* */
        /*           Distribución          */
        /* ******************************* */

        DB::table('rols')->insert(
            array(
                'rol'         => 'EMBARQUE',
                'description' => 'Responsable de embarque'
            )
        );

        DB::table('rols')->insert(
            array(
                'rol'         => 'A_EMBARQUE',
                'description' => 'Ayudante de embarque'
            )
        );

        DB::table('rols')->insert(
            array(
                'rol'         => 'CHOFER',
                'description' => 'Chofer'
            )
        );

        DB::table('rols')->insert(
            array(
                'rol'         => 'A_DISTRIBUCION',
                'description' => 'Ayudante de distribución'
            )
        );
    }
}
