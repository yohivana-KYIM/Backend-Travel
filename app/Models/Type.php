<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Type extends Model
{
    use HasFactory;

    protected $fillable = [
        'name'
    ];

    /**
     * Get Agents for type
     *
     * @return HasMany
     */
    public function agents(): HasMany
    {
        return $this->hasMany(Agent::class);
    }
}
