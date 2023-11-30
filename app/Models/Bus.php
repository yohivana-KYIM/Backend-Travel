<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Bus extends Model
{
    use SoftDeletes;
    use HasFactory;

    protected $fillable = [

        'capacitemaximale',
        'photo',
        'statut',
        'modelebus',
        'chauffeur_id',
        'trajet_id',
    ];



    public function trajet()
    {
        return $this->belongsTo(Trajet::class);
    }
    public function chauffeur()
    {
        return $this->belongsTo(Chauffeur::class);
    }

    public function sieges()
    {
        return $this->hasMany(Siege::class);
    }
}
