<?php

namespace Database\Factories;

use App\Models\Agent;
use App\Models\User;
use Illuminate\Database\Eloquent\Factories\Factory;

// AgentFactory.php

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
            // Add other attributes for Agent here
        ];
    }

    public function configure(): Factory
    {
        return $this->afterCreating(function (Agent $agent) {
            // Create a user associated with the agent
            $agent->user()->create([
                'userable_type' => 'agent',
                // Add other user attributes here
            ]);
        })->has(\App\Models\Role::factory()) // Assuming you have a RoleFactory
        ->has(\App\Models\User::factory()) // Assuming you have a UserFactory
        ->has(\App\Models\Chauffeur::factory()); // Assuming you have a ChauffeurFactory
    }
}
