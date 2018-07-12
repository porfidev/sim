<?php

namespace App\Repositories;

use App\Calculation;

use Illuminate\Support\Facades\Log;

use App\Repositories\OrderRepository;
use App\Repositories\ClienteRepository;

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

	/**
	 * Listado de pedidos ordenedas para la pantalla de jefe en surtido.
	 * Se ordenan por prioridad, fecha de inicio de vigencia y fecha programada.
	 *
	 * @param array $search
	 */
    public function getAllOrd(array $search = null){
    	$list = $this->model->select(
				"*",
				"orders.status as ordStatus",
				"orders.id as idOrd")
			->leftJoin("orders","orders.id","=","calculations.order_id")
			->leftJoin("clients","orders.code","=","clients.code")
			->orderBy('priority', 'desc')
			->orderBy(OrderRepository::SQL_INICIO)
			->orderBy(self::SQL_FP)
			->orderBy(OrderRepository::SQL_CODIGO_ORDEN);

    	if(!empty($search)) {

    		if(array_key_exists(self::SQL_FP, $search)
				&& !empty($search[self::SQL_FP]) ) {
				$list->where(self::SQL_FP, "like", "%".$search[self::SQL_FP]."%");
			}

			if(array_key_exists(OrderRepository::SQL_CODIGO_ORDEN, $search)
				&& !empty($search[OrderRepository::SQL_CODIGO_ORDEN]) ) {
				$list->where(OrderRepository::SQL_CODIGO_ORDEN, "like", "%".$search[OrderRepository::SQL_CODIGO_ORDEN]."%");
			}

			if(array_key_exists(OrderRepository::SQL_INICIO, $search)
				&& !empty($search[OrderRepository::SQL_INICIO]) ) {
				$list->where(OrderRepository::SQL_INICIO, "like", "%".$search[OrderRepository::SQL_INICIO]."%");
			}

			if(array_key_exists(OrderRepository::SQL_FIN, $search)
				&& !empty($search[OrderRepository::SQL_FIN]) ) {
				$list->where(OrderRepository::SQL_FIN, "like", "%".$search[OrderRepository::SQL_FIN]."%");
			}

			if(array_key_exists(OrderRepository::SQL_ESTATUS, $search)
				&& !empty($search[OrderRepository::SQL_ESTATUS]) ) {
				$operator = "=";
				if(array_key_exists(OrderRepository::STATUS_OPERATOR, $search)
					&& !empty($search[OrderRepository::STATUS_OPERATOR]) ) {
					$operator = $search[OrderRepository::STATUS_OPERATOR];
				}
				$list->where("orders.".OrderRepository::SQL_ESTATUS, $operator, $search[OrderRepository::SQL_ESTATUS]);

				if(array_key_exists(OrderRepository::STATUS_OPERATOR_2, $search)) {
					$operator = $search[OrderRepository::STATUS_OPERATOR_2];
					$list->where("orders.".OrderRepository::SQL_ESTATUS, $operator, $search[OrderRepository::SQL_ESTATUS_2]);
				}
			}

			if(array_key_exists(ClienteRepository::SQL_NOMBRE, $search)
				&& !empty($search[ClienteRepository::SQL_NOMBRE]) ) {
				$list->where(ClienteRepository::SQL_NOMBRE, "like", "%".$search[ClienteRepository::SQL_NOMBRE]."%");
			}

    	}
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