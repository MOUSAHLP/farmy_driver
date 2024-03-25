<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class AttributeValues extends Model
{
    use HasFactory;

    public $table = 'attribute_values';
    
    protected $fillable = [
        'attribute_id',
        'value'
    ];

    protected $cast = [
        'attribute_id' => 'integer',
        'value'        => 'string',
    ];
    
    public function attribute()
    {
        return $this->belongsTo(Attribute::class);
    }
}
