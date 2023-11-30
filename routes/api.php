<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\RoleController;
use App\Http\Controllers\Api\TrajetController;
use App\Http\Controllers\Api\ChauffeurController;
use App\Http\Controllers\Api\BusController;
use App\Http\Controllers\Api\Auth\AuthController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

// Route pour obtenir les informations de l'utilisateur actuellement authentifié
Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
   return $request->user();
});

// Routes du contrôleur AuthController avec le préfixe 'auth'
Route::controller(App\Http\Controllers\Api\Auth\AuthController::class)->prefix('auth')->group(function () {
   Route::post('/login', 'login');
   Route::post('/register', 'register');
   Route::post('/logout', 'logout')->middleware('auth:sanctum');

// Google and Facebook authentication routes

   Route::get('/login/google', 'Api\Auth\AuthController@redirectToGoogle');
   Route::get('/login/google/callback', 'Api\Auth\AuthController@handleGoogleCallback');

   Route::get('/login/facebook', 'Api\Auth\AuthController@redirectToFacebook');
   Route::get('/login/facebook/callback', 'Api\Auth\AuthController@handleFacebookCallback');

      // Use the "Route::post" method to specify the method name
      Route::post('/forgot-password', [AuthController::class, 'forgotPassword']);
      Route::post('/reset-password', [AuthController::class, 'resetPassword']);

});


Route::middleware(['auth:sanctum'])->group(function () {
    // Routes du contrôleur AgentController avec le middleware auth:sanctum
    // Route::apiResource('agents', App\Http\Controllers\Api\AgentController::class);
    // Routes du contrôleur RoleController avec le middleware auth:sanctum

    // Routes du contrôleur StudentController
    Route::apiResource('students', App\Http\Controllers\Api\StudentController::class);




    Route::post('trajets/search', [TrajetController::class, 'search']);

    Route::apiResource('trajets', TrajetController::class);
    Route::resource('chauffeurs', ChauffeurController::class);
    Route::resource('buses', BusController::class);
    Route::get('buses/trashed', [BusController::class, 'indexTrashed']);
    Route::get('buses/not-trashed', [BusController::class, 'indexNotTrashed']);

});
Route::post('/password/reset', 'AuthController@resetPassword');
Route::apiResource('roles', App\Http\Controllers\Api\RoleController::class);




Route::apiResource('agents', App\Http\Controllers\Api\AgentController::class);





