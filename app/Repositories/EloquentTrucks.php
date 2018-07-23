<?php

namespace App\Repositories;

use App\Trucks;

use Illuminate\Support\Facades\Log;

class EloquentTrucks implements TrucksRepository
{
    /**
	 * @var $model
	 */
	private $model;

    /**
	 * EloquentRol constructor.
	 *
	 * @param App\Menu $model
	 */
	public function __construct(Trucks $model)
	{
		$this->model   = $model;
    }

    /**
	 * Get all Catalogos.
	 *
	 * @return Illuminate\Database\Eloquent\Collection
	 */
    function getAll(array $search = null){

    	$list = $this->model->select("trucks.sub-brand as subBrand","trucks.*")->orderBy('id', 'desc');
    	    	
        return $list->get();
    }

    /**
	 * Get menu item by id.
	 *
	 * @param integer $id
	 *
	 * @return App\Menu
	 */
	public function getById($id)
	{
		return $this->model->find($id);
    }

    /**
	 * Create a menu item.
	 *
	 * @param array $attributes
	 *
	 * @return App\Menu
	 */
	public function create(array $attributes)
	{
		return $this->model->create($attributes);
    }

    /**
	 * Update a menu item.
	 *
	 * @param integer $id
	 * @param array $attributes
	 *
	 * @return App\Menu
	 */
	public function update($id, array $attributes)
	{
		return $this->model->find($id)->update($attributes);
	}

	/**
	 * Delete a menu item.
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