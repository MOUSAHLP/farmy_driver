<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Seller extends Model
{
    use HasFactory;

    protected $fillable = [
        'name',
        'status',
        'latitude',
        'longitude',
        'area_id',
        'type',
        'discount'
    ];

    protected $cast = [
        'name'      =>'string',
        'status'    => 'boolean',
        'latitude'  => 'integer',
        'longitude' => 'integer',
        'area_id'   => 'integer',
        'type'      => 'string',
        'discount'  => 'integer',
    ];

    public function area()
    {
        return $this->belongsTo(Area::class);
    }

    public function products()
    {
        return $this->hasMany(Product::class);
    }
}
