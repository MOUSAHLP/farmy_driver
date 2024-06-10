<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Spatie\MediaLibrary\HasMedia;
use Spatie\MediaLibrary\InteractsWithMedia;
use Spatie\Translatable\HasTranslations;

class SubCategory extends Model implements HasMedia
{
    use HasFactory , InteractsWithMedia;

    use HasTranslations;
    public $translatable = ['name'];

    protected $fillable = [
        'name',
        'status',
        'category_id',
    ];

    protected $cast = [
        'name'        => 'string',
        'status'      => 'boolean',
        'category_id' => 'integer'
    ];

    public function category()
    {
        return $this->belongsTo(Category::class);
    }

    public function products()
    {
        return $this->hasMany(Product::class,'subcategory_id');
    }
}
