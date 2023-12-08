<?php

use App\Http\Controllers\Api\AgentController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\Auth\AuthController;
use App\Http\Controllers\Api\StudentController;

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

// Routes du contrôleur AuthController avec le préfixe 'auth'
Route::prefix('auth')->group(function () {
    // Connexion
    Route::post('/login', [AuthController::class, 'login']);

    // Inscription
    Route::post('/register', [AuthController::class, 'register']);

    // Mot de passe oublié
    Route::post('/forgot-password', [AuthController::class, 'forgotPassword']);

    // Réinitialisation du mot de passe
    Route::post('/reset-password', [AuthController::class, 'reset']);

    // Déconnexion
    Route::post('/logout', [AuthController::class, 'logout'])->middleware('auth:sanctum');

    // Google and Facebook authentication routes
    Route::get('/login/google', [AuthController::class, 'redirectToGoogle']);
    Route::get('/login/google/callback', [AuthController::class, 'handleGoogleCallback']);
    Route::get('/login/facebook', [AuthController::class, 'redirectToFacebook']);
    Route::get('/login/facebook/callback', [AuthController::class, 'handleFacebookCallback']);
});

// Routes protégées nécessitant une authentification sanctum
Route::middleware(['auth:sanctum'])->group(function () {
    // Route pour obtenir les informations de l'utilisateur actuellement authentifié
    Route::get('/user', function (Request $request) {
        return $request->user();
    });

    // Ressources pour les étudiants
    Route::apiResource('students', StudentController::class);

    // Ressources pour les agents/drvers
    Route::apiResource('agents', AgentController::class);
    // Ressources pour les agents/drvers
    Route::get('/drivers', [AgentController::class, 'drivers']);
});
