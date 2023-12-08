<?php

namespace App\Http\Controllers\Api\Auth;

use App\Models\User;
use App\Models\Student;
use App\Mail\WelcomeEmail;
use App\Mail\ResetPasswordNotification;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Mail;
use Illuminate\Support\Facades\Password;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Str;
use Laravel\Socialite\Facades\Socialite;
use App\Http\Controllers\Controller;

class AuthController extends Controller
{
    protected $providers = ["google", "facebook"];

    public function register(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'matricule' => ['required', 'string', 'unique:students,matricule,except,id'],
            'first_name' => ['required', 'string'],
            'last_name' => ['required', 'string'],
            'gender' => ['required', 'string'],
            'phone' => ['required', 'string', 'min:9', 'max:15'],
            'address' => ['required', 'string'],
            'email' => ['required', 'email', 'unique:users,email'],
            'password' => ['required', 'confirmed', 'min:8'],
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 422);
        }

        if ($request->password !== $request->password_confirmation) {
            return response()->json(['errors' => ['password' => ['Le mot de passe et la confirmation ne correspondent pas.']]], 422);
        }

        $data = $validator->validated();
        $student = Student::create($data);
        $data['password'] = Hash::make($data['password']);
        $user = $student->user()->create($data);

        Mail::to($user->email)->send(new WelcomeEmail($student));

        return response()->json($student);
    }

    public function login(Request $request)
    {
        $validatedData = $request->validate([
            'email' => 'required|string|email|max:255',
            'password' => 'required|string',
        ], [
            'email.required' => 'L\'adresse e-mail est requise.',
            'email.email' => 'L\'adresse e-mail doit être une adresse e-mail valide.',
            'password.required' => 'Le mot de passe est requis.',
        ]);

        if (!Auth::attempt($validatedData)) {
            return response()->json(['message' => 'Les informations de connexion sont invalides.'], 401);
        }

        $user = User::where('email', $validatedData['email'])->firstOrFail();

        if (!$user->active) {
            return response()->json(['message' => "Votre compte est désactivé pour le moment. Veuillez contacter l'administrateur pour plus d'informations."], 401);
        }

        return response()->json([
            'type' => optional($user->userable->type)->name ?? 'Student',
            'access_token' => $user->createToken('auth_token')->plainTextToken,
            'token_type' => 'Bearer',
            'data' => $user,
        ]);
    }

    public function redirectToProvider($provider)
    {
        if (!in_array($provider, $this->providers)) {
            return response()->json(['message' => 'Provider not supported'], 422);
        }

        return Socialite::driver($provider)->redirect();
    }

    public function handleProviderCallback($provider)
    {
        if (!in_array($provider, $this->providers)) {
            return response()->json(['message' => 'Provider not supported'], 422);
        }

        $socialiteUser = Socialite::driver($provider)->user();

        $user = User::where('email', $socialiteUser->getEmail())->first();

        if (!$user) {
            $user = User::create([
                'email' => $socialiteUser->getEmail(),
                // 'name' => $socialiteUser->getName(),
                'password' => Hash::make(Str::random(8)),
            ]);
        }

        Auth::login($user);

        return response()->json(['message' => "Authentification $provider réussie"]);
    }

    public function forgotPassword(Request $request)
    {
        $credentials = $request->validate([
            'email' => 'required|email|exists:users,email',
        ]);

        $user = User::where('email', $credentials['email'])->first();

        if (!$user) {
            return response()->json(["msg" => 'Utilisateur non trouvé'], 404);
        }

        $token = Password::createToken($user);

        $user->notify(new ResetPasswordNotification($token));

        return response()->json([
            "msg" => 'Lien de réinitialisation du mot de passe envoyé à votre adresse e-mail.',
            'token' => $token,
        ]);
    }

    public function resetPassword(Request $request)
    {
        $credentials = $request->validate([
            'email' => 'required|email',
            'token' => 'required|string|size:64',
            'password' => 'required|string|confirmed',
        ]);

        $resetPasswordStatus = Password::reset($credentials, function ($user, $password) {
            $user->password = Hash::make($password);
            $user->save();
        });

        if ($resetPasswordStatus == Password::INVALID_TOKEN) {
            return response()->json(["msg" => "Jeton non valide fourni"], 400);
        }

        return response()->json(["msg" => "Mot de passe changé avec succès"]);
    }


    public function logout(Request $request)
    {
        $request->user()->currentAccessToken()->delete();

        return response()->json([
            'message' => 'Déconnexion réussie',
        ]);
    }

    public function deleteAccount(Request $request)
    {
        $user = auth()->user();

        if (!Hash::check($request->input('password'), $user->password)) {
            return response()->json(['message' => 'Mot de passe de confirmation incorrect'], 401);
        }

        if (!$user->active) {
            return response()->json(['message' => 'Le compte est déjà désactivé'], 400);
        }

        $user->active = false;
        $user->save();

        return response()->json(['message' => 'Compte désactivé avec succès']);
    }

    // une nouvelle méthode pour récupérer le profil d'un utilisateur spécifique par son ID :
    public function getUserProfile($userId)
    {
        $user = User::findOrFail($userId);

        return response()->json(['data' => $user]);
    }


    public function updateProfile(Request $request)
    {
        $user = auth()->user();

        $request->validate([
            'first_name' => 'required|string',
            'last_name' => 'required|string',
            'phone_number' => 'required|string',
            'image' => 'image|mimes:jpeg,png,jpg,gif,svg|max:2048',
        ]);

        $user->update($request->only(['first_name', 'last_name', 'phone_number']));

        if ($request->hasFile('image')) {
            $file = $request->file('image');
            $filename = time() . $file->getClientOriginalName();
            $file->storeAs('public/images', $filename);

            if ($user->image) {
                Storage::delete('public/' . $user->image);
            }

            $user->image = 'images/' . $filename;
            $user->save();
        }

        return response()->json(['message' => 'Profil mis à jour avec succès']);
    }
}
