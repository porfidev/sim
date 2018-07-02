<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class HistorySupply extends Model
{
    protected $table = 'history_supply';

     /**
     * The attributes that should be mutated to dates.
     *
     * @var array

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'created_at', 'updated_at'
    ];

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'user_id', 'order_id', 'detail_id', 'product_id',
        'quantity', 'hist_date_time'
    ];

}
