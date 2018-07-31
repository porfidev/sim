<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Trip extends Model
{
    protected $table = 'trips';

    protected $fillable = [
        'truck_id','arrive_date','finish_date','foreign_truck','status','guide_number'
    ];

    public function truck()
    {
        return $this->belongsTo('App\Trucks', 'truck_id', 'id');
    }
}
