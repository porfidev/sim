<?php

namespace App\Repositories;

use App\HistorySupply;

use Illuminate\Support\Facades\Log;

class EloquentHistorySupply implements HistorySupplyRepository
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
	public function __construct(HistorySupply $model)
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

    
	public function getById($id){

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