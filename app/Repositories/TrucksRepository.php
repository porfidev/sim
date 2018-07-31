<?php

namespace App\Repositories;

interface TrucksRepository
{

	const SQL_ID           = "id";
	const SQL_MARCA  	   = "brand";
	const SQL_SUBMARCA     = "sub-brand";
	const SQL_MODELO       = "model";
	const SQL_PLACAS  	   = "plates";
	const SQL_CAPACIDAD    = "capacity";
	const SQL_OPERADOR     = "operator";
	const SQL_SERIE  	   = "truck_series";
	const SQL_USER  	   = "user_id";

	function getAll();

	function getById($id);

	function create(array $attributes);

	function update($id, array $attributes);

	function delete($id);
}