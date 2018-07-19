<?php

namespace App;


use Illuminate\Database\Eloquent\Model;

class PallBox extends Model
{

    protected $table = 'pall_box';


    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'box_id', 'pallet_id'
    ];

    /**
     * Get the order for the assignment.
     */
    public function boxId()
    {
        return $this->belongsTo('App\BoxId', 'box_id');
    }

    /**
     * Get the order for the assignment.
     */
    public function pallet()
    {
        return $this->belongsTo('App\Pallet', 'pallet_id');
    }

}
