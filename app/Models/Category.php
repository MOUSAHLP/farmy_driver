<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Spatie\MediaLibrary\HasMedia;
use Spatie\MediaLibrary\InteractsWithMedia;
use Spatie\Translatable\HasTranslations;

class Category extends Model implements HasMedia
{
    use HasFactory, InteractsWithMedia;


    use HasTranslations;
    public $translatable = ['name'];


    const PATH = "categories";

    protected $fillable = [
        'name',
        'status',
    ];

    protected $cast = [
        'name'      => 'string',
        'status'    => 'boolean',
    ];

    public function subcategories()
    {
        return $this->hasMany(SubCategory::class);
    }
}
