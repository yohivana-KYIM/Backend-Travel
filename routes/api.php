<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\RoleController;


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
});

Route::middleware(['auth:sanctum'])->group(function () {
    // Routes du contrôleur AgentController avec le middleware auth:sanctum
    Route::apiResource('agents', App\Http\Controllers\Api\AgentController::class);
    // Routes du contrôleur RoleController avec le middleware auth:sanctum
    Route::apiResource('roles', RoleController::class);
    // Routes du contrôleur StudentController
    Route::apiResource('students', App\Http\Controllers\Api\StudentController::class);
});

 //Route::apiResource('agents', App\Http\Controllers\Api\AgentController::class);
