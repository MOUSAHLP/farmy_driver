<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Notification extends Model
{
    use HasFactory;

    protected $fillable = [
		'type',
		'notifiable_type',
		'notifiable_id',
		'data',
	];

    protected $casts = [
		'type'          => 'string',
		'notifiable_id' => 'int',
		'data'		    => 'object',
	];



    public function notifications()
    {
        return $this->morphMany(Notification::class, 'notifiable');
    }
}
