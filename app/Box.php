<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

use Illuminate\Database\Eloquent\SoftDeletes;

class Box extends Model
{
    use SoftDeletes;
    protected $table = 'boxes';

    protected $fillable = [
        'description', 'width','height','depth'
    ];

    protected $dates = ['deleted_at'];

    protected $softDelete = true;
}
