<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Task extends Model
{
    use HasFactory;

    protected $fillable = [
        'title', 'description', 'column', 'due_date', 'priority', 'meta'
    ];

    protected $casts = [
        'due_date' => 'date',
        'meta' => 'array'
    ];

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function scopeColumn($q, $col)
    {
        return $q->when($col, fn($qq) => $qq->where('column', $col));
    }

}
