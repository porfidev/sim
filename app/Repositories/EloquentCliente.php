<?php

namespace App\Repositories;

use App\Cliente;

use Illuminate\Support\Facades\Log;

class EloquentCliente implements ClienteRepository
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