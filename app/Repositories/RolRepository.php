<?php

namespace App\Repositories;

interface RolRepository
{
	const SQL_ID    = "id";
	const SQL_NAME  = "rol";
	const SQL_DESC  = "description";

	function getAll();

	function getById($id);

	function create(array $attributes);

	function update($id, array $attributes);

	function delete($id);
}