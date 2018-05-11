<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Profile extends Model
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
        'rol_id', 'menu_item_id', 'user_id'
    ];

    /**
     * Get the rol that owns the profile.
     */
    public function rol()
    {
        return $this->belongsTo('App\Rol', 'rol_id');
    }

    /**
     * Get the rol that owns the profile.
     */
    public function menuItem()
    {
        return $this->belongsTo('App\Menu', 'menu_item_id');
    }
}
