<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class ArrivalItem extends Model
{
    protected $table = 'arrival_items';

    protected $fillable = [
        'purchase_id','ItemCode','pedimento','product_id','quantity','cantidad_rec','DistNumber','u_Caducidad','caducidad_minima'
    ];
}
