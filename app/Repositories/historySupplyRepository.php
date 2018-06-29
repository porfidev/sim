<?php

namespace App\Repositories;

interface HistorySupplyRepository
{
	const SQL_USRID     = "user_id";
	const SQL_ORDID  	= "order_id";
	const SQL_DETID     = "detail_id";
	const SQL_PROID  	= "product_id";
	const SQL_QUANTITY  = "quantity";
	const SQL_DATIME  	= "hist_date_time";

	function getAll();

	function getById($id);

	function create(array $attributes);

	function update($id, array $attributes);

	function delete($id);
}