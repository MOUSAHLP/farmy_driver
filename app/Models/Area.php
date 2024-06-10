<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Spatie\Translatable\HasTranslations;

class Area extends Model
{
    use HasFactory;

    use HasTranslations;
    public $translatable = ['name'];


    protected $fillable = [
        'name',
        'is_default',
        'latitude',
        'longitude'
    ];

    protected $cast = [
        'name'       => 'string',
        'is_default' => 'boolean',
        'latitude'   => 'integer',
        'longitude'  => 'integer'
    ];

    public function sellers()
    {
        return $this->hasMany(Seller::class);
    }
}
