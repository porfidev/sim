<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Rol extends Model
{
    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'pivot', 'created_at', 'updated_at'
    ];

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'rol', 'description'
    ];

    /**
     * Get the menu items for the rol.
     */
    public function getMenuItems()
    {
        return $this->belongsToMany('App\Menu', 'profiles', 'rol_id', 'menu_item_id');
    }
}
