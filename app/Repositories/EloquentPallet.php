<?php

namespace App\Repositories;

use DB;

use App\Pallet;

use Illuminate\Support\Facades\Log;

class EloquentPallet implements PalletRepository
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
	public function __construct(Pallet $model)
	{
		$this->model = $model;
    }

    /**
	 * Get all Catalogos.
	 *
	 * @return Illuminate\Database\Eloquent\Collection
	 */
    public function getAll(){
    	$list = $this->model->orderBy('id', 'desc');
        return $list->paginate(10);
    }

	/**
	 * Get Distribution by id.
	 *
	 * @param integer $id
	 *
	 * @return App\Distribution
	 */
	public function getById($id)
	{
		return $this->model->find($id);
	}

	/**
	 *
	 * @param array $attributes
	 *
	 * @return App\Catalogo
	 */
	public function idInc(){

		return $this->model->id;
    }

    /**
	 *
	 * @param array $attributes
	 *
	 * @return App\Catalogo
	 */
	public function create(array $attributes){

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
	public function update($id, array $attributes){

		return $this->model->find($id)->update($attributes);
	}

	/**
	 * Delete a Catalogo.
	 *
	 * @param integer $id
	 *
	 * @return boolean
	 */

	public function delete($id){
		return $this->model->find($id)->delete();
	}
}