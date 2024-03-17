<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class AttributeValue extends Model
{
    use HasFactory;

    public $table = 'product_attribute_values';

    protected $fillable = [
        'attribute_id',
        'product_id',
        'value',
    ];

    protected $cast = [
        'attribute_id' => 'integer',
        'product_id'   => 'integer',
        'value'        => 'integer',
    ];

    // public function products()
    // {
        
    // }
    
    
}
