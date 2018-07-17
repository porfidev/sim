<?php

namespace App\Repositories;

use DB;

use App\ArrivalItem;

use Illuminate\Support\Facades\Log;

class EloquentArrivalItem implements ArrivalItemRepository
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
	public function __construct(ArrivalItem $model)
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
			if(array_key_exists(self::PURCHASEID, $search)
				&& $search[self::PURCHASEID] != "NA") {
				$list->where(self::PURCHASEID, "like", "%".$search[self::PURCHASEID]."%");
			}
			if(array_key_exists(self::SQL_ICODE, $search)
				&& $search[self::SQL_ICODE] != "NA") {
				$list->where(self::SQL_ICODE, "like", "%".$search[self::SQL_ICODE]."%");
            }
            
            if(array_key_exists(self::SQL_PEDIM, $search)
				&& $search[self::SQL_PEDIM] != "NA") {
				$list->where(self::SQL_PEDIM, "like", "%".$search[self::SQL_PEDIM]."%");
            }
			if(array_key_exists(self::SQL_PRODUCTID, $search)
				&& $search[self::SQL_PRODUCTID] != "NA") {
				$list->where(self::SQL_PRODUCTID, "like", "%".$search[self::SQL_PRODUCTID]."%");
			}
			if(array_key_exists(self::SQL_QUANT, $search)
				&& $search[self::SQL_QUANT] != "NA") {
				$list->where(self::SQL_QUANT, "like", "%".$search[self::SQL_QUANT]."%");
            }

            if(array_key_exists(self::CANTIDAD_REC, $search)
				&& $search[self::CANTIDAD_REC] != "NA") {
				$list->where(self::CANTIDAD_REC, "like", "%".$search[self::CANTIDAD_REC]."%");
			}
            
			if(array_key_exists(self::SQL_DISTNUMBER, $search)
				&& $search[self::SQL_DISTNUMBER] != "NA") {
				$list->where(self::SQL_DISTNUMBER, "like", "%".$search[self::SQL_DISTNUMBER]."%");
			}
			if(array_key_exists(self::SQL_CADUCIDAD, $search)
				&& $search[self::SQL_CADUCIDAD] != "NA") {
				$list->where(self::SQL_CADUCIDAD, "like", "%".$search[self::SQL_CADUCIDAD]."%");
            }
            if(array_key_exists(self::SQL_CADUCIDADM, $search)
				&& $search[self::SQL_CADUCIDADM] != "NA") {
				$list->where(self::SQL_CADUCIDADM, "like", "%".$search[self::SQL_CADUCIDADM]."%");
			}
		}
		Log::debug("EloquentArrivalItems - getList - SQL: ".$list->toSql());
		return $list->paginate($itemsPerPage);
	}


	public function getById($id)
	{
		return $this->model->find($id);
    }

    public function getByItemCodeLote($itemCode, $distNumber){

        return $this->model->where("ItemCode","=",$itemCode)
        ->Where("DistNumber","=",$distNumber)
		->get()->first();
		
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