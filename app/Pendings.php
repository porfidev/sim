<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Pendings extends Model
{
    protected $table = 'order_pendings';

    protected $fillable = [
        'order_id', 'user_id','client_id','cat_id','client_status','cat_status'
    ];

     /**
     * Get the cliente
     */
    public function cliente()
    {
        return $this->belongsTo('App\Cliente','client_id');
    }

    /**
     * Get the order
     */
    public function order()
    {
        return $this->belongsTo('App\Order','order_id');
    }

    /**
     * Get the user 
     */
    public function user()
    {
        return $this->belongsTo('App\User','user_id');
    }

    /**
     * Get the distance 
     */
    public function distance()
    {
        return $this->belongsTo('App\Catalogo','cat_id');
    }

}
