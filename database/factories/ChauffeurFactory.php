<?php

namespace Database\Factories;

use App\Models\Chauffeur;
use App\Models\Agent;
use Illuminate\Database\Eloquent\Factories\Factory;

class ChauffeurFactory extends Factory
{
    protected $model = Chauffeur::class;

    public function definition()
    {
        return [
            'numero_permis' => $this->faker->unique()->randomNumber,
            'agent_id' => Agent::factory()->create()->id,
            // Add other attributes as needed
        ];
    }
}
