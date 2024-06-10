<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Spatie\Translatable\HasTranslations;

class Commission extends Model
{
    use HasFactory;


    use HasTranslations;
    public $translatable = ['name'];


    protected $hidden = [
        'created_at',
        'updated_at'
    ];
    protected $fillable = [
        'name',
    ];
    public function products()
    {
        return $this->hasMany(Product::class);
    }
}
