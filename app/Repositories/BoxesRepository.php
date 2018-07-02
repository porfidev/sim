<?php

namespace App\Repositories;

interface BoxesRepository
{
	const SQL_ID    = "id";
	const SQL_DESCRIPCION  = "description";
	const SQL_ANCHURA  = "width";
	const SQL_ALTURA  = "height";
	const SQL_PROFUNDIDAD  = "depth";

	const DELETED = 0;
	const ACTIVE  = 1;

	function getAll();

	function getById($id);

	function create(array $attributes);

	function update($id, array $attributes);

	function delete($id);
}