<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class OrderTrace extends Model
{
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'order_id', 'trace_type', 'user_id'
    ];
}
