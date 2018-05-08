<?php

namespace App\Repositories;

interface MenuRepository
{
	const SQL_ID     = "id";
	const SQL_PARENT = "parent";
    const SQL_LABEL  = "label";
    const SQL_URL    = "url";
    const SQL_USER   = "user_id";

    function getParents($rol = null);

    function getChilds($parent, $rol);

    function getMenu($rol);

    public function getList($itemsPerPage, array $search = null);

	function getById($id);

	function create(array $attributes);

	function update($id, array $attributes);

	function delete($id);
}