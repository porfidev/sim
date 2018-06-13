<?php

namespace App\Repositories;

interface AssignmentRepository
{
	const SQL_ORDID    = "order_id";	
	const SQL_USRID  = "user_id";

	function getAll();

	function getById($id);

	function getListAsi($idOrd);

	function getPedUser($idUsr);

	function search($idOrd,$idUsr);

	function create(array $attributes);

	function update($id, array $attributes);

	function delete($id);
}