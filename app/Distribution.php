<?php

namespace App;


use Illuminate\Database\Eloquent\Model;

class Distribution extends Model
{

    protected $table = 'distribution';


    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'order_id', 'sku', 'quantity',
        'shop','order_detail_id'
    ];

    /**
     * Get the order for the assignment.
     */
    public function order()
    {
        return $this->belongsTo('App\Order', 'order_id');
    }

    /**
     * Get the order for the assignment.
     */
    public function product()
    {
        return $this->belongsTo('App\Product', 'sku');
    }

    /**
     * Get the details for the distribution.
     */
    public function detail()
    {
        return $this->belongsTo('App\OrderDetail', 'order_detail_id');
    }

}
