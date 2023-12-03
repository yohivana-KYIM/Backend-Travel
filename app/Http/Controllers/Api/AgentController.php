<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Resources\AgentResource;
use App\Models\Agent;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;
use Illuminate\Support\Facades\Validator;
class AgentController extends Controller
{
    public function index()
    {
        $agents = Agent::with('user', 'role')->get();
        return response()->json(AgentResource::collection($agents));
    }

    public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'role_id' => 'required|exists:roles,id',
            'first_name' => 'required|string',
            'last_name' => 'required|string',
            'email' => 'required|email|unique:users,email',
            'password' => ['required', 'confirmed', 'min:8'],
            'phone_number' => 'required|string',
            'image' => 'nullable|string',
            'active' => 'required|boolean',
        ], [
            'role_id.required' => 'Le champ "role_id" est requis.',
            'role_id.exists' => 'Le rôle spécifié n\'existe pas.',
            'first_name.required' => 'Le champ "first_name" est requis.',
            'first_name.string' => 'Le champ "first_name" doit être une chaîne de caractères.',
            'last_name.required' => 'Le champ "last_name" est requis.',
            'last_name.string' => 'Le champ "last_name" doit être une chaîne de caractères.',
            'email.required' => 'Le champ "email" est requis.',
            'email.email' => 'Le champ "email" doit être une adresse e-mail valide.',
            'email.unique' => 'Cette adresse e-mail est déjà utilisée.',
            'password.required' => 'Le champ "password" est requis.',
            'password.confirmed' => 'La confirmation du mot de passe ne correspond pas.',
            'password.min' => 'Le mot de passe doit contenir au moins :min caractères.',
            'phone_number.required' => 'Le champ "phone_number" est requis.',
            'phone_number.string' => 'Le champ "phone_number" doit être une chaîne de caractères.',
            'image.nullable' => 'Le champ "image" doit être une chaîne de caractères.',
            'active.required' => 'Le champ "active" est requis.',
            'active.boolean' => 'Le champ "active" doit être un booléen.',
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 422);
        }

        $data = $validator->validated();

        // Create an agent
        $agent = Agent::create([
            'role_id' => $data['role_id'],
        ]);

        // Create a user associated with the agent
        $user = User::create([
            'first_name' => $data['first_name'],
            'last_name' => $data['last_name'],
            'email' => $data['email'],
            'password' => bcrypt($data['password']),
            'phone_number' => $data['phone_number'],
            'image' => $data['image'],
            'active' => $data['active'],
            'userable_id' => $agent->id,
            'userable_type' => 'App\Models\Agent', // Set the class name of the related model
        ]);

        // Update the agent with the user_id
        $agent->update([
            'user_id' => $user->id,
        ]);

        return response()->json(new AgentResource($agent));
    }


    public function show($id)
    {
        $agent = Agent::with('user', 'role')->findOrFail($id);
        return response()->json(new AgentResource($agent));
    }

    
    public function update(Request $request, $id)
    {
        $validator = Validator::make($request->all(), [
            'role_id' => 'required|exists:roles,id',
            'first_name' => 'required|string',
            'last_name' => 'required|string',
            'phone_number' => 'required|string',
            'image' => 'nullable|string',
            'active' => 'required|boolean',
        ], [
            'role_id.required' => 'Le champ "role_id" est requis.',
            'role_id.exists' => 'Le rôle spécifié n\'existe pas.',
            'first_name.required' => 'Le champ "first_name" est requis.',
            'first_name.string' => 'Le champ "first_name" doit être une chaîne de caractères.',
            'last_name.required' => 'Le champ "last_name" est requis.',
            'last_name.string' => 'Le champ "last_name" doit être une chaîne de caractères.',
            'phone_number.required' => 'Le champ "phone_number" est requis.',
            'phone_number.string' => 'Le champ "phone_number" doit être une chaîne de caractères.',
            'image.nullable' => 'Le champ "image" doit être une chaîne de caractères.',
            'active.required' => 'Le champ "active" est requis.',
            'active.boolean' => 'Le champ "active" doit être un booléen.',
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()], 422);
        }

        $data = $validator->validated();

        $agent = Agent::findOrFail($id);

        $user = $agent->user;
        $user->update([
            'first_name' => $data['first_name'],
            'last_name' => $data['last_name'],
            'phone_number' => $data['phone_number'],
            'image' => $data['image'],
            'active' => $data['active'],
        ]);

        $agent->update([
            'role_id' => $data['role_id'],
        ]);

        return response()->json(new AgentResource($agent));
    }

    public function destroy($id)
    {
        $agent = Agent::findOrFail($id);
        $agent->delete();

        return response()->json([
            'message' => 'Agent supprimé avec succès',
        ]);
    }
}