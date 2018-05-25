<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class OrderDetail extends Model
{
    
    protected $table = 'orders';

    protected $fillable = [
        'itemcode','quantity', 'quantitypack','idOrder'
    ];

}
