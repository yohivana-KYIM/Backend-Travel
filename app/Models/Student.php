<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\MorphOne;

class Student extends Model
{
    use HasFactory;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'matricule',
    ];

    protected $with = ['user'];

    /**
     * Get the student's user information.
     */
    public function user(): MorphOne
    {
        return $this->morphOne(User::class, "userable");
    }
}
