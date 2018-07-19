<?php

namespace App;


use Illuminate\Database\Eloquent\Model;

class Pallet extends Model
{

    protected $table = 'pallet';


    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'code','order_id'
    ];
}
