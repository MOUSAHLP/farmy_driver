<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class DeliveryAttribute extends Model
{
    use HasFactory;

    protected $fillable = [
        'name'
    ];

    protected $cast = [
        'name'  => 'string'
    ];

    public function order()
    {
        return $this->hasMany(Order::class);
    }
}
