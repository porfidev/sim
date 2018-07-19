<?php

namespace App\Repositories;

use DB;

use App\PallBox;

use Illuminate\Support\Facades\Log;

class EloquentPallBox implements PallBoxRepository
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
	public function __construct(PallBox $model)
	{
		$this->model = $model;
    }

    /**
	 * Get all Catalogos.
	 *
	 * @return Illuminate\Database\Eloquent\Collection
	 */
    public function getAll(){
    	$list = $this->model->with('boxId','pallet')->orderBy('id', 'desc');
        return $list->get();
    }

    public function getAllTar($tar){
    	$list = $this->model->with('boxId','pallet')
    						->where(self::SQL_PALLET_ID,"=",$tar)
    						->orderBy('id', 'desc');
        return $list->get();
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

	public function getByPallBox($idPall,$idBox)
	{
		return $this->model->where(self::SQL_BOX_ID,"=",$idBox)
						   ->where(self::SQL_PALLET_ID,"=",$idPall)->get()->first();
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