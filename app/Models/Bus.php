<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Support\Carbon;

class Bus extends Model
{
    use HasFactory;

    protected $fillable = [
        'matricule',
        'brand',
        'photo',
        'model',
        'seat',
    ];

    /**
     * Get trajets for the bus
     *
     * @return HasMany
     */
    public function trajets(): HasMany
    {
        return $this->hasMany(Trajet::class);
    }
}
