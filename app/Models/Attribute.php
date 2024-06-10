<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Spatie\Translatable\HasTranslations;

class Attribute extends Model
{
    use HasFactory;


    use HasTranslations;
    public $translatable = ['name'];


    protected $fillable = [
        'name',
        'status'
    ];

    protected $cast = [
        'name'   => 'string',
        'status' => 'boolean'
    ];

    public function products()
    {
        return $this->belongsToMany(Product::class,'product_attribute_values');
    }

    public function values()
    {
        return $this->hasMany(AttributeValues::class,'attribute_id');
    }
}
