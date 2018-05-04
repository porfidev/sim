<?php

namespace App\Repositories;

interface UserRepository
{
	const SQL_ID     = "id";
	const SQL_NAME   = "name";
	const SQL_EMAIL  = "email";
	const SQL_STATUS = "status";

	function getList($itemsPerPage, array $search = null);

	function getById($id);

	function create(array $attributes);

	function update($id, array $attributes);

	function delete($id);
}