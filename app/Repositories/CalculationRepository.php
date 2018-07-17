<?php

namespace App\Repositories;

interface CalculationRepository
{
	const SQL_P    = "P";	
	const SQL_V  = "V";
	const SQL_D  = "D";
	const SQL_DIST  = "dist_id";
	const SQL_ORDID  = "order_id";
	const SQL_FP  = "FP";
	const SQL_PRIORITY  = "priority";
	
	function getAll();

	function getAllEsp();

	function getAllOrd();

	function getById($id);

	function getIdCalc($idOrd);

	function getCalcDist($distId);

	function getCalc($idOrd);

	function create(array $attributes);

	function update($id, array $attributes);

	function delete($id);

	/*public static function validity(){


	}*/
}