<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Calculation extends Model
{
    
    protected $table = 'calculations';

    protected $fillable = [
        'P','V', 'D','Dist','order_id','FP','priority'
    ];

}
