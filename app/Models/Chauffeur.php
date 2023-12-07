<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class Chauffeur extends Model
{
    use SoftDeletes;
    use HasFactory;

    protected $fillable = [
        // 'nom',
        // 'prenom',
        // 'numero_permis',
        'agent_id',
    ];

    public function buses()
    {
        return $this->hasMany(Bus::class);
    }
    // Relation avec Agent
   
    
    public function agent()
    {
        return $this->belongsTo(Agent::class);
    }
     // Relation avec User
    public function user()
    {
        return $this->belongsTo(User::class, 'user_id'); 
    }
}

