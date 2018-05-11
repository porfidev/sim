<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Menu extends Model
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
        'parent', 'label', 'url', 'user_id'
    ];

    /**
     * Get the rol that owns the user.
     */
    public function myParent()
    {
        return $this->belongsTo('App\Menu', 'parent');
    }

    /**
     * Get the profiles for menu item.
     */
    public function profiles()
    {
        return $this->hasMany('App\Profile', 'menu_item_id');
    }

    /**
     * Get the roles for menu item.
     */
    public function getRols()
    {
        return $this->belongsToMany('App\Rol', 'profiles', 'menu_item_id');
    }
}
