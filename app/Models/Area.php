<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Area extends Model
{
    use HasFactory;

    protected $fillable = [
        'name',
        'is_default',
        'latitude',
        'longitude'
    ];

    protected $cast = [
        'name'       => 'string',
        'is_default' => 'boolean',
        'latitude'   => 'integer',
        'longitude'  => 'integer'
    ];

    public function sellers()
    {
        return $this->hasMany(Seller::class);
    }
}
