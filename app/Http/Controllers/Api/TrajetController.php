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
        $trajet = Trajet::create($request->all());
        return response()->json(['message' => 'Trajet créé avec succès', 'data' => $trajet], 201);
    }
  
    public function show(Trajet $trajet)
    {
        return response()->json(['message' => 'Trajet récupéré avec succès', 'data' => $trajet], 200);
    }
  
    public function update(Request $request, Trajet $trajet)
    {
        $trajet->update($request->all());
        return response()->json(['message' => 'Trajet mis à jour avec succès', 'data' => $trajet], 200);
    }
  
    public function destroy(Trajet $trajet)
    {
        $trajet->delete();
        return response()->json(['message' => 'Trajet supprimé avec succès'], 204);
    }
}
