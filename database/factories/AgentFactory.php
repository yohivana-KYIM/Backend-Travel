<?php

namespace Database\Factories;

use App\Models\Agent;
use Illuminate\Database\Eloquent\Factories\Factory;

class AgentFactory extends Factory
{
    protected $model = Agent::class;

    public function definition(): array
    {
        return [
            'role_id' => \App\Models\Role::factory(),
            // Ajoutez d'autres attributs pour Agent ici
        ];
    }

    public function configure(): Factory
    {
        return $this->afterCreating(function (Agent $agent) {
            // Créer un utilisateur associé à l'agent
            $agent->user()->create([
                'userable_type' => '\App\Models\Agent',
                // Ajoutez d'autres attributs d'utilisateur ici
            ]);
        });
    }
}























