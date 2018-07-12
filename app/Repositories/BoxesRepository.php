<?php

namespace App\Repositories;

interface BoxesRepository
{

	const BOX_CREATED = 0;
	const BOX_CONFIRM = 1;
	const BOX_ASSIGN  = 2;
	const BOX_VALID   = 3;

	const ORIGIN_BOX = "Caja Origen";

	const SQL_ID           = "id";
	const SQL_DESCRIPCION  = "description";
	const SQL_ANCHURA      = "width";
	const SQL_ALTURA       = "height";
	const SQL_PROFUNDIDAD  = "depth";

	const SQL_BOX_ID_TYPE   = "box_type_id";
	const SQL_BOX_ID_STATUS = "status";
	const SQL_BOX_ID_LABEL  = "label";

	const DELETED = 0;
	const ACTIVE  = 1;

	function getBiggestBox();

	function getBoxByLabel($label);

	function findBoxId($id);

	function createBoxId(array $attributes);

	function updateBoxId($id, array $attributes);

	function searchByName($name);

	function getAll();

	function getById($id);

	function create(array $attributes);

	function update($id, array $attributes);

	function delete($id);
}