<?php

namespace App\Repositories;

use App\OrderDetail;

use Illuminate\Support\Facades\Log;

class EloquentOrderDetail implements OrderDetailRepository
{
    /**
	 * @var $model
	 */
    private $model;

    /**
	 * EloquentRol constructor.
	 *
	 * @param App\OrderDetail $model
	 */
	public function __construct(OrderDetail $model)
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


    /**
	 * Get Catalogo by id.
	 *
	 * @param integer $id
	 *
	 * @return App\OrderDetail
	 */
	public function getById($id)
	{
		return $this->model->find($id);
    }

	/**
	 * Función para obtener el listado de elementos de la orden
	 *
	 * @param integer $id
	 * @return Illuminate\Database\Eloquent\Collection
	 */
    public function getByIdOrd($id)
	{
		$orderList = $this->model->select(
				"orders.status as sta",
				"order_details.*",
				"orders.id as idD",
				"products.alias as nom",
				"products.items_per_display as itemsDisp",
				"products.display_per_box as dispBox",
				"products.concept as con")
			->leftJoin("orders","orders.id","=","order_details.idOrder")
			->leftJoin("products","products.sku","=","order_details.itemcode")
			->where("idOrder","=",$id);
		Log::info("EloquentOrderDetail - getByIdOrd - SQL: ".$orderList->toSql());
		return $orderList->get();
    }

    public function getDetExt($it,$qua,$pack,$idOrd){

    	return $this->model->where("itemcode","=",$it)
    					   ->where("quantity","=",$qua)
    					   ->where("quantitypack","=",$pack)
    					   ->where(self::SQL_ORDEN_ID,"=",$idOrd);

    }

    /**
	 * Create a new OrderDetail.
	 *
	 * @param array $attributes
	 *
	 * @return App\OrderDetail
	 */
	public function create(array $attributes)
	{
		return $this->model->create($attributes);
    }

    /**
	 * Update a OrderDetail.
	 *
	 * @param integer $id
	 * @param array $attributes
	 *
	 * @return App\OrderDetail
	 */
	public function update($id, array $attributes)
	{
		return $this->model->find($id)->update($attributes);
	}

	/**
	 * Delete a OrderDetail.
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