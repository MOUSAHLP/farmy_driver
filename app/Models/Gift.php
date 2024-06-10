<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Spatie\Translatable\HasTranslations;

class Gift extends Model
{
    use HasFactory;

    use HasTranslations;
    public $translatable = ['name','description'];

    protected $fillable = [
        'name',
        'description',
        'quantity'
    ];

    protected $cast = [
        'name'           => 'string',
        'description'    => 'boolean',
        'quantity'       => 'integer'
    ];
}
