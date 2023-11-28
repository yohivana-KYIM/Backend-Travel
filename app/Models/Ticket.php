<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Ticket extends Model
{
    use HasFactory;

    protected $fillable = [
        'montant',
        'date',
        'disponibilite',
        'trajet_id',
    ];

    public function trajet()
    {
        return $this->belongsTo(Trajet::class);
    }

    public function payement()
    {
        return $this->hasOne(Payement::class);
    }
}
