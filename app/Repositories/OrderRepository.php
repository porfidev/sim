<?php

namespace App\Repositories;

interface OrderRepository
{
	const SQL_ID    = "id";
	const SQL_CODIGO_ORDEN  = "codeOrder";
	const SQL_INICIO  = "start";
	const SQL_FIN  = "end";
	const SQL_CODIGO  = "code";
	const SQL_ESTATUS  = "status";
	const SQL_DIST_ID  = "dist_id";

	const DELETED = 0;
	const ACTIVE  = 1;

	function getAll();

	function getById($id);

	function getByCode($code);

	function create(array $attributes);

	function update($id, array $attributes);

	function delete($id);
}