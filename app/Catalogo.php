<?php

namespace App;

use Illuminate\Database\Eloquent\SoftDeletes;

use Illuminate\Database\Eloquent\Model;

class Catalogo extends Model
{
    use SoftDeletes;
    protected $table = 'catalogs';

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'pivot', 'created_at', 'updated_at', 'grupo_id'
    ];

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'label', 'value','status','group_id'
    ];

    protected $dates = ['deleted_at'];

    protected $softDelete = true;

    public function myParent()
    {
        return $this->belongsTo('App\Catalogo', 'group_id');
    }
}
