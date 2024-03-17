<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class DeliveryTimeInfo extends Model
{
    use HasFactory;

    protected $fillable = [
        'start_time',
        'end_time',
        'before_message',
        'after_message'
    ];

    protected $cast = [
        'start_time'       => 'time',
        'end_time'         => 'time',
        'before_message'   => 'string',
        'after_message'    => 'string'
    ];
}
