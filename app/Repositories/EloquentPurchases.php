<?php

namespace App\Repositories;

use App\Purchase;

use Illuminate\Support\Facades\Log;

class EloquentPurchases implements PurchasesRepository
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
	public function __construct(Purchase $model)
	{
		$this->model = $model;
    }

	public function getList($itemsPerPage, array $search = null)
	{
		$list = $this->model->orderBy('id', 'desc');
		if(!empty($search)) {
			if(array_key_exists(self::SQL_ID, $search)
				&& !empty($search[self::SQL_ID]) ) {
				$list->where(self::SQL_ID, "like", "%".$search[self::SQL_ID]."%");
			}
			if(array_key_exists(self::SQL_DOCENTRY, $search)
				&& $search[self::SQL_DOCENTRY] != "NA") {
				$list->where(self::SQL_DOCENTRY, "like", "%".$search[self::SQL_DOCENTRY]."%");
			}
			if(array_key_exists(self::SQL_DOCNUM, $search)
				&& $search[self::SQL_DOCNUM] != "NA") {
				$list->where(self::SQL_DOCNUM, "like", "%".$search[self::SQL_DOCNUM]."%");
			}
			if(array_key_exists(self::SQL_CARDCODE, $search)
				&& $search[self::SQL_CARDCODE] != "NA") {
				$list->where(self::SQL_CARDCODE, "like", "%".$search[self::SQL_CARDCODE]."%");
			}
			if(array_key_exists(self::SQL_CARDNAME, $search)
				&& $search[self::SQL_CARDNAME] != "NA") {
				$list->where(self::SQL_CARDNAME, "like", "%".$search[self::SQL_CARDNAME]."%");
			}
			if(array_key_exists(self::SQL_DOCDUEDATE, $search)
				&& $search[self::DocDueDate] != "NA") {
				$list->where(self::DocDueDate, "like", "%".$search[self::DocDueDate]."%");
			}
			if(array_key_exists(self::SQL_ARRIVAL, $search)
				&& $search[self::arrival] != "NA") {
				$list->where(self::arrival, "like", "%".$search[self::arrival]."%");
			}
			if(array_key_exists(self::SQL_STATUS, $search)
				&& $search[self::status] != "NA") {
				$list->where(self::status, "like", "%".$search[self::status]."%");
			}
		}
		Log::debug("EloquentPurchases - getList - SQL: ".$list->toSql());
		return $list->paginate($itemsPerPage);
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

    public function getByCode($CardCode){

    	return $this->model->where("CardCode","=",$CardCode)->get()->first();
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