<?php

namespace App\Repositories;

interface OrderDetailRepository
{
	const SQL_ID          = "id";
	const SQL_CODIGOP     = "itemcode";
	const SQL_CANTIDAD    = "quantity";
	const SQL_CANTIDADP   = "quantitypack";
	const SQL_ORDEN_ID    = "idOrder";
	const SQL_PRES_REQ    = "pres_req";
	const SQL_CANTIDAD_U  = "quantity_user";
	const SQL_CANTIDAD_B  = "quantity_boss";
	const SQL_CANTIDAD_OPB= "quantity_op_boss";

	const DELETED = 0;
	const ACTIVE  = 1;

	function getAll();

	function getById($id);

	function getByIdOrd($id);

	function getDetExt($it,$qua,$pack,$idOrd);

	function create(array $attributes);

	function update($id, array $attributes);

	function delete($id);
}