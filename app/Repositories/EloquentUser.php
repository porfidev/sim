<?php

namespace App\Repositories;

use DB;

use App\User;
use App\Session;

use Illuminate\Support\Facades\Log;

class EloquentUser implements UserRepository
{

	const SESSION_TIME   = 45;
	const SESSION_OLD    = '> ';
	const SESSION_ACTUAL = '< ';

	/**
	 * @var $model
	 */
	private $model;
	private $modelSession;

    /**
	 * EloquentUser constructor.
	 *
	 * @param App\User $model
	 */
	public function __construct(User $model, Session $session)
	{
		$this->model        = $model;
		$this->modelSession = $session;
    }

	/**
	 * Get the user session
	 */
	public function getSession($user_id, $old=false)
	{
		$condition = self::SESSION_ACTUAL;
		if($old) {
			$condition = self::SESSION_OLD;
		}
		$session = $this->modelSession
			->whereRaw('TIMESTAMPDIFF(MINUTE, COALESCE(updated_at, created_at), NOW()) '.$condition.self::SESSION_TIME)
			->where('user_id', '=', $user_id);

		if($old) {
			$session = $session->get();
		} else {
			$session = $session->first();
		}

		return $session;
	}

	/**
	 * Create the user session
	 */
	public function createSession($user_id, $ip)
	{
		return $this->modelSession->create(
			array(
				self::SQL_SESSION_USER_ID => $user_id,
				self::SQL_SESSION_IP      => $ip
			)
		);
	}

	/**
	 * Delete a Session.
	 *
	 * @param integer $id
	 *
	 * @return boolean
	 */
	public function deleteSession($id)
	{
		return $this->modelSession->find($id)->delete();
	}

	/**
	 * Función que actualiza la sesión.
	 * Lo que se busca es que updated_at se actualice para
	 * dar más tiempo de sessión al usuario.
	 *
	 * @param integer $id
	 * @param integer $user_id
	 *
	 * @return App\Session
	 */
	public function updateSession($id, array $attributes)
	{
		return $this->modelSession
			->find($id)
			->update($attributes);
	}

    /**
	 * Get all users.
	 *
	 * @return Illuminate\Database\Eloquent\Collection
	 */
	public function getList($itemsPerPage, array $search = null)
	{
		$list = $this->model->with('jefe')->with('rol')
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

	public function getListBus($nombre)
	{
		$list = $this->model->select("id as value", "name as label")
			->where("users.name","like","%".$nombre."%");
		return $list->get();
	}

	/**
	 * Función para obtener la lista de usuarios que están asignados
	 * al jefe seleccionado y que están conectados.
	 *
	 * @param String  $name
	 * @param integer $idJefe
	 *
	 * @return Illuminate\Database\Eloquent\Collection
	 */
	public function getListBusUsu($idJefe)
	{
		$list = $this->model->select(
						"users.id as value",
						"users.name as label",
						"sessions.id as connected")
					->leftJoin("sessions", function ($join) {
						$join->on("users.id", "=", "sessions.user_id")
							->whereNull("sessions.deleted_at");
					})
					->where("users.boss_id","=",$idJefe);
		Log::info("EloquentUser - getListBusUsu - SQL: ".$list->toSql());
		return $list->get();
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