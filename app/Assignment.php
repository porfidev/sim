<?php

namespace App;


use Illuminate\Database\Eloquent\Model;

class Assignment extends Model
{

    protected $table = 'assignments';


    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'order_id', 'user_id'
    ];

}
