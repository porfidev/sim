<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class OrderDesign extends Model
{

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'pivot', 'created_at', 'updated_at',
    ];

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'box_id', 'order_id', 'order_detail_id', 'quantity',
        'quantity_validation', 'box_type_id', 'sequence'
    ];

    /**
     * Get the order detail for order design.
     */
    public function orderDetail()
    {
        return $this->belongsTo('App\OrderDetail', 'order_detail_id');
    }

    /**
     * Get the order for order design.
     */
    public function order()
    {
        return $this->belongsTo('App\Order', 'order_id');
    }
}
