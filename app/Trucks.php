<?php

namespace App;


use Illuminate\Database\Eloquent\Model;

class Trucks extends Model
{

    protected $table = 'trucks';


    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'brand', 'sub-brand', 'model',
        'plates','capacity','operator','truck_series'
    ];
}
