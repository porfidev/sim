<?php

namespace App\Repositories;

use DB;

use App\Product;

use Illuminate\Support\Facades\Log;

class EloquentProduct implements ProductRepository
{
    /**
	 * @var $model
	 */
    private $model;

    /**
	 * EloquentRol constructor.
	 *
	 * @param App\Product $model
	 */
	public function __construct(Product $model)
	{
		$this->model = $model;
    }

    /**
	 * Get the products list.
	 *
     * @param integer $itemsPerPage
     * @param array   $search
     *
	 * @return Illuminate\Database\Eloquent\Collection
	 */
    public function getList($itemsPerPage, array $search = null)
    {
		$list = $this->model->orderBy('sku');
        if(!empty($search)) {
			if(array_key_exists(self::SQL_SKU, $search)
				&& !empty($search[self::SQL_SKU]) ) {
				$list->where(self::SQL_SKU, "like", "%".$search[self::SQL_SKU]."%");
            }
            if(array_key_exists(self::SQL_CONCEPT, $search)
				&& !empty($search[self::SQL_CONCEPT]) ) {
				$list->where(self::SQL_CONCEPT, "like", "%".$search[self::SQL_CONCEPT]."%");
            }
            if(array_key_exists(self::SQL_ALIAS, $search)
				&& !empty($search[self::SQL_ALIAS]) ) {
				$list->where(self::SQL_ALIAS, "like", "%".$search[self::SQL_ALIAS]."%");
            }
		}
		Log::debug("EloquentProduct - getList - SQL: ".$list->toSql());
		return $list->paginate($itemsPerPage);
    }

    /**
	 * Get Product by id.
	 *
	 * @param integer $id
	 *
	 * @return App\Product
	 */
	public function getById($id)
	{
		return $this->model->find($id);
	}

	public function getBySku($sku)
	{
		return $this->model->where("sku","=",$sku)->get()->first();
	}

    /**
	 * Create a Product.
	 *
	 * @param array $attributes
	 *
	 * @return App\Product
	 */
	public function create(array $attributes)
	{
		return $this->model->create($attributes);
    }

    /**
	 * Update a Product.
	 *
	 * @param integer $id
	 * @param array $attributes
	 *
	 * @return App\Product
	 */
	public function update($id, array $attributes)
	{
		return $this->model->find($id)->update($attributes);
	}

	/**
	 * Delete a Product.
	 *
	 * @param integer $id
	 *
	 * @return boolean
	 */
	public function delete($id, $user_id)
	{
		$this->model->find($id)->update(array( self::SQL_USER => $user_id ));
		return $this->model->find($id)->delete();
	}
}