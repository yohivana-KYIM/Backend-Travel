<?php
// RoleFactory.php

namespace Database\Factories;

use Illuminate\Database\Eloquent\Factories\Factory;
use App\Models\Role;

class RoleFactory extends Factory
{
    /**
     * Définit l'état par défaut du modèle.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
             'name' => $this->faker->name,
        ];
    }

    /**
     * Configure le modèle en tant qu'administrateur.
     *
     * @return \Illuminate\Database\Eloquent\Factories\Factory
     */
    public function admin(): Factory
    {
        return $this->state(function (array $attributes) {
            return [
                'name' => 'Admin',
            ];
        });
    }

    /**
     * Configure le modèle en tant que chauffeur.
     *
     * @return \Illuminate\Database\Eloquent\Factories\Factory
     */
    public function driver(): Factory
    {
        return $this->state(function (array $attributes) {
            return [
                'name' => 'Driver',
            ];
        });
    }
}

