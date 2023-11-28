<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\MorphOne;

class Agent extends Model
{
    use HasFactory;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'role_id'
    ];

    protected $with = ['user', 'role'];

    /**
     * Get the agent's user information.
     */
    public function user(): MorphOne
    {
        return $this->morphOne(User::class, "userable");
    }

    /**
     * Get the role information.
     */
    public function role(): BelongsTo
    {
        return $this->belongsTo(Role::class);
    }
}
