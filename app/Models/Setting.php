<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Setting extends Model
{
    use HasFactory;
    protected $table = "settings";
    protected $fillable = [
        "baseUrl",
        "version",
        "phone",
        "show_reward_system",
    ];
    protected $casts = [
        'show_reward_system' => 'boolean'
    ];
}
