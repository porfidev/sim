<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class TripPall extends Model
{
    protected $table = 'trip_pallets';

    protected $fillable = [
        'trip_id','pallet_id','box_id'
    ];

    public function trip()
    {
        return $this->belongsTo('App\Trip', 'trip_id', 'id');
    }

    public function pallet()
    {
        return $this->belongsTo('App\Pallet', 'pallet_id', 'id');
    }

    public function box()
    {
        return $this->belongsTo('App\BoxId', 'box_id', 'id');
    }
}
