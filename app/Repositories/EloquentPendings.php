<?php

namespace App\Repositories;

use DB;

use App\Pendings;

use Illuminate\Support\Facades\Log;

class EloquentPendings implements PendingsRepository
{
    /**
	 * @var $model
	 */
	private $model;

    /**
	 * EloquentBoxes constructor.
	 *
	 * @param App\Catalogo $model
	 */
	public function __construct(Pendings $model)
	{
		$this->model = $model;
    }

    /**
	 * Get all Catalogos.
	 *
	 * @return Illuminate\Database\Eloquent\Collection
	 */
    function getAll(){
    	$list = $this->model
    			->with('order', 'cliente', 'user', 'distance')
    			->whereNull('user_id')
    			->orderBy('id', 'desc'); 
        return $list->get();
    }

    /**
	 * Get all Catalogos.
	 *
	 * @return Illuminate\Database\Eloquent\Collection
	 */
    function getUserPed($id){

    	$list = $this->model
    			->with('order', 'cliente', 'user', 'distance')
    			->where('user_id',"=",$id)
    			->orderBy('id', 'desc'); 
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
	 * Get Catalogo by pedido.
	 *
	 * @param integer $id
	 *
	 * @return App\Box
	 */
	public function getByIdPed($id)
	{
		return $this->model->where("order_id","=",$id)->get()->first();
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