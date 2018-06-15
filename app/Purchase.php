<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Purchase extends Model
{
    
    protected $table = 'purchases';

    protected $fillable = [
        'DocEntry','DocNum','CardCode','CardName','DocDueDate','arrival','status'
    ];
    
    
    //
}
