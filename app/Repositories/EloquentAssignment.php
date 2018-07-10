<?php

namespace App\Repositories;

use DB;

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

	/**
	 * Función para obtener la lista de trabajadores asignados a un pedido.
	 *
	 * @param integer $idOrd
	 * @return Illuminate\Database\Eloquent\Collection
	 */
    public function getListAsi($idOrd){
		Log::info("EloquentAssignment - getListAsi - idOrd: $idOrd");
    	$list = $this->model->select(
						"assignments.id as idA",
						"assignments.*",
						"users.name as name",
						"users.id as idUsu" )
					->leftJoin("users","users.id","=","assignments.user_id")
					->where("assignments.order_id","=",$idOrd);
		Log::info("EloquentAssignment - getListAsi - SQL: ".$list->toSql());
        return $list->get();
    }

	/**
	 * Función para obtener las tareas faltantes de un pedido.
	 * En la etapa de preparación de pedidos
	 *
	 * @param integer $order_id
	 * @return Illuminate\Database\Eloquent\Collection
	 */
	public function getMissings($order_id)
	{
		return $this->model
			->whereNotNull(self::SQL_ORDER_DESIGN)
			->where(self::SQL_ORDID, '=', $order_id)
			->where(self::SQL_STATUS, '=', self::STATUS_CREATED)
			->get();
	}

	/**
	 * Función que obtiene las tareas definidas para un trabajador
	 * en el área de preparación de pedidos.
	 *
	 * @param integer $user_id
	 * @param integer $itemsPerPage
	 *
	 * @return Illuminate\Database\Eloquent\Collection
	 */
	public function getOPWorks($user_id, $itemsPerPage)
	{
		$order = $this->model->select(
			'orders.codeOrder',
			'assignments.*',
			'products.sku',
			'products.concept',
			'box_ids.label'
		)
		->leftJoin('orders', 'assignments.order_id', '=', 'orders.id')
		->leftJoin('order_designs', 'assignments.order_design_id', '=', 'order_designs.id')
		->leftJoin('order_details', 'assignments.order_detail_id', '=', 'order_details.id')
		->leftJoin('products', 'order_details.itemcode', '=', 'products.sku')
		->leftJoin('box_ids', 'order_designs.box_id', '=', 'box_ids.id')
		->where('assignments.'.self::SQL_USRID, '=', $user_id)
		->where('assignments.'.self::SQL_STATUS, '=', self::STATUS_CREATED)
		->orderBy('order_id')
		->orderBy('id');

		Log::info("EloquentAssignment - getWorks - SQL: ".$order->toSql());
		return $order->paginate($itemsPerPage);
	}

	/**
	 * Función para obtener el número de caja del pedido
	 *
	 * @param integer $user_id
	 * @param integer $order_id
	 */
	public function getMaxMin($user_id, $order_id) {
		return $this->model->select(
				"order_id",
				DB::raw("MAX(order_design_id) as max"),
				DB::raw("MIN(order_design_id) as min")
			)
			->where(self::SQL_USRID, '=', $user_id)
			->where(self::SQL_ORDID, '=', $order_id)
			->groupBy("order_id")
			->first();
	}

	/**
	 * Obtenemos el query de la lista de tareas por trabajador
	 * en la etapa de surtido.
	 *
	 * @param integer $idUsr
	 * @return Illuminate\Database\Query\Builder
	 */
    public function getPedUser($idUsr){
    	$list = $this->model->select(
				"orders.*",
				"orders.id as idOrdW",
				"calculations.fP as FP",
				"calculations.priority as prio",
				"clients.name as name")
			->leftJoin("orders","orders.id","=","assignments.order_id")
			->leftJoin("calculations","orders.id","=","calculations.order_id")
			->leftJoin("clients","clients.code","=","orders.code")
			->where("assignments.user_id","=",$idUsr)
			->whereNull("assignments.order_design_id");
		Log::info("EloquentAssignment - getPedUser - SQL: ".$list->toSql());
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