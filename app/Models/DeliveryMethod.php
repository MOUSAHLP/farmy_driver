<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Spatie\Translatable\HasTranslations;

class DeliveryMethod extends Model
{
    use HasFactory;


    use HasTranslations;
    public $translatable = ['name'];


    protected $fillable = [
        'name',
        'price',
        'time',
        'total_price'
    ];

    protected $cast = [
        'name'  => 'string',
        'price' => 'integer',
        'time'  => 'integer',

    ];

    public function orders()
    {
        return $this->hasMany(Order::class);
    }
}
