<?php

namespace App\Repositories;

use DB;

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
	 * Función que obtiene la caja de tamaño mas grande.
	 *
	 * @return App\Box
	 */
	public function getBiggestBox()
	{
		return $this->model
			->select(
				self::SQL_ID,
				DB::raw('MAX(width*height*depth) as volumen')
			)
			->groupBy(self::SQL_ID)
			->orderBy(DB::raw('volumen'), 'desc')
			->first();
	}

	/**
	 * Funció que nos busca la caja más parecida al tamaño que necesitamos
	 *
	 * @param integer $volume
	 * @return App\Box
	 */
	public function getCorrectBox($volume)
	{
		Log::info("EloquentBoxes - getCorrectBox: $volume");
		return $this->model
			->select(
				self::SQL_ID,
				DB::raw('MIN((width*height*depth)-'.$volume.') as volumen')
			)
			->whereRaw('(width*height*depth)-'.$volume.' > ?', [0])
			->groupBy(self::SQL_ID)
			->orderBy(DB::raw('volumen'))
			->first();
	}

	/**
	 * Se búsca una caja por la etiqueta con que se
	 * registró.
	 *
	 * @param String $label
	 * @return App\BoxId
	 */
	public function getBoxByLabel($label)
	{
		return $this->boxId
			->where(self::SQL_BOX_ID_LABEL, '=', $label)
			->first();
	}

	/**
	 * Encontramos una etiqueta por id
	 *
	 * @param integer $id
	 * @return App\BoxId
	 */
	public function findBoxId($id)
	{
		return $this->boxId->find($id);
	}

	/**
	 * Función para cerar un registro en la tabla de
	 * box_ids.
	 *
	 * @param array $attributes
	 * @return App\BoxId
	 */
	public function createBoxId(array $attributes)
	{
		return $this->boxId->create($attributes);
	}

	/**
	 * Función para actualizar los valores de una etiqueta.
	 *
	 * @param  integer $id
	 * @param  Array   $attributes
	 * @return App\BoxId
	 */
	public function updateBoxId($id, array $attributes)
	{
		return $this->boxId->find($id)->update($attributes);
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