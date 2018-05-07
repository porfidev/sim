<?php

namespace App\Repositories;

use App\User;

use Illuminate\Support\Facades\Log;

class EloquentUser implements UserRepository
{
	/**
	 * @var $model
	 */
    private $model;

    /**
	 * EloquentUser constructor.
	 *
	 * @param App\User $model
	 */
	public function __construct(User $model)
	{
		$this->model = $model;
    }

    /**
	 * Get all users.
	 *
	 * @return Illuminate\Database\Eloquent\Collection
	 */
	public function getList($itemsPerPage, array $search = null)
	{
		$list = $this->model->with('rol')
			->orderBy('id', 'desc');
		if(!empty($search)) {
			if(array_key_exists(self::SQL_ID, $search)
				&& !empty($search[self::SQL_ID]) ) {
				$list->where(self::SQL_ID, "like", "%".$search[self::SQL_ID]."%");
			}
			if(array_key_exists(self::SQL_NAME, $search)
				&& $search[self::SQL_NAME] != "NA") {
				$list->where(self::SQL_NAME, "like", "%".$search[self::SQL_NAME]."%");
			}
			if(array_key_exists(self::SQL_EMAIL, $search)
				&& $search[self::SQL_EMAIL] != "NA") {
				$list->where(self::SQL_EMAIL, "like", "%".$search[self::SQL_EMAIL]."%");
			}
			if(array_key_exists(self::SQL_ROL, $search)
				&& !empty($search[self::SQL_ROL]) ) {
				$list->where(self::SQL_ROL, "=", $search[self::SQL_ROL]);
			}
			if(array_key_exists(self::SQL_STATUS, $search)) {
				$list->where(self::SQL_STATUS, "=", $search[self::SQL_STATUS]);
			}
		}
		Log::debug("EloquentUser - getList - SQL: ".$list->toSql());
		return $list->paginate($itemsPerPage);
	}

	/**
	 * Get User by id.
	 *
	 * @param integer $id
	 *
	 * @return App\User
	 */
	public function getById($id)
	{
		return $this->model->find($id);
	}

	/**
	 * Create a new User.
	 *
	 * @param array $attributes
	 *
	 * @return App\User
	 */
	public function create(array $attributes)
	{

		return $this->model->create($attributes);
	}

	/**
	 * Update a User.
	 *
	 * @param integer $id
	 * @param array $attributes
	 *
	 * @return App\User
	 */
	public function update($id, array $attributes)
	{
		Log::debug("EloquentUser - update - id: ".$id);
		Log::debug("EloquentUser - update - attributes: ".json_encode($attributes));
		$this->model = $this->model->find($id);
		return $this->model->update($attributes);
	}

	/**
	 * Delete a User.
	 *
	 * @param integer $id
	 *
	 * @return boolean
	 */
	public function delete($id)
	{
		return $this->model->find($id)->update(
			array(
				self::SQL_STATUS => self::DELETED
			)
		);
	}
}