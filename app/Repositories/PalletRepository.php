<?php

namespace App\Repositories;

interface PalletRepository
{
	const SQL_ID        = "id";
	const SQL_CODE	    = "code";
	const SQL_ORDER_ID  = "order_id";

	function getAll();

	function getById($id);

	function create(array $attributes);

	function idInc();

	function update($id, array $attributes);

	function delete($id);
}