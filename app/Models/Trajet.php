<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Relations\HasMany;


class Trajet extends Model
{
    use SoftDeletes;
    use HasFactory;


    protected $fillable = [
        'lieuxdepart',
        'lieuxArrivee',
        'tarification',
        'dateheureDepart',
        'dateheureArrivee',
    ];

    public function tickets(): HasMany
    {
        return $this->hasMany(Ticket::class) ;
    }
    public function buses()
    {
        return $this->hasMany(Bus::class);
    }
}
