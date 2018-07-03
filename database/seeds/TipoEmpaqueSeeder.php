<?php

use Illuminate\Database\Seeder;

use \App\Catalogo;

use \App\Repositories\CatalogoRepository;

class TipoEmpaqueSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        /**
         * Catálogo de unidades
         */
        $te = new Catalogo();
        $te = $te->create(
            array(
                CatalogoRepository::SQL_ETIQUETA => CatalogoRepository::TE_GROUP,
                CatalogoRepository::SQL_VALOR    => '1'
            )
        );

        DB::table('catalogs')->insert(
            array(
                CatalogoRepository::SQL_GRUPO_ID => $te->id,
                CatalogoRepository::SQL_ETIQUETA => 'Exhibidor',
                CatalogoRepository::SQL_VALOR    => '2'
            )
        );

        DB::table('catalogs')->insert(
            array(
                CatalogoRepository::SQL_GRUPO_ID => $te->id,
                CatalogoRepository::SQL_ETIQUETA => 'Mixto',
                CatalogoRepository::SQL_VALOR    => '1.8'
            )
        );

        DB::table('catalogs')->insert(
            array(
                CatalogoRepository::SQL_GRUPO_ID => $te->id,
                CatalogoRepository::SQL_ETIQUETA => 'Caja',
                CatalogoRepository::SQL_VALOR    => '1'
            )
        );
    }
}
