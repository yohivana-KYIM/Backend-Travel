<?php




// App\Models\Role.php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Role extends Model
{
    use HasFactory;

    /**
     * The attributes that are mass assignable.
     *
     * @var array<int, string>
     */
    protected $fillable = [
        'name',
        
    ];

    /**
     * Get the agents for the role.
     */
    public function agents()
    {
        return $this->hasMany(Agent::class);
    }
}


