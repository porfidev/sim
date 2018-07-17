<?php

namespace App\Repositories;

use DB;

use App\Distribution;

use Illuminate\Support\Facades\Log;

class EloquentDistribution implements DistributionRepository
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
	public function __construct(Distribution $model)
	{
		$this->model = $model;
    }

	/**
	 * Función que nos regresa el listado de productos de un pedido
	 * para una tienda en particular
	 */
	public function getItemsByShop($order_id, $shop)
	{
		return $this->model->where(self::SQL_SHOP, '=', $shop)
			->where(self::SQL_ID_ORDER, '=', $order_id)
			->get();
	}

	/**
	 * Obtenemos la lista de tiendas en las que se distribuyo el pedido
	 *
	 * @param integer $order_id
	 * @return Illuminate\Database\Eloquent\Collection
	 */
	public function getDistinctShops($order_id)
	{
		return $this->model->select(
				DB::raw('distinct('.self::SQL_SHOP.')')
			)
			->where(self::SQL_ID_ORDER, '=', $order_id)
			->orderBy(self::SQL_SHOP)
			->get();
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