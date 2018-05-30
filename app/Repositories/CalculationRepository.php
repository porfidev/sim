<?php

namespace App\Repositories;

interface CalculationRepository
{
	const SQL_P    = "P";	
	const SQL_V  = "V";
	const SQL_D  = "D";
	const SQL_DIST  = "Dist";
	const SQL_ORDID  = "ordersId";
	const SQL_FP  = "FP";
	
	function getAll();

	function getAllEsp();

	function getById($id);

	function getIdCalc($idOrd);

	function create(array $attributes);

	function update($id, array $attributes);

	function delete($id);
}