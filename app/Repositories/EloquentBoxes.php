<?php

namespace App\Repositories;

use App\Box;
use App\BoxId;

use Illuminate\Support\Facades\Log;

class EloquentBoxes implements BoxesRepository
{
    /**
	 * @var $model
	 */
	private $model;

	/**
	 * @var $boxId
	 */
	private $boxId;

    /**
	 * EloquentBoxes constructor.
	 *
	 * @param App\Catalogo $model
	 */
	public function __construct(Box $model, BoxId $boxId)
	{
		$this->model = $model;
		$this->boxId = $boxId;
    }

	/**
	 * Función para cerar un registro en la tabla de
	 * box_ids.
	 *
	 * @return App\BoxId
	 */
	public function createBoxId(array $attributes)
	{
		return $this->boxId->create($attributes);
	}

	/**
	 * Función para buscar una caja por nombre
	 *
	 * @param String $name
	 * @return App\Box
	 */
	public function searchByName($name)
	{
		return $this->model->where(self::SQL_DESCRIPCION, 'like', $name)->first();
	}

    /**
	 * Get all Catalogos.
	 *
	 * @return Illuminate\Database\Eloquent\Collection
	 */
    function getAll(){
    	$list = $this->model->orderBy('id', 'desc');
        return $list->get();
    }

    /**
	 * Get Catalogo by id.
	 *
	 * @param integer $id
	 *
	 * @return App\Box
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
	 * @return App\Box
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
	 * @return App\Box
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