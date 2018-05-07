<?php

namespace App\Repositories;

use App\Rol;

use Illuminate\Support\Facades\Log;

class EloquentRol implements RolRepository
{
    /**
	 * @var $model
	 */
    private $model;

    /**
	 * EloquentRol constructor.
	 *
	 * @param App\Rol $model
	 */
	public function __construct(Rol $model)
	{
		$this->model = $model;
    }

    /**
	 * Get all rols.
	 *
	 * @return Illuminate\Database\Eloquent\Collection
	 */
    function getAll()
    {
        return $this->model->all();
    }

    /**
	 * Get rol by id.
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
	 * Create a new rol.
	 *
	 * @param array $attributes
	 *
	 * @return App\Rol
	 */
	public function create(array $attributes)
	{
		return $this->model->create($attributes);
    }

    /**
	 * Update a rol.
	 *
	 * @param integer $id
	 * @param array $attributes
	 *
	 * @return App\Rol
	 */
	public function update($id, array $attributes)
	{
		return $this->model->find($id)->update($attributes);
	}

	/**
	 * Delete a rol.
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