<?php

namespace App\Repositories;

use App\Box;

use Illuminate\Support\Facades\Log;

class EloquentBoxes implements BoxesRepository
{
    /**
	 * @var $model
	 */
    private $model;

    /**
	 * EloquentRol constructor.
	 *
	 * @param App\Catalogo $model
	 */
	public function __construct(Cliente $model)
	{
		$this->model = $model;
    }

    /**
	 * Get all Catalogos.
	 *
	 * @return Illuminate\Database\Eloquent\Collection
	 */
    function getAll(array $search = null){

    	$list = $this->model->orderBy('id', 'desc');

    	if(!empty($search)) {

    		if(array_key_exists(self::SQL_ID, $search)
				&& !empty($search[self::SQL_ID]) ) {
				$list->where(self::SQL_ID, "like", "%".$search[self::SQL_ID]."%");
			}

			if(array_key_exists(self::SQL_NOMBRE, $search)
				&& !empty($search[self::SQL_NOMBRE]) ) {
				$list->where(self::SQL_NOMBRE, "like", "%".$search[self::SQL_NOMBRE]."%");
			}
			if(array_key_exists(self::SQL_CORREO, $search)
				&& !empty($search[self::SQL_CORREO]) ) {
				$list->where(self::SQL_CORREO, "like", "%".$search[self::SQL_CORREO]."%");
			}
			if(array_key_exists(self::SQL_TELEFONO, $search)
				&& !empty($search[self::SQL_TELEFONO]) ) {
				$list->where(self::SQL_TELEFONO, "like", "%".$search[self::SQL_TELEFONO]."%");
			}
			if(array_key_exists(self::SQL_RFC, $search)
				&& !empty($search[self::SQL_RFC]) ) {
				$list->where(self::SQL_RFC, "like", "%".$search[self::SQL_RFC]."%");
			}
			if(array_key_exists(self::SQL_CP, $search)
				&& !empty($search[self::SQL_CP]) ) {
				$list->where(self::SQL_CP, "like", "%".$search[self::SQL_CP]."%");
			}
			if(array_key_exists(self::SQL_CIUDAD, $search)
				&& !empty($search[self::SQL_CIUDAD]) ) {
				$list->where(self::SQL_CIUDAD, "like", "%".$search[self::SQL_CIUDAD]."%");
			}

			if(array_key_exists(self::SQL_DIRECCION, $search)
				&& !empty($search[self::SQL_DIRECCION]) ) {
				$list->where(self::SQL_DIRECCION, "=", $search[self::SQL_DIRECCION]);
			}
			if(array_key_exists(self::SQL_ESTATUS, $search)) {
				$list->where(self::SQL_ESTATUS, "=", $search[self::SQL_ESTATUS]);
			}

			if(array_key_exists(self::SQL_CODE, $search)) {
				$list->where(self::SQL_CODE, "=", $search[self::SQL_CODE]);
			}

			if(array_key_exists(self::SQL_P, $search)) {
				$list->where(self::SQL_P, "=", $search[self::SQL_P]);
			}

			if(array_key_exists(self::SQL_SHOPS, $search)) {
				$list->where(self::SQL_SHOPS, "=", $search[self::SQL_SHOPS]);
			}

			if(array_key_exists(self::SQL_SKU, $search)) {
				$list->where(self::SQL_SKU, "=", $search[self::SQL_SKU]);
			}

			if(array_key_exists(self::SQL_PACK, $search)) {
				$list->where(self::SQL_PACK, "=", $search[self::SQL_PACK]);
			}

			if(array_key_exists(self::SQL_D2, $search)) {
				$list->where(self::SQL_D2, "=", $search[self::SQL_D2]);
			}

			if(array_key_exists(self::SQL_TE, $search)) {
				$list->where(self::SQL_TE, "=", $search[self::SQL_TE]);
			}

			if(array_key_exists(self::SQL_CE, $search)) {
				$list->where(self::SQL_CE, "=", $search[self::SQL_CE]);
			}

			if(array_key_exists(self::SQL_TP, $search)) {
				$list->where(self::SQL_TP, "=", $search[self::SQL_TP]);
			}

			if(array_key_exists(self::SQL_AVERAGE, $search)) {
				$list->where(self::SQL_AVERAGE, "=", $search[self::SQL_AVERAGE]);
			}

			if(array_key_exists(self::SQL_D, $search)) {
				$list->where(self::SQL_D, "=", $search[self::SQL_D]);
			}

    	}

    	Log::debug("EloquentCatalogo - getList - SQL: ".$list->toSql());
        return $list->paginate(10);
    }

    /**
	 * Get Catalogo by id.
	 *
	 * @param integer $id
	 *
	 * @return App\Task
	 */
	public function getById($id)
	{
		return $this->model->find($id);
    }

    /**
	 * Create a new Catalogo.
	 *
	 * @param array $attributes
	 *
	 * @return App\Catalogo
	 */
	public function create(array $attributes)
	{
		return $this->model->create($attributes);
    }

    /**
	 * Update a Catalogo.
	 *
	 * @param integer $id
	 * @param array $attributes
	 *
	 * @return App\Catalogo
	 */
	public function update($id, array $attributes)
	{
		return $this->model->find($id)->update($attributes);
	}

	/**
	 * Delete a Catalogo.
	 *
	 * @param integer $id
	 *
	 * @return boolean
	 */
	public function delete($id)
	{
		return $this->model->find($id)->delete();
	}
}