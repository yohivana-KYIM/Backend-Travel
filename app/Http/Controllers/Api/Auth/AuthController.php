<?php

namespace App\Http\Controllers\Api\Auth;

use App\Models\User;
use App\Models\Student;
use App\Mail\WelcomeEmail;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Password;
use Illuminate\Auth\Events\PasswordReset;
use Illuminate\Http\Request;
use Illuminate\Support\Str;

use Laravel\Socialite\Facades\Socialite;
use App\Http\Controllers\Controller;

class AuthController extends Controller
{
    // Les tableaux des providers autorisés
    protected $providers = ["google", "facebook"];
    public function login(Request $request)
    {
        $validatedData = $request->validate([
            'email' => 'required|string|email|max:255',
            'password' => 'required|string',
        ]);

        if (!Auth::attempt($validatedData)) {
            return response()->json([
                'message' => 'Les informations de connexion sont invalides.'
            ], 401);
        }

        $user = User::where('email', $validatedData['email'])->firstOrFail();

        if (!$user->active) {
            return response()->json([
                'message' => "Votre compte est désactivé pour le moment. Veuillez contacter l'administrateur pour plus d'informations."
            ], 401);
        }

        return response()->json([
            'type' => $user->userable->role ? $user->userable->role->name : 'Student',
            'access_token' => $user->createToken('auth_token')->plainTextToken,
            'token_type' => 'Bearer',
        ]);
    }




    public function redirectToGoogle()
    {
        return Socialite::driver('google')->redirect();
    }

    public function handleGoogleCallback()
    {
        $socialiteUser = Socialite::driver('google')->user();

        // Vérifiez si l'utilisateur existe déjà dans la base de données
        $user = User::where('email', $socialiteUser->getEmail())->first();

        if (!$user) {
            // L'utilisateur n'existe pas, enregistrez-le
            $user = User::create([
                'email' => $socialiteUser->getEmail(),
                'name' => $socialiteUser->getName(),

                'password' => Hash::make(Str::random(8)),// Générez un mot de passe aléatoire
            ]);

            // Ajoutez le rôle et autres détails si nécessaire
        }

        Auth::login($user);

        return response()->json(['message' => 'Authentification Google réussie']);
    }

    public function redirectToFacebook()
    {
        return Socialite::driver('facebook')->redirect();
    }

    public function handleFacebookCallback()
    {
        $socialiteUser = Socialite::driver('facebook')->user();

        // Vérifiez si l'utilisateur existe déjà dans la base de données
        $user = User::where('email', $socialiteUser->getEmail())->first();

        if (!$user) {
            // L'utilisateur n'existe pas, enregistrez-le
            $user = User::create([
                'email' => $socialiteUser->getEmail(),
                'name' => $socialiteUser->getName(),
                'password' => Hash::make(Str::random(8)), // Générez un mot de passe aléatoire
            ]);

        }

        Auth::login($user);

        return response()->json(['message' => 'Authentification Facebook réussie']);
    }

    public function register(Request $request)
    {
        $data = $request->validate([
            'matricule' => ['required', 'string'],
            'first_name' => ['required', 'string'],
            'last_name' => ['required', 'string'],
            'phone_number' => ['required', 'string', 'min:9', 'max:15'],
            'email' => ['required', 'email', 'unique:users,email'],
            'password' => ['required', 'confirmed', 'min:8'],
        ]);



        $student = Student::create($data);

        // Créez d'abord l'utilisateur avant d'envoyer l'e-mail
        $user = $student->user()->create($data);

        // Envoyez l'e-mail de bienvenue à l'utilisateur avec le mot de passe non chiffré
        Mail::to($user->email)->send(new WelcomeEmail($student));

        return response()->json($student);
    }


    public function logout(Request $request)
    {
        $request->user()->currentAccessToken()->delete();

        return response()->json([
            'message' => 'User disconnected successfully',
        ]);
    }
    public function forgotPassword(Request $request)
    {
        $request->validate([
            'email' => 'required|email',
        ]);

        info('Before sending reset link'); // Ajout de cette ligne pour la journalisation

        $status = Password::sendResetLink(
            $request->only('email')
        );

        info('After sending reset link'); // Ajout de cette ligne pour la journalisation

        return $status === Password::RESET_LINK_SENT
            ? response()->json(['message' => 'Reset link sent to your email'], 200)
            : response()->json(['message' => 'Unable to send reset link'], 400);
    }

    public function resetPassword(Request $request)
    {
        $request->validate([
            'email' => 'required|email',
            'password' => 'required|confirmed|min:8',
            'token' => 'required|string',
        ]);

        // Utilisez la méthode setToken pour définir le token
        Password::setToken($request->token);

        // Réinitialisation du mot de passe
        $response = Password::reset(
            $request->only('email', 'password', 'password_confirmation', 'token'),
            function ($user, $password) {
                $user->forceFill([
                    'password' => Hash::make($password),
                ])->save();

                event(new PasswordReset($user));
            }
        );

        return $response == Password::PASSWORD_RESET
            ? response()->json(['message' => 'Password reset successfully'], 200)
            : response()->json(['message' => 'Unable to reset password'], 400);
    }
}








