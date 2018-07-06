<?php

namespace App\Repositories;

interface AssignmentRepository
{
	const SQL_ORDID        = "order_id";
	const SQL_ORDER_DETAIL = "order_detail_id";
	const SQL_ORDER_DESIGN = "order_design_id";
	const SQL_USRID        = "user_id";
	const SQL_STATUS       = "status";

	const STATUS_CREATED = 0;
	const STATUS_FINISH  = 1;

	function getAll();

	function getById($id);

	function getListAsi($idOrd);

	function getOPWorks($user_id, $itemsPerPage);

	function getMaxMin($user_id, $order_id);

	function getPedUser($idUsr);

	function search($idOrd,$idUsr);

	function create(array $attributes);

	function update($id, array $attributes);

	function delete($id);
}