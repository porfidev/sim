<?php

namespace App\Repositories;

interface PallBoxRepository
{
	const SQL_ID          = "id";
	const SQL_BOX_ID	  = "box_id";
	const SQL_PALLET_ID	  = "pallet_id";

	function getAll();

	function getById($id);

	function getByPallBox($idPall,$idBox);

	function getAllTar($tar);

	function create(array $attributes);

	function update($id, array $attributes);

	function delete($id);
}