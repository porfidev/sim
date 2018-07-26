<?php

namespace App\Repositories;

use DB;

use App\Trip;
use App\TripPall;
use App\TripOrd;

use Illuminate\Support\Facades\Log;

class EloquentTrip implements TripRepository
{
    /**
	 * @var $model
	 */
	private $model;

	/**
	 * @var $trace
	 */
	private $tripPall;

	/**
	 * @var $trace
	 */
	private $tripOrd;

    /**
	 * EloquentRol constructor.
	 *
	 * @param App\Catalogo $model
	 */
	public function __construct(
		Trip $model,
		TripPall $tri,
		TripOrd $triO)
	{
		$this->model  = $model;
		$this->tripPall  = $tri;
		$this->tripOrd  = $triO;
    }

	
    /**
	 * Get the order´s list fiter by the search parameters
	 *
	 * @param array $search
	 *
	 * @return Illuminate\Database\Eloquent\Collection
	 */
    public function getAllTrips() {
		
		$list = $this->model->with('truck')
			->orderBy('updated_at', 'desc');
		
		

        return $list->paginate(10);
    }

    public function getAllTripPalls() {
		
		$list = $this->model->with('trip','pallet')
			->orderBy('updated_at', 'desc');
		
		

        return $list->get();
    }

    public function getAllTripOrd($id) {
		
		$list = $this->tripOrd->with('trip','pallet')
					->where(self::SQL_TRIP_ID,"=",$id)
			->orderBy('updated_at', 'desc');
		
		

        return $list->get();
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

    public function getByIdTP($id)
	{
		return $this->tripPall->find($id);
    }

    public function getByIdTO($id)
	{
		return $this->tripOrd->find($id);
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

    public function createTP(array $attributes)
	{
		return $this->tripPall->create($attributes);
    }

    public function createTO(array $attributes)
	{
		return $this->tripOrd->create($attributes);
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

	public function updateTP($id, array $attributes)
	{
		return $this->tripPall->find($id)->update($attributes);
	}

	public function updateTO($id, array $attributes)
	{
		return $this->tripOrd->find($id)->update($attributes);
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

	public function deleteTP($id)
	{
		return $this->tripPall->find($id)->delete();
	}

	public function deleteTO($id)
	{
		return $this->tripOrd->find($id)->delete();
	}

}