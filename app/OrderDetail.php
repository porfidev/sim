<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class OrderDetail extends Model
{
    
    protected $table = 'order_details';

    protected $fillable = [
        'itemcode','quantity', 'quantitypack','idOrder','quantity_user','quantity_boss'
    ];

}
