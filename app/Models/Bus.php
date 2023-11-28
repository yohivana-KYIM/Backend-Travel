<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Bus extends Model
{
    use HasFactory;

    protected $fillable = [
        
        'capacitemaximale',
        'photo',
        'nomchauffeur',
        'statut',
        'modelebus',
        'trajet_id',
    ];


    
    public function trajet()
    {
        return $this->belongsTo(Trajet::class);
    }


    public function sieges()
    {
        return $this->hasMany(Siege::class);
    }
}
