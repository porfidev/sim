<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
    
    protected $table = 'orders';

    protected $fillable = [
        'codeOrder','start', 'end','code','status','itemcode','quantity','quantitypack'
    ];

}
