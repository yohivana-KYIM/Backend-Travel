<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class TrajetResource extends JsonResource
{
    public function toArray(Request $request)
    {
        return [
            'id' => $this->id,
            'lieuxdepart' => $this->lieuxdepart,
            'lieuxArrivee' => $this->lieuxArrivee,
            'tarification' => $this->tarification,
            'dateheureDepart' => $this->dateheureDepart,
            'dateheureArrivee' => $this->dateheureArrivee,
            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at,
        ];
    }
}
