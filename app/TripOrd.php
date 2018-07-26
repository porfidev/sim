<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class TripOrd extends Model
{
    protected $table = 'trip_ord';

    protected $fillable = [
        'trip_id','order_id'
    ];
}
