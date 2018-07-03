<?php

namespace App\Repositories;

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
	 * Create a new Order Design.
	 *
	 * @param array $attributes
	 *
	 * @return App\OrderDesign
	 */
	public function createDesign(array $attributes)
	{
		return $this->design->create($attributes);
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
        return $list->paginate(10);
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