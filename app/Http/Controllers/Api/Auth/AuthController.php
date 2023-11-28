<?php

namespace App\Http\Controllers\Api\Auth;

use App\Http\Controllers\Controller;
use App\Models\Student;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Validation\Rules\Password;
use Illuminate\Support\Facades\Auth;

class AuthController extends Controller
{
    public function login(Request $request)
    {
        $validatedData = $request->validate([
            'email' => 'required|string|email|max:255',
            'password' => 'required|string',
        ]);

        if (!Auth::attempt($validatedData)) {
            return response()->json([
                'message' => 'Les informations de connexion sont invalide.'
            ], 401);
        }

        $user = User::where('email', $validatedData['email'])->firstOrFail();

        if (!$user->active) {
            return response()->json([
                'message' => "Votre compte est désactiver pour le moment.<br> Veuillez contacter l'administrateur pour plus d'informations."
            ], 401);
        }

        return response()->json(
            data: [
                // 'user' => $user,
                'type' => $user->userable->role ? $user->userable->role->name : 'Student',
                'access_token' => $user->createToken('auth_token')->plainTextToken,
                'token_type' => 'Bearer',
            ]
        );
    }

    public function register(Request $request)
    {
        $data = $request->validate([
            'matricule' => ['required', 'string'],
            'first_name' => ['required', 'string'],
            'last_name' => ['required', 'string'],
            'phone_number' => ['required', 'string', 'min:9', 'max:15'],
            'email' => ['required', 'email', 'unique:users,email'],
            'password' => ['required', 'confirmed', Password::min(8)],
        ]);

        $student = Student::create($data);

        $student->user()->create($data);

        return response()->json($student);
    }

    public function logout(Request $request)
    {
        $request->user()->currentAccessToken()->delete();

        return response()->json([
            'message' => 'User disconnected successully',
        ]);
    }
}
