<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\RoleController;
use App\Http\Controllers\Api\TrajetController;
use App\Http\Controllers\Api\ChauffeurController;
use App\Http\Controllers\Api\BusController;
use App\Http\Controllers\Api\Auth\AuthController;
use App\Http\Controllers\Api\StudentController;
use App\Http\Controllers\Api\AgentController;



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

// Obtenir la liste de tous les utilisateurs
Route::middleware('auth:sanctum')->get('/users', [AuthController::class, 'index']);

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
    // Ressources pour les étudiants
    Route::apiResource('students', StudentController::class);
    
    // Recherche de trajets
    Route::post('trajets/search', [TrajetController::class, 'search']);
    
    // Ressources pour les chauffeurs
    Route::resource('chauffeurs', ChauffeurController::class);
    
    // Ressources pour les bus
    Route::resource('buses', BusController::class);
    
    // Liste des bus supprimés
    Route::get('buses/trashed', [BusController::class, 'indexTrashed']);
    
    // Liste des bus non supprimés
    Route::get('buses/not-trashed', [BusController::class, 'indexNotTrashed']);
});

// Routes pour la gestion du profil utilisateur
Route::middleware('auth:sanctum')->group(function () {
    // Mise à jour du profil
    Route::put('/update-profile', [AuthController::class, 'updateProfile']);
    
    // Suppression du compte
    Route::delete('/delete-account', [AuthController::class, 'deleteAccount']);
    
    // Récupération du profil utilisateur par ID
    Route::get('/user-profile/{userId}', [AuthController::class, 'getUserProfile']);
});

// Ressources pour les rôles, trajets et agents
Route::apiResource('roles', RoleController::class);
Route::apiResource('trajets', TrajetController::class);
Route::apiResource('agents', AgentController::class);
