<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Order extends Model
{
    use HasFactory;

    protected $fillable = [
        'order_number',
        'user_id',
        'driver_id',
        'status',
        'delivery_method_id',
        'payment_method_id',
        'user_address_id',
        'city_id',
        'start_time',
        'end_time',
        'latitude',
        'longitude',
        'payment_status',
        'coupon_discount',
        'delivery_fee',
        'sub_total',
        'total',
        'date',
        'notes',
        'changes',
        'rate',
        'confirmed_at',
        'delivered_at'
    ];
    protected $casts = [
        'order_number'       => 'integer',
        'user_id'            => 'integer',
        'driver_id'          => 'integer',
        'status'             => 'integer',
        'delivery_method_id' => 'integer',
        'payment_method_id'  => 'integer',
        'user_address_id'    => 'integer',
        'city_id'            => 'integer',
        'start_time'         => 'datetime',
        'end_time'           => 'datetime',
        'latitude'           => 'integer',
        'longitude'          => 'integer',
        'payment_status'     => 'boolean',
        'coupon_discount'    => 'double',
        'delivery_fee'       => 'double',
        'sub_total'          => 'double',
        'total'              => 'double',
        'date'               => 'datetime',
        'notes'              => 'string',
        'changes'            => "array",
        'rate'               => 'integer',
    ];
    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function driver()
    {
        return $this->belongsTo(Driver::class);
    }

    public function orderDetails()
    {
        return $this->hasMany(OrderDetail::class);
    }

    public function deliveryMethod()
    {
        return $this->belongsTo(DeliveryMethod::class);
    }

    public function deliveryAttributes()
    {
        return $this->belongsToMany(DeliveryAttribute::class, 'order_delivery_attributes');
    }

    public function paymentMethod()
    {
        return $this->belongsTo(PaymentMethod::class);
    }

    public function userAddress()
    {
        return $this->belongsTo(UserAddress::class);
    }
    public function city()
    {
        return $this->belongsTo(City::class);
    }


    protected static function boot()
    {
        parent::boot();

        static::creating(function ($order) {
            $order->order_number = self::generateOrderNumber();
        });
    }

    protected static function generateOrderNumber()
    {
        $lastOrder = self::orderBy('id', 'desc')->first();

        if ($lastOrder) {
            return $lastOrder->order_number + 1;
        } else {
            return 1000; // Default starting order number
        }
    }
}
