<?php

namespace App\Repositories;

use App\Purchase;

use Illuminate\Support\Facades\Log;

class EloquentPurchase implements PurchaseRepository
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
				&& $search[self::SQL_DOCDUEDATE] != "NA") {
				$list->where(self::SQL_DOCDUEDATE, "like", "%".$search[self::SQL_DOCDUEDATE]."%");
			}
			if(array_key_exists(self::SQL_ARRIVAL, $search)
				&& $search[self::SQL_ARRIVAL] != "NA") {
				$list->where(self::SQL_ARRIVAL, "like", "%".$search[self::SQL_ARRIVAL]."%");
			}
			if(array_key_exists(self::SQL_STATUS, $search)
				&& $search[self::SQL_STATUS] != "NA") {
				$list->where(self::SQL_STATUS, "like", "%".$search[self::SQL_STATUS]."%");
			}
		}
		Log::debug("EloquentPurchases - getList - SQL: ".$list->toSql());
		return $list->paginate($itemsPerPage);
	}


    function getAll(array $search = null){

    	$list = $this->model->orderBy('id', 'desc');
    	    	
        return $list->paginate(10);
    }


	public function getById($id)
	{
		return $this->model->find($id);
    }

    public function getByCode($CardCode){

    	return $this->model->where("CardCode","=",$CardCode)->get()->first();
    }


	public function create(array $attributes)
	{
		return $this->model->create($attributes);
    }


	public function update($id, array $attributes)
	{
		return $this->model->find($id)->update($attributes);
	}


	public function delete($id)
	{
		return $this->model->find($id)->delete();
	}
}