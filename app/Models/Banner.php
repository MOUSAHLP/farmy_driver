<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Spatie\MediaLibrary\HasMedia;
use Spatie\MediaLibrary\InteractsWithMedia;

class Banner extends Model implements HasMedia
{
    use HasFactory , InteractsWithMedia;

    const PATH = "banners";
    protected $fillable = [
        'link',
        'type',
        'start_time',
        'end_time'
    ];

    protected $cast = [
        'link'       => 'string',
        'type'       => 'string',
        'start_time' => 'date',
        'end_time'   => 'date',
    ];
}
