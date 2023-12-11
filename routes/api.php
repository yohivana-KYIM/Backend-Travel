<?php

use App\Http\Controllers\Api\AgentController;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\Auth\AuthController;
use App\Http\Controllers\Api\StudentController;
use App\Http\Controllers\Api\TypeController;
use App\Http\Controllers\Api\RouteController;
use App\Http\Controllers\Api\BusController;
use App\Http\Controllers\Api\TrajetController;

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
    // Routes pour le contrôleur TypeController
    Route::get('types', [TypeController::class, 'indexNotTrashed']);
    Route::get('types/trashed', [TypeController::class, 'indexTrashed']);
    Route::post('types', [TypeController::class, 'store']);
    Route::put('types/{type}', [TypeController::class, 'update']);
    Route::delete('types/{type}', [TypeController::class, 'destroy']);
    Route::get('types/search', [TypeController::class, 'search']);
    Route::get('types/paginate', [TypeController::class, 'paginate']);

    //route
        Route::resource('routes', RouteController::class);
        Route::get('routes/search', [RouteController::class, 'search']);
        Route::get('routes/paginate', [RouteController::class, 'paginate']);


        // BUS
        Route::get('/buses/trashed', [BusController::class, 'indexTrashed']);
        Route::get('/buses/not-trashed', [BusController::class, 'indexNotTrashed']);
        Route::post('/buses', [BusController::class, 'store']);
        Route::put('/buses/{bus}', [BusController::class, 'update']);
        Route::delete('/buses/{bus}', [BusController::class, 'destroy']);
        Route::post('/buses/search', [BusController::class, 'search']);

            // Routes pour les trajets
            Route::get('/trajets', [TrajetController::class, 'index']);
            Route::post('/trajets', [TrajetController::class, 'store']);
            Route::get('/trajets/{trajet}', [TrajetController::class, 'show']);
            Route::put('/trajets/{trajet}', [TrajetController::class, 'update']);
            Route::delete('/trajets/{trajet}', [TrajetController::class, 'destroy']);
            Route::post('/trajets/search', [TrajetController::class, 'search']);
              // Mise à jour du profil
              Route::put('/update-profile', [AuthController::class, 'updateProfile']);

              // Suppression du compte
              Route::delete('/delete-account', [AuthController::class, 'deleteAccount']);

              // Récupération du profil utilisateur par ID
              Route::get('/user-profile/{userId}', [AuthController::class, 'getUserProfile']);

        });

    // Routes publiques (non protégées par Sanctum)
    Route::get('/buses', [BusController::class, 'index']);
    Route::get('/buses/{bus}', [BusController::class, 'show']);






