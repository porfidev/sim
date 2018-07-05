<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class BoxId extends Model
{
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'box_type_id', 'status'
    ];
}
