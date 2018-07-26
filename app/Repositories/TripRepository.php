<?php

namespace App\Repositories;

interface TripRepository
{

	//trips
	const SQL_ID_TRIP      = "id";
	const SQL_TRUCK_ID     = "truck_id";
	const SQL_FINISH       = "finish_date";
	const SQL_ARRIVE       = "arrive_date";

	//trip_pallets
	const SQL_ID_TRIPPALL  = "id";
	const SQL_TRIP_ID      = "trip_id";
	const SQL_PALLET_ID    = "pallet_id";
	const SQL_BOX_ID    = "box_id";

	//trip_pallets
	//const SQL_ID_TRIPPALL  = "id";
	const SQL_ORDER_ID    = "order_id";

	const DELETED = 0;
	const ACTIVE  = 1;

	function getAllTrips();

	function getAllTripPalls();

	function getById($id);

	function getByIdTP($id);

	function create(array $attributes);

	function createTP(array $attributes);

	function update($id, array $attributes);

	function updateTP($id, array $attributes);

	function delete($id);

	function deleteTP($id);
}