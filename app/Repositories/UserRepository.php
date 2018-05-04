<?php

namespace App\Repositories;

interface UserRepository
{
	function getList($itemsPerPage, array $search = null);

	function getById($id);

	function create(array $attributes);

	function update($id, array $attributes);

	function delete($id);
}