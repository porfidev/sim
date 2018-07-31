<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Order extends Model
{

    protected $table = 'orders';

    protected $fillable = [
        'codeOrder', 'start', 'end', 'code', 'status',
        'itemcode', 'quantity', 'quantitypack','numat',
        'dist_id','client_appointment'
    ];

    /**
     * Get the calculation of the order
     */
    public function calculation()
    {
        return $this->hasOne('App\Calculation');
    }

    /**
     * Get the client of the order
     */
    public function client()
    {
        return $this->belongsTo('App\Cliente', 'code', 'code');
    }

    /**
     * Get the details for the order.
     */
    public function details()
    {
        return $this->hasMany('App\OrderDetail', 'idOrder', 'id');
    }

    /**
     * Get the design for the order.
     */
    public function design()
    {
        return $this->hasMany('App\OrderDesign', 'order_id', 'id');
    }
}
