<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class HomePageDynamic extends Model
{
    use HasFactory;

    public const  TYPE_CATEGORY = "category";
    public const  TYPE_PRODUCT = "section";
    public const  TYPE_BANNER = "slider";
    public const  PRODUCT_TAKE_NUMBER = 5;


    protected $fillable = [
        'type',
        'order',
        'title_ar',
        'title_en',
        'link',
    ];

    public function content()
    {
        return $this->hasMany(HomePageDynamicContent::class)->with(["product", "banner", "category"]);
    }
}
