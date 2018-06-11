<?php

namespace App\Repositories;

use App\Calculation;

use Illuminate\Support\Facades\Log;

class EloquentCalculation implements CalculationRepository
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
	public function __construct(Calculation $model)
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
    	    	
        return $list->paginate(10);
    }

    function getAllEsp(){

    	$list = $this->model->orderBy('id', 'desc');
    	    	
        return $list->get();
    }

    function getAllOrd(){

    	$list = $this->model->select("*","orders.status as ordStatus","orders.id as idOrd")
    						->leftJoin("orders","orders.id","=","calculations.order_id")
    						->leftJoin("clients","orders.code","=","clients.code")
    						->orderBy('priority', 'desc');
    	    	
        return $list;
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

    public function getIdCalc($idOrd){

    	return $this->model->where(self::SQL_ORDID,'=',$idOrd)->get()->first()->id;
    }

    public function getCalc($idOrd){

    	return $this->model->where(self::SQL_ORDID,'=',$idOrd)->get()->first();
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