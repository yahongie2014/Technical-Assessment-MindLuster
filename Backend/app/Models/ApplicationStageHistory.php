<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class ApplicationStageHistory extends Model
{
    protected $guarded = [];

    public function application()
    {
        return $this->belongsTo(Application::class);
    }
}
