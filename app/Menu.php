<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Menu extends Model
{
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
}
