<?php

namespace App\Repositories;

use App\Menu;
use App\Profile;

use Illuminate\Support\Facades\Log;

class EloquentMenu implements MenuRepository
{
    /**
	 * @var $model
	 */
	private $model;

	/**
	 * @var $model
	 */
	private $profile;

    /**
	 * EloquentRol constructor.
	 *
	 * @param App\Menu $model
	 */
	public function __construct(Menu $model, Profile $profile)
	{
		$this->model   = $model;
		$this->profile = $profile;
    }

	/**
	 * Add rol in the profile list
	 *
	 * @param array $attributes
	 *
	 * @return App\Profile
	 */
	public function addProfile(array $attributes)
	{
		return $this->profile->create($attributes);
	}

	/**
	 * Delete a rol in the profile list
	 *
	 * @param integer $profile_id
	 *
	 * @return boolean
	 */
	public function deleteProfile($profile_id)
	{
		return $this->profile->find($profile_id)->delete();
	}

	/**
	 * Get profile list of menu item.
	 *
	 * @return Illuminate\Database\Eloquent\Collection
	 */
	public function getProfileList($id)
	{
		return $this->model->find($id)
			->getRols()->select('rols.id', 'rols.description', 'profiles.id as profile_id')->get();
	}

    /**
	 * Get parent menu items.
	 *
	 * @return Illuminate\Database\Eloquent\Collection
	 */
    public function getParents($rol = null)
    {
		$parentsList = array();
		if( empty($rol) ) {
			$parentsList = $this->model->whereNull(self::SQL_PARENT)->get();
		} else {
			Log::info("EloquentMenu - getParents: ".json_encode($rol));
			$parentsList = $rol->getMenuItems()->whereNull(self::SQL_PARENT)->get();
		}
		return $parentsList;
    }

    /**
	 * Get childs menu items.
	 *
	 * @return Illuminate\Database\Eloquent\Collection
	 */
    public function getChilds($parent, $rol = null)
    {
		$childsList = array();
		if( empty($rol) ) {
			$childsList = $this->model->where(self::SQL_PARENT, '=', $parent)->get();
		} else {
			$childsList = $rol->getMenuItems()->where(self::SQL_PARENT, '=', $parent)->get();
		}
		return $childsList;
	}

	/**
	 * Get menu items to show.
	 *
	 * @return Array
	 */
	public function getMenu($rol) {
		$menu = array();
		$parents = $this->getParents($rol);
		foreach ($parents as $parentItem) {
			Log::debug("--------------------------------------------------------------------------");
			Log::debug("EloquentMenu - getMenu - parent: ".json_encode($parentItem));
			$temp = array(
				"parent" => $parentItem
			);
			$childs = $this->getChilds($parentItem->id, $rol);
			Log::debug("EloquentMenu - getMenu - childs: ".json_encode($childs));
			$temp["childs"] = $childs;
			$menu[] = $temp;
		}
		return $menu;
	}

    /**
	 * Get all menu items.
	 *
	 * @return Illuminate\Database\Eloquent\Collection
	 */
    public function getList($itemsPerPage, array $search = null)
    {
        $list = $this->model->with('myParent')
            ->orderBy('id', 'desc');
        if(!empty($search)) {
			if(array_key_exists(self::SQL_ID, $search)
				&& !empty($search[self::SQL_ID]) ) {
				$list->where(self::SQL_ID, "like", "%".$search[self::SQL_ID]."%");
            }
            if(array_key_exists(self::SQL_PARENT, $search)
				&& !empty($search[self::SQL_PARENT]) ) {
				$list->where(self::SQL_PARENT, "=", $search[self::SQL_PARENT]);
            }
            if(array_key_exists(self::SQL_LABEL, $search)
				&& !empty($search[self::SQL_LABEL]) ) {
                $list->where(self::SQL_LABEL, "like", "%".$search[self::SQL_LABEL]."%");
			}
		}
		Log::debug("EloquentMenu - getList - SQL: ".$list->toSql());
		return $list->paginate($itemsPerPage);
    }

    /**
	 * Get menu item by id.
	 *
	 * @param integer $id
	 *
	 * @return App\Menu
	 */
	public function getById($id)
	{
		return $this->model->find($id);
    }

    /**
	 * Create a menu item.
	 *
	 * @param array $attributes
	 *
	 * @return App\Menu
	 */
	public function create(array $attributes)
	{
		return $this->model->create($attributes);
    }

    /**
	 * Update a menu item.
	 *
	 * @param integer $id
	 * @param array $attributes
	 *
	 * @return App\Menu
	 */
	public function update($id, array $attributes)
	{
		return $this->model->find($id)->update($attributes);
	}

	/**
	 * Delete a menu item.
	 *
	 * @param integer $id
	 *
	 * @return boolean
	 */
	public function delete($id)
	{
		return $this->model->find($id)->delete();
	}
}