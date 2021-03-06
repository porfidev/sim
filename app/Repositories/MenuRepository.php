<?php

namespace App\Repositories;

interface MenuRepository
{
	const SQL_ID     = "id";
    const SQL_PARENT = "parent";
    const SQL_ORDER  = "sequence";
    const SQL_LABEL  = "label";
    const SQL_URL    = "url";
    const SQL_VISIBLE= "visible";
    const SQL_USER   = "user_id";

    const SQL_PROFILE_ROL  = "rol_id";
    const SQL_PROFILE_MENU = "menu_item_id";
    const SQL_PROFILE_USER = "user_id";

    const VISIBLE_SI = 1;
    const VISIBLE_NO = 0;

    function findProfile(array $attributes);

    function addProfile(array $attributes);

    function deleteProfile($profile_id);

    function getProfileList($id);

    function getParents($rol = null, $visible = 1);

    function getChilds($parent, $rol = null, $visible = 1);

    function findMenuByUrl($url);

    function getMenu($rol);

    function getList($itemsPerPage, array $search = null);

	function getById($id);

	function create(array $attributes);

	function update($id, array $attributes);

	function delete($id);
}