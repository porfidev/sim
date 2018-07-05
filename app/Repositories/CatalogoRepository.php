<?php

namespace App\Repositories;

interface CatalogoRepository
{
	const TE_GROUP = "Tipo Empaque";

	const SQL_ID        = "id";
	const SQL_ETIQUETA  = "label";
	const SQL_VALOR     = "value";
	const SQL_GRUPO_ID  = "group_id";

	const DELETED = 0;
	const ACTIVE  = 1;

	function getAll();

	function getGroup($group);

	function getGroupById($group_id);

	function searchGroupItem($group, $text);

	function getById($id);

	function getByLabel($label);

	function getByLabelFull($label);

	function getPadres();

	function create(array $attributes);

	function update($id, array $attributes);

	function delete($id);
}