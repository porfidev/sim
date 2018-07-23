<?php

namespace App\Repositories;

use DB;

use App\Order;
use App\OrderTrace;
use App\OrderDesign;

use Illuminate\Support\Facades\Log;

class EloquentOrder implements OrderRepository
{
    /**
	 * @var $model
	 */
	private $model;

	/**
	 * @var $trace
	 */
	private $trace;

	/**
	 * @var $design
	 */
	private $design;

    /**
	 * EloquentRol constructor.
	 *
	 * @param App\Catalogo $model
	 */
	public function __construct(
		Order $model,
		OrderTrace $trace,
		OrderDesign $design)
	{
		$this->model  = $model;
		$this->trace  = $trace;
		$this->design = $design;
    }

	/**
	 * Función para obtener la lista de productos de una caja en el disño
	 * de pedido
	 * 
	 * @param integer $order_id
	 * @param integer $sequence
	 * @return Illuminate\Database\Eloquent\Collection
	 */
	public function getDesignBySequence($order_id, $sequence)
	{
		return $this->design->where(self::DESIGN_ORDER, '=', $order_id)
			->where(self::DESIGN_SEQUENCE, '=', $sequence)
			->get();
	}

	/**
	 * Función para obtener cuanto de un producto ya esta en el diseño
	 * del pedido.
	 * 
	 * @param integer $order_id
	 * @param integer $order_detail_id
	 * @return integer
	 */
	public function getUsed($order_id, $order_detail_id)
	{
		return $this->design->select(
				DB::raw("COALESCE(SUM(quantity), 0) as total")
			)
			->where(self::DESIGN_ORDER, '=', $order_id)
			->where(self::DESIGN_ORDER_DETAIL, '=', $order_detail_id)
			->first();
	}

	/**
	 * Obtener los mínimos y máximos de los id`s un pedido
	 * esto para saber que número de caja es
	 *
	 * @param integer $order_id
	 * @return Object
	 */
	public function getMaxMin($order_id){
		return $this->design->select(
				"order_id",
				DB::raw("MAX(sequence) as max"),
				DB::raw("MIN(sequence) as min")
			)
			->where(self::DESIGN_ORDER, '=', $order_id)
			->groupBy("order_id")
			->first();
	}

	/**
	 * Función para traer la lista de elementos de un pedido
	 *
	 * @param integer $order_id
	 * @return Illuminate\Database\Eloquent\Collection
	 */
	public function getDesignListByOrder($order_id)
	{
		Log::info("EloquentOrder - getDesignListByOrder: $order_id");
		$order = $this->model->find($order_id);
		return $order->details;
	}

	/**
	 * Función para traer la lista de elemtos registrados en una caja
	 *
	 * @param integer $box_id
	 * @return Illuminate\Database\Eloquent\Collection
	 */
	public function getDesignListByBox($box_id)
	{
		Log::info("EloquentOrder - getDesignListByBox: $box_id");
		return $this->design->with('orderDetail', 'order')
			->where(self::DESIGN_BOX, '=', $box_id)
			->get();
	}

	/**
	 * Create a new Order Design.
	 *
	 * @param array $attributes
	 *
	 * @return App\OrderDesign
	 */
	public function createDesign(array $attributes)
	{
		Log::info("EloquentOrder - createDesign: ".json_encode($attributes));
		return $this->design->create($attributes);
	}

	/**
	 * Función para borrar un registro de la tabla de diseño de orden
	 * 
	 * @param integer $id
	 */
	public function deleteDesign($id)
	{
		return $this->design->find($id)->delete();
	}

	/**
	 * Función para obtener la lista de tareas de un pedido
	 * en preparación cuado es por producto (item).
	 *
	 * @param integer $order_id
	 */
	public function getDesignGroupByItem($order_id)
	{
		$order = $this->design->select(
				'order_designs.order_detail_id',
				DB::raw('count(*) as cajas'),
				DB::raw('MAX(assignments.user_id) as usuario'))
			->with('orderDetail')
			->leftJoin('assignments', 'order_designs.id', '=', 'assignments.order_design_id')
			->where('order_designs.'.self::DESIGN_ORDER, '=', $order_id)
			->groupBy('order_detail_id');

		Log::info("EloquentOrder getDesignByItem - SQL: ".$order->toSql());
		return $order->get();
	}

	/**
	 * Función para obtener la lista de registro de diseño de pedido
	 * asisiados al detalle del pedido proporcionado.
	 *
	 * @param integer $order_detail_id
	 * @return Illuminate\Database\Eloquent\Collection
	 */
	public function getDesignsByDetail($order_detail_id)
	{
		$order = $this->design->where(self::DESIGN_ORDER_DETAIL, '=', $order_detail_id);
		Log::info("EloquentOrder getDesignsByDetail - SQL: ".$order->toSql());
		return $order->get();
	}

	/**
	 * Update a OrderDesign.
	 *
	 * @param integer $id
	 * @param array $attributes
	 *
	 * @return App\OrderDesign
	 */
	public function updateDesign($id, array $attributes)
	{
		return $this->design->find($id)->update($attributes);
	}

    /**
	 * Get the order´s list fiter by the search parameters
	 *
	 * @param array $search
	 *
	 * @return Illuminate\Database\Eloquent\Collection
	 */
    public function getAll(array $search = null) {
		Log::info("EloquentOrder - getAll - params: [ ".implode(" ,", $search)." ]");
		$list = $this->model->with('calculation', 'client')
			->orderBy('updated_at', 'desc');
		if(!empty($search)) {
    		if(array_key_exists(self::SQL_ID, $search)
				&& !empty($search[self::SQL_ID]) ) {
				$list->where(self::SQL_ID, "like", "%".$search[self::SQL_ID]."%");
			}
			if(array_key_exists(self::SQL_ESTATUS, $search)) {
				$operator = "=";
				if(array_key_exists(self::STATUS_OPERATOR, $search)
					&& !empty($search[self::STATUS_OPERATOR]) ) {
					$operator = $search[self::STATUS_OPERATOR];
				}
				$list->where(self::SQL_ESTATUS, $operator, $search[self::SQL_ESTATUS]);
			}
			if(array_key_exists(self::STATUS_OPERATOR_2, $search)) {
				$operator = $search[self::STATUS_OPERATOR_2];
				$list->where(self::SQL_ESTATUS, $operator, $search[self::SQL_ESTATUS_2]);
			}
		}
		Log::info("EloquentOrder - getAll - SQL: ".$list->toSql());
        return $list->get();
    }

    /**
	 * Get Catalogo by id.
	 *
	 * @param integer $id
	 *
	 * @return App\Order
	 */
	public function getById($id)
	{
		return $this->model->find($id);
    }

    /**
	 * Get order by id with client.
	 *
	 * @param integer $id
	 *
	 * @return App\Order
	 */
	public function getByIdCli($id)
	{
		return $this->model->select("orders.*","clients.name as cliName")
						   ->leftJoin("clients","clients.code","=","orders.code")
						   ->where("orders.".$this::SQL_ID,"=",$id)
						   ->get()->first();
    }

    /**
	 * Get Catalogo by numat.
	 *
	 * @param integer $id
	 *
	 * @return App\Order
	 */
	public function getByNumat($numat)
	{
		return $this->model->where($this::SQL_NUMAT, "=", $numat)->first();
    }

	/**
	 * Función que obtiene la primer orden por código
	 *
	 * @param String $code
	 * @return App\Order
	 */
    public function getByCode($code){

		return $this->model->where(self::SQL_CODIGO_ORDEN, "=", $code)
			->first();
    }

    /**
	 * Función que obtiene la primer orden por código
	 *
	 * @param String $code
	 * @return App\Order
	 */
    public function getByCodeCli($code){

		return $this->model->where(self::SQL_CODIGO, "=", $code)
			->get();
    }

    /**
	 * Función que obtiene la primer orden por código
	 *
	 * @param String $code
	 * @return App\Order
	 */
    public function getIdOrdByBox($id){

		return $this->design->where(self::DESIGN_BOX, "=", $id)
			->get()->first();
    }

    /**
	 * Función que obtiene la primer orden por código
	 *
	 * @param String $code
	 * @return App\Order
	 */
    public function getByCodeDist($distId){

		return $this->model->where(self::SQL_DIST_ID, "=", $distId)->get();
    }

    /**
	 * Create a new Order.
	 *
	 * @param array $attributes
	 *
	 * @return App\Order
	 */
	public function create(array $attributes)
	{
		return $this->model->create($attributes);
    }

    /**
	 * Update a Order.
	 *
	 * @param integer $id
	 * @param array $attributes
	 *
	 * @return App\Order
	 */
	public function update($id, array $attributes)
	{
		return $this->model->find($id)->update($attributes);
	}

	/**
	 * Delete a Order.
	 *
	 * @param integer $id
	 *
	 * @return boolean
	 */
	public function delete($id)
	{
		return $this->model->find($id)->delete();
	}

	/**
	 * Add a order`s trace
	 *
	 * @param array $attributes
	 * @return App\OrderTrace
	 */
	public function addTrace(array $attributes)
	{
		return $this->trace->create($attributes);
	}
}