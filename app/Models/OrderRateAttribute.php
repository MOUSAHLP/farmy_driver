<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class OrderRateAttribute extends Model
{
    use HasFactory;
    protected $table = "orders_rate_attributes";

    protected $fillable = [
        'rate_attribute_id',
        'input',
        'order_id',
    ];

    public function order()
    {
        return $this->belongsTo(Order::class);
    }
}
