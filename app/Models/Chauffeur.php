<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Chauffeur extends Model
{
    use HasFactory;

    protected $fillable = [
        'nom',
        'prenom',
        'numero_permis',
    ];

    public function buses()
    {
        return $this->hasMany(Bus::class);
    }
}

