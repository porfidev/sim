<?php

namespace App;


use Illuminate\Database\Eloquent\Model;

class Assignment extends Model
{

    protected $table = 'assignments';


    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'order_id', 'order_detail_id', 'order_design_id',
        'user_id', 'status'
    ];

    /**
     * Get the order for the assignment.
     */
    public function order()
    {
        return $this->belongsTo('App\Order', 'order_id');
    }

}
