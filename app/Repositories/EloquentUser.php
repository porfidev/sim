<?php

namespace App\Repositories;

use App\User;

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
	public function getList($itemsPerPage)
	{
		return $this->model->paginate($itemsPerPage);
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
		return $this->model->find($id)->update($attributes);
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
		return $this->model->find($id)->delete();
	}
}