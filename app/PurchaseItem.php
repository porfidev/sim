<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class PurchaseItem extends Model
{
    

    protected $table = 'purchase_items';


    protected $fillable = [
        'DocEntry','purchase_id', 'ItemCode','product_id','quantity','CodeBars','u_CantReq','DistNumber','u_Caducidad'
    ];


    public function purchase()
    {
        return $this->belongsTo('App\Purchase', 'purchase_id');
    }


}
