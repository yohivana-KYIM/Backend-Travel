<?php

namespace Database\Factories;

use App\Models\User;
use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Str;
use App\Models\Student;
use App\Models\Chauffeur;
use App\Models\Agent;

class UserFactory extends Factory
{
    protected $model = User::class;

    public function definition(): array
    {
        return [
            'first_name' => $this->faker->firstName,
            'last_name' => $this->faker->lastName,
            'phone_number' => $this->faker->phoneNumber,
            'email' => $this->faker->unique()->safeEmail,
            'email_verified_at' => now(),
            'password' => Hash::make('password'),
            'remember_token' => Str::random(10),
        ];
    }

    public function admin(): self
    {
        return $this->afterCreating(function (User $user) {
            $agent = Agent::factory()->create();
            $user->userable()->associate($agent);
            $user->save();
        });
    }

    public function driver(): self
    {
        return $this->afterCreating(function (User $user) {
            $chauffeur = Chauffeur::factory()->create();
            $user->userable()->associate($chauffeur);
            $user->save();
        });
    }

    public function student(): self
    {
        return $this->afterCreating(function (User $user) {
            $student = Student::factory()->create();
            $user->userable()->associate($student);
            $user->save();
        });
    }
    
    public function unverified(): self
    {
        return $this->state(fn (array $attributes) => [
            'email_verified_at' => null,
        ]);
    }
}

