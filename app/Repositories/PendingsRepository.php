<?php

namespace App\Repositories;

interface PendingsRepository
{

	const SQL_ID          = "id";
	const SQL_ID_ORDER    = "order_id";
	const SQL_ID_USER     = "user_id";
	const SQL_ID_CLIENT   = "client_id";
	const SQL_ID_CAT      = "cat_id";
	const SQL_STA_CLI      = "client_status";
	const SQL_STA_CAT      = "cat_status";

	const DELETED = 0;
	const ACTIVE  = 1;
	
	function getAll();

	function getUserPed($id);

	function getById($id);

	function getByIdPed($id);

	function create(array $attributes);

	function update($id, array $attributes);

	function delete($id);
}