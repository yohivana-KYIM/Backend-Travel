<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Trajet;

class TrajetController extends Controller
{
    public function index()
    {
        $trajets = Trajet::all();
        return response()->json(['message' => 'Trajets récupérés avec succès', 'data' => $trajets], 200);
    }

    public function store(Request $request)
    {
        $validatedData = $request->validate([
            'ref' => 'required|string',
            'start' => 'required|timestamp',
            'end' => 'required|timestamp',
            'status' => 'in:active,inactive',
            'route_id' => 'required|exists:routes,id',
            'bus_id' => 'required|exists:buses,id',
            'agent_id' => 'required|exists:agents,id',
        ]);

        // Définit la valeur par défaut du statut à 'active' si non spécifié dans la requête
        $validatedData['status'] = $request->input('status', 'active');

        $trajet = Trajet::create($validatedData);
        return response()->json(['message' => 'Trajet créé avec succès', 'data' => $trajet], 201);
    }

    public function show(Trajet $trajet)
    {
        return response()->json(['message' => 'Trajet récupéré avec succès', 'data' => $trajet], 200);
    }

    public function update(Request $request, Trajet $trajet)
    {
        $validatedData = $request->validate([
            'ref' => 'string',
            'start' => 'timestamp',
            'end' => 'timestamp',
            'status' => 'in:active,inactive',
            'route_id' => 'exists:routes,id',
            'bus_id' => 'exists:buses,id',
            'agent_id' => 'exists:agents,id',
        ]);

        // Mise à jour du trajet avec les données validées
        $trajet->update($validatedData);

        return response()->json(['message' => 'Trajet mis à jour avec succès', 'data' => $trajet], 200);
    }

    public function destroy(Trajet $trajet)
    {
        $trajet->delete();
        return response()->json(['message' => 'Trajet supprimé avec succès'], 204);
    }

    public function search(Request $request)
    {
        $perPage = $request->input('per_page', 10);
        $query = $request->input('query', '');

        $trajets = Trajet::query();

        if ($query) {
            $trajets->where('ref', 'like', '%' . $query . '%')
                ->orWhere('status', 'like', '%' . $query . '%');
            // Ajoutez d'autres champs de recherche si nécessaire
        }

        $trajets = $trajets->paginate($perPage);

        return response()->json(['message' => 'Résultats de recherche récupérés avec succès', 'data' => $trajets], 200);
    }
}
