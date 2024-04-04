<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Point extends Model
{
    use HasFactory;

    protected $table = 'points';
    public $timestamps = false;
    protected $fillable = [
        'user_id',
        'points',
        'used_points',
        'achievement_id',
        'created_at',
        'used_at',
        'expire_at'
    ];

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public static function getUserPointsSum($user_id)
    {
        return intval(Point::where("user_id", $user_id)
            ->sum("points")) ?? 0;
    }
}
