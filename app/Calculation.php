<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Calculation extends Model
{
    
    protected $table = 'calculations';

    protected $fillable = [
        'P','V', 'D','dist_id','order_id','FP','priority'
    ];

}
