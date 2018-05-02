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
	 * Get all tasks.
	 *
	 * @return Illuminate\Database\Eloquent\Collection
	 */
	public function getList($itemsPerPage)
	{
		return $this->model->paginate($itemsPerPage);
	}

	/**
	 * Get task by id.
	 *
	 * @param integer $id
	 *
	 * @return App\Task
	 */
	public function getById($id)
	{
		return $this->model->find($id);
	}

	/**
	 * Create a new task.
	 *
	 * @param array $attributes
	 *
	 * @return App\Task
	 */
	public function create(array $attributes)
	{
		return $this->model->create($attributes);
	}

	/**
	 * Update a task.
	 *
	 * @param integer $id
	 * @param array $attributes
	 *
	 * @return App\Task
	 */
	public function update($id, array $attributes)
	{
		return $this->model->find($id)->update($attributes);
	}

	/**
	 * Delete a task.
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