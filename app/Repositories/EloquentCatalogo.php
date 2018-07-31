<?php

namespace App\Repositories;

use App\Catalogo;

use Illuminate\Support\Facades\Log;

class EloquentCatalogo implements CatalogoRepository
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
	public function __construct(Catalogo $model)
	{
		$this->model = $model;
    }

    /**
	 * Get all Catalogos.
	 *
	 * @return Illuminate\Database\Eloquent\Collection
	 */
    public function getAll(array $search = null){

    	$list = $this->model->with('myParent')->orderBy('id', 'desc');

    	if(!empty($search)) {

    		if(array_key_exists(self::SQL_ID, $search)
				&& !empty($search[self::SQL_ID]) ) {
				$list->where(self::SQL_ID, "like", "%".$search[self::SQL_ID]."%");
			}

			if(array_key_exists(self::SQL_ETIQUETA, $search)
				&& !empty($search[self::SQL_ETIQUETA]) ) {
				$list->where(self::SQL_ETIQUETA, "like", "%".$search[self::SQL_ETIQUETA]."%");
			}

			if(array_key_exists(self::SQL_GRUPO_ID, $search)
				&& !empty($search[self::SQL_GRUPO_ID]) ) {

				if($search[self::SQL_GRUPO_ID] == -1){

					$list->whereNull(self::SQL_GRUPO_ID);

				}else{

					$list->where(self::SQL_GRUPO_ID, "like", "%".$search[self::SQL_GRUPO_ID]."%");
				}
			}

			if(array_key_exists(self::SQL_VALOR, $search)
				&& !empty($search[self::SQL_VALOR]) ) {
				$list->where(self::SQL_VALOR, "like", "%".$search[self::SQL_VALOR]."%");
			}

    	}

    	Log::debug("EloquentCatalogo - getList - SQL: ".$list->toSql());
        return $list->paginate(10);
    }

	/**
	 * Get the group catalog items.
	 *
	 * @return Illuminate\Database\Eloquent\Collection
	 */
	public function getGroup($group)
	{
		$groupParent = $this->model->where(self::SQL_ETIQUETA, '=', $group)
			->whereNull(self::SQL_GRUPO_ID)
			->first();

		$groupList = array();
		if(!empty($groupParent)) {
			$groupList = $this->model->where(self::SQL_GRUPO_ID, '=', $groupParent->id)
				->orderBy(self::SQL_VALOR)
				->get();
		}

		return $groupList;
	}

	/**
	 * Get the group catalog items.
	 *
	 * @return Illuminate\Database\Eloquent\Collection
	 */
	public function getGroupById($group_id)
	{
		$groupList = array();
		$group = $this->model->find($group_id);
		if(!empty($group)) {
			$groupList = $this->model->where(self::SQL_GRUPO_ID, '=', $group_id)
				->orderBy(self::SQL_VALOR)
				->get();
		}

		return $groupList;
	}

	/**
	 * Get the group catalog items.
	 *
	 * @return Illuminate\Database\Eloquent\Collection
	 */
	public function getGroupByGroup($group_id)
	{
		
		$groupList = $this->model->where(self::SQL_GRUPO_ID, '=', $group_id)
			->orderBy(self::SQL_VALOR)
			->get();
		

		return $groupList;
	}

	/**
	 * Función para buscar un elemento de un grupo
	 * a partir de los nombres del grupo y del elemento
	 *
	 * @param String $group
	 * @param String $text
	 *
	 * @return Illuminate\Database\Eloquent\Collection
	 */
	public function searchGroupItem($group, $text)
	{
		Log::info("EloquentCatalogo - searchGroupItem: $group - $text");
		$groupParent = $this->model->where(self::SQL_ETIQUETA, '=', $group)
			->whereNull(self::SQL_GRUPO_ID)
			->first();

		$catalog = null;
		if(!empty($groupParent)) {
			$catalog = $this->model->where(self::SQL_GRUPO_ID, '=', $groupParent->id)
				->where(self::SQL_ETIQUETA, 'like', $text)
				->first();
		}
		return $catalog;
	}

	/**
	 * Get the group catalog items.
	 *
	 * @return Illuminate\Database\Eloquent\Collection
	 */
	public function getByLabel($label){

		return $this->model->where(self::SQL_ETIQUETA, '=', $label)->first()->value;
	}

	public function getByLabelFull($label){

		return $this->model->where(self::SQL_ETIQUETA, '=', $label)->first();
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
	 * Get Catalogo by id.
	 *
	 * @param integer $id
	 *
	 * @return App\Task
	 */
	public function getPadres(){

		return $this->model->whereNull(self::SQL_GRUPO_ID)->get();
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