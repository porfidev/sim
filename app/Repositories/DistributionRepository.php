<?php

namespace App\Repositories;

interface DistributionRepository
{
	const SQL_ID        = "id";
	const SQL_ID_ORDER	= "order_id";
	const SQL_SKU 		= "sku";
	const SQL_QUANTITY  = "quantity";
	const SQL_SHOP      = "shop";
	const SQL_ID_DETAIL = "order_detail_id";

	function getItemsByShop($order_id, $shop);

	function getDistinctShops($order_id);

	function getAll();

	function getById($id);

	function create(array $attributes);

	function update($id, array $attributes);

	function delete($id);
}