<?php

namespace App\Repositories;

interface ClienteRepository
{
	const SQL_ID    = "id";
	const SQL_NOMBRE  = "name";
	const SQL_CORREO  = "email";
	const SQL_TELEFONO  = "telephone";
	const SQL_RFC  = "rfc";
	const SQL_CP  = "cp";
	const SQL_CIUDAD  = "city";
	const SQL_DIRECCION  = "address";
	const SQL_ESTATUS  = "status";
	const SQL_BRANCH_ID  = "branch_id";
	const SQL_CODE  = "code";
	const SQL_P  = "P";
	const SQL_SHOPS  = "shops";
	const SQL_SKU  = "sku";
	const SQL_PACK  = "package";
	const SQL_D2  = "D2";
	const SQL_TE  = "TE";
	const SQL_CE  = "CE";
	const SQL_TP  = "TP";
	const SQL_AVERAGE  = "average";
	const SQL_D  = "D";

	const DELETED = 0;
	const ACTIVE  = 1;

	function getAll();

	function getById($id);

	function getByCodigo($codigo);

	function create(array $attributes);

	function update($id, array $attributes);

	function delete($id);
}