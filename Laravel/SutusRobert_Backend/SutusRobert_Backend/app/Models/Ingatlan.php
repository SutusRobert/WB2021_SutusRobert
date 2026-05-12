<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
class Ingatlan extends Model
{
    use HasFactory;
    public $table = 'ingatlanok';
    public $timestamps = false;

    public $guarded = [];
    public function kategoria()
    {
        return $this->belongsTo(Kategoria::class, 'kategoria');
    }
}

