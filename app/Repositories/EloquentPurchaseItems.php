<?php

namespace App\Repositories;

use DB;

use App\Purchaseitems;

use Illuminate\Support\Facades\Log;

class EloquentPurchaseItems implements PurchaseItemsRepository
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
	public function __construct(PurchaseItems $model)
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
	 * @return App\Task
	 */
	public function getById($id)
	{
		return $this->model->find($id);
    }

    public function getByCode($ItemCode){

    	return $this->model->where("ItemCode","=",$ItemCode)->get()->first();
	}
	
	public function getByCodeLote($CodeBars, $DistNumber){

		return $this->model->where("CodeBars","=",$CodeBars)
        ->Where("DistNumber","=",$DistNumber)
        ->get()->first();
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
	

	function updateStatus($purchase_id, $ItemCode){
		
		return $affected = 	DB::table('purchase_items')
		->where('purchase_id',$purchase_id)
		->Where("ItemCode","=",$ItemCode)
		->update(['status'=>'1']);
	
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