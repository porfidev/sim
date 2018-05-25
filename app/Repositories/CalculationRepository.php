<?php

namespace App\Repositories;

interface CalculationRepository
{
	const SQL_P    = "P";	
	const SQL_V  = "V";
	const SQL_D  = "D";
	const SQL_DIST  = "Dist";
	
	function getAll();

	function getById($id);

	function create(array $attributes);

	function update($id, array $attributes);

	function delete($id);
}