<?php
    // DatabaseSeeder.php
    namespace Database\Seeders;

    use Illuminate\Database\Seeder;
    use App\Models\Role;


    class DatabaseSeeder extends Seeder
    {
        /**
         * Seed the application's database.
         */
        public function run(): void
        {
            // Uncomment the lines below if you want to seed the 'users' table
            // \App\Models\User::factory(10)->create();
            // \App\Models\User::factory()->create([
            //     'name' => 'Test User',
            //     'email' => 'test@example.com',
            // ]);

            // Seed the 'roles' table with an 'Admin' role
            Role::factory()->create([
                'name' => 'Admin',
            ]);


        }
    }
