<?php

namespace App\Http\Resources;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class StudentResource extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray(Request $request): array
    {
        return [
            'id' => $this->id,
            'matricule' => $this->matricule,
            'first_name' => optional($this->user)->first_name,
            'last_name' => optional($this->user)->last_name,
            'email' => optional($this->user)->email,
            'phone' => optional($this->user)->phone,
            'address' => optional($this->user)->address,
            'image' => optional($this->user)->image,
            'active' => optional($this->user)->active,
            'created_at' => $this->created_at->format('Y-m-d h:i:s'),
            'updated_at' => $this->updated_at->format('Y-m-d h:i:s'),
        ];
    }
}
