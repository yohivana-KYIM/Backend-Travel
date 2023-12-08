<?php

// DatabaseSeeder.php
namespace Database\Seeders;

use App\Models\Agent;
use Illuminate\Database\Seeder;
use App\Models\Student;
use App\Models\Type;
use App\Models\User;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        // Seed the 'roles' table with an 'Admin' role
        Type::factory()->count(1)->has(
            Agent::factory()->count(2)->has(User::factory(), 'user')
        )->create();

        Student::factory()->count(5)->has(
            User::factory(), 'user'
        )->create();

        /* Type::factory()->create([
            'name' => 'Admin',
        ])->each(function ($role) {
            $role->agents()->saveMany(
                Agent::factory()->count(2)->create()->each(function ($agent) {
                    $agent->user()->save(User::factory()->create());
                })
            );
        }); */

        // Seed the 'roles' table with a 'Driver' role
        /* Role::factory()->create([
            'name' => 'Driver',
        ])->each(function ($role) {
            $role->agents()->saveMany(
                Agent::factory()->count(1)->create(['role_id' => $role->id])->each(function ($agent) {
                    $agent->user()->save(User::factory()->create());
                    $agent->chauffeur()->save(\App\Models\Chauffeur::factory()->create());
                })
            );
        }); */

        // Seed the 'students' table with 5 students, each having a user
        /* Student::factory()->count(5)->create()->each(function ($student) {
            $student->user()->save(User::factory()->create());
        }); */
    }
}
