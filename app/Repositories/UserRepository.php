<?php

namespace App\Repositories;

interface UserRepository
{
	function getList($itemsPerPage);

	function getById($id);

	function create(array $attributes);

	function update($id, array $attributes);

	function delete($id);
}