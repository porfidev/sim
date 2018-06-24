<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class PurchaseItems extends Model
{
    

    protected $table = 'purchase_items';


    protected $fillable = [
        'DocEntry','purchase_id', 'ItemCode','product_id','quantity','CodeBars','u_CantReq','DistNumber','u_Caducidad'
    ];


    public function purchase()
    {
        return $this->belongsTo('App\Purchase', 'purchase_id');
    }

    public function producto()
    {
        return $this->belongsTo('App\Product', 'ItemCode');
    }

}
