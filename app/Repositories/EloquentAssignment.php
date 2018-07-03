<?php

namespace App\Repositories;

use App\Assignment;

use Illuminate\Support\Facades\Log;

class EloquentAssignment implements AssignmentRepository
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
	public function __construct(Assignment $model)
	{
		$this->model = $model;
    }

    /**
	 * Get all Catalogos.
	 *
	 * @return Illuminate\Database\Eloquent\Collection
	 */
    public function getAll(array $search = null){

    	$list = $this->model->orderBy('id', 'desc');
    	    	
        return $list->paginate(10);
    }

    public function getListAsi($idOrd){

    	$list = $this->model->select("assignments.id as idA","assignments.*","users.name as name","users.id as idUsu")
    						->leftJoin("users","users.id","=","assignments.user_id")
    						->where("assignments.order_id","=",$idOrd);
    	    	
        return $list->get();
    }

    public function getPedUser($idUsr){

    	$list = $this->model->select("orders.*","orders.id as idOrdW","calculations.fP as FP","calculations.priority as prio","clients.name as name")
    						->leftJoin("orders","orders.id","=","assignments.order_id")
    						->leftJoin("calculations","orders.id","=","calculations.order_id")
    						->leftJoin("clients","clients.code","=","orders.code")
    						->where("assignments.user_id","=",$idUsr);

    	return $list;
    }

    /**
	 * Get Catalogo by id.
	 *
	 * @param integer $id
	 *
	 * @return App\Task
	 */

	public function getById($id){

		return $this->model->find($id);

	}


    public function search($idOrd,$idUsr)
	{
		return $this->model->where("order_id","=",$idOrd)
						   ->where("user_id","=",$idUsr)->get()->first();
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