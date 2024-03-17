<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class UserAddress extends Model
{
    use HasFactory;
    protected $fillable = [
        'address',
        'user_id',
        'latitude',
        'longitude',
        'name',
        'street',
        'building',
        'building_number',
        'floor',
        'area',
        'is_favourite',
    ];

    protected $cast = [
        'name'            => 'string',
        'user_id'         => 'integer',
        'latitude'        => 'integer',
        'longitude'       => 'integer',
        'name'            => 'string',
        'street'          => 'string',
        'building'        => 'string',
        'building_number' => 'string',
        'floor'           => 'string',
        'area'            => 'string',
        'is_favourite'    => 'bool',
    ];

    public function user()
    {
        return $this->belongsTo(User::class);
    }
}
