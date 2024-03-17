<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Spatie\MediaLibrary\HasMedia;
use Spatie\MediaLibrary\InteractsWithMedia;

class Product extends Model implements HasMedia
{
    use HasFactory , InteractsWithMedia;

    protected $fillable = [
        'name',
        'description',
        'price',
        'tax',
        'slug',
        'quantity',
        'status',
        'availability',
        'seller_id',
        'subcategory_id',
        'discount',
        'discount_status',
        'product_source',
        'commission_id',
        'commission_value'
    ];

    protected $cast = [
        'name'             => 'string',
        'description'      => 'string',
        'price'            => 'integer',
        'slug'             => 'string',
        'quantity'         => 'string',
        'availability'     => 'boolean',
        'seller_id'        => 'integer',
        'status'           => 'boolean',
        'subcategory_id'   => 'integer',
        'discount'         => 'integer',
        'discount_status'  => 'boolean',
        'product_source'   => 'boolean',
        'commission_id'    => 'integer',
        'commissiion_value' => 'boolean',
    ];

    public function seller()
    {
        return $this->belongsTo(Seller::class);
    }

    public function subCategory()
    {
        return $this->belongsTo(SubCategory::class,'subcategory_id');
    }
    public function attributes()
    {
       return $this->belongsToMany(Attribute::class,'product_attribute_values')
       ->withPivot('value');
    }
    public function commission()
    {
        return $this->belongsTo(Commission::class);
    }
    public function relatedProducts()
    {
        return $this->belongsToMany(Product::class, 'product_related_product', 'product_id', 'related_product_id');
    }
    public function  similarProducts()
    {
       return Product::where('subcategory_id' ,$this->subcategory_id)->where('id', '!=', $this->id)->get();
    }
}
