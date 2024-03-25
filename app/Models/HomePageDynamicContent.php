<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class HomePageDynamicContent extends Model
{
    use HasFactory;

    protected $fillable = [
        'home_page_dynamic_id',
        'product_id',
        'category_id',
        'banner_id',
    ];

    public function homePageDynamic()
    {
        return $this->belongsTo(HomePageDynamic::class);
    }

    public function category()
    {
        return $this->belongsTo(Category::class, "category_id", "id");
    }

    public function product()
    {
        return $this->belongsTo(Product::class, "product_id", "id");
    }

    public function banner()
    {
        return $this->belongsTo(Banner::class, "banner_id", "id");
    }
}
