<?php

namespace App\Repositories;

interface UserRepository
{
	const SQL_ID      = "id";
	const SQL_NAME    = "name";
	const SQL_EMAIL   = "email";
	const SQL_PASS    = "password";
	const SQL_STATUS  = "status";
	const SQL_ROL     = "rol_id";
	const SQL_BOSS    = "boss_id";

	const SQL_SESSION_USER_ID = "user_id";
	const SQL_SESSION_IP      = "ip";

	const DELETED = 0;
	const ACTIVE  = 1;

	function getSession($user_id, $old=false);

	function createSession($user_id, $ip);

	function getList($itemsPerPage, array $search = null);

	function getListBus($nombre);

	function getListBusUsu($nombre,$idJefe);

	function getById($id);

	function create(array $attributes);

	function update($id, array $attributes);

	function delete($id);
}