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

	const DELETED = 0;
	const ACTIVE  = 1;

	function getAll();

	function getById($id);

	function create(array $attributes);

	function update($id, array $attributes);

	function delete($id);
}