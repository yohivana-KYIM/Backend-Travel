<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Resources\AgentResource;
use App\Models\Agent;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;

class AgentController extends Controller
{
    public function index()
    {
        $agents = Agent::with('user', 'role')->get();
        return response()->json(AgentResource::collection($agents));
    }

    public function store(Request $request)
    {
        $data = $request->validate([
            'role_id' => 'required|exists:roles,id',
            'first_name' => 'required|string',
            'last_name' => 'required|string',
            'email' => 'required|email|unique:users',
            'password' => ['required', 'confirmed', 'min:8'],
            'phone_number' => 'required|string',
            'image' => 'nullable|string',
            'active' => 'required|boolean',
        ]);

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
            'userable_type' => 'Agent', // Set the class name of the related model
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
        $data = $request->validate([
            'role_id' => 'required|exists:roles,id',
            'first_name' => 'required|string',
            'last_name' => 'required|string',
            'phone_number' => 'required|string',
            'image' => 'nullable|string',
            'active' => 'required|boolean',
        ]);

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
