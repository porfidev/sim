<?php

namespace App\Repositories;

interface OrderDetailRepository
{
	const SQL_ID    = "id";	
	const SQL_CODIGOP  = "itemcode";
	const SQL_CANTIDAD  = "quantity";
	const SQL_CANTIDADP  = "quantitypack";
	const SQL_ORDEN_ID  = "idOrder";

	const DELETED = 0;
	const ACTIVE  = 1;

	function getAll();

	function getById($id);

	function create(array $attributes);

	function update($id, array $attributes);

	function delete($id);
}