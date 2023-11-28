<?php

// database/factories/TrajetFactory.php
use Illuminate\Database\Eloquent\Factories\Factory;

use App\Models\Trajet;

class TrajetFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = Trajet::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        return [
            'lieuxdepart' => $this->faker->city,
            'lieuxArrivee' => $this->faker->city,
            'tarification' => $this->faker->randomFloat(2, 100, 1000),
            'dateheureArrivee' => $this->faker->dateTime,
            // You can adjust the above fields based on your actual requirements
        ];
    }
}
