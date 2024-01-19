<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Support\Carbon;

class Route extends Model
{
    use HasFactory;

    protected $fillable = [
        'name',
        'from',
        'to',
        'cost',
    ];

    /**
     * Get trajets for the route
     *
     * @return HasMany
     */
    public function trajets(): HasMany
    {
        return $this->hasMany(Trajet::class);
    }
}
