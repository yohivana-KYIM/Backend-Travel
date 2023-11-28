<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Resources\AgentResource;
use App\Models\Agent;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;

class AgentController extends Controller
{
    /**
     * Affiche une liste de ressources.
     */
    public function index()
    {
        // Récupère tous les agents
        $agents = Agent::all();

        // Retourne une collection de ressources Agent
        return AgentResource::collection($agents);
    }


    /**
     * Stocke une nouvelle ressource dans le stockage.
     */
    public function store(Request $request)
    {
        // Validation des données de la requête
        $data = $request->validate([
            'role_id' => 'required|exists:roles,id',
            'first_name' => 'required|string',
            'last_name' => 'required|string',
            'email' => 'required|email|unique:users,email',
            'phone_number' => 'required|string|min:9|max:15',
            'image' => 'nullable|image|mimes:jpeg,png,jpg,gif|max:2048',
            'active' => 'boolean',
            // Ajoutez d'autres règles de validation au besoin pour d'autres champs.
        ]);

        // Création de l'agent avec les données validées
        $agent = Agent::create($data);

        // Retourne la ressource de l'agent nouvellement créé
        return new AgentResource($agent);
    }

    /**
     * Affiche la ressource spécifiée.
     */
    public function show(string $id)
    {
        // Recherche de l'agent par ID
        $agent = Agent::findOrFail($id);

        // Retourne la ressource de l'agent
        return new AgentResource($agent);
    }

    /**
     * Met à jour la ressource spécifiée dans le stockage.
     */
    public function update(Request $request, string $id)
    {
        // Validation des données de la requête
        $data = $request->validate([
            'role_id' => 'required|roles,id',
            'first_name' => 'required|string',
            'last_name' => 'required|string',
            'email' => 'required|email|unique:users,email,' . $id,
            'phone_number' => 'required|string|min:9|max:15',
            'image' => 'nullable|image|mimes:jpeg,png,jpg,gif|max:2048',
            'active' => 'boolean',
            // Ajoutez d'autres règles de validation au besoin pour d'autres champs.
        ]);

        // Recherche de l'agent par ID
        $agent = Agent::findOrFail($id);

        // Mise à jour de l'agent avec les données validées
        $agent->update($data);

        // Retourne la ressource de l'agent mis à jour
        return new AgentResource($agent);
    }

    /**
     * Supprime la ressource spécifiée du stockage.
     */
    public function destroy(string $id)
    {
        // Recherche de l'agent par ID
        $agent = Agent::findOrFail($id);

        // Suppression de l'agent
        $agent->delete();

        // Retourne une réponse JSON
        return response()->json([
            'message' => 'Agent supprimé avec succès',
        ]);
    }
}
