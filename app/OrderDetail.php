<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class OrderDetail extends Model
{

    protected $table = 'order_details';

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'itemcode', 'quantity', 'quantitypack',
        'idOrder', 'quantity_user', 'quantity_boss'
    ];

    /**
     * Get the product for order detail.
     */
    public function product()
    {
        return $this->belongsTo('App\Product', 'itemcode', 'sku');
    }

    /**
     * Get the order for order detail.
     */
    public function order()
    {
        return $this->belongsTo('App\Order', 'idOrder');
    }
}
