<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

use Illuminate\Database\Eloquent\SoftDeletes;

class Cliente extends Model
{
    use SoftDeletes;
    protected $table = 'clients';

    protected $fillable = [
        'name', 'email','telephone','rfc','cp','city','address','status','branch_id'
    ];

    protected $dates = ['deleted_at'];

    protected $softDelete = true;

}
