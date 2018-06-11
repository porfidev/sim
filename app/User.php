<?php

namespace App;

use Illuminate\Notifications\Notifiable;
use Illuminate\Foundation\Auth\User as Authenticatable;

class User extends Authenticatable
{
    use Notifiable;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'boss_id', 'rol_id', 'name', 'email', 'password', 'status'
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];

    /**
     * Get the rol that owns the user.
     */
    public function rol(){

        return $this->belongsTo('App\Rol', 'rol_id');
    }

    public function jefe(){

        return $this->belongsTo('App\User', 'boss_id');
    }
}
