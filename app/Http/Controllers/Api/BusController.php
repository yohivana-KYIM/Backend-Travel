<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Input; // Ajout de la déclaration pour utiliser Input
use App\Models\Bus;

class BusController extends Controller
{
    public function index()
    {
        $buses = Bus::all();
        return response()->json(['message' => 'Bus récupérés avec succès', 'data' => $buses], 200);
    }

    public function indexTrashed()
    {
        $buses = Bus::onlyTrashed()->get();
        return response()->json(['message' => 'Bus supprimés récupérés avec succès', 'data' => $buses], 200);
    }

    public function indexNotTrashed()
    {
        $buses = Bus::whereNotNull('deleted_at')->get(); // Correction pour obtenir les bus non supprimés
        return response()->json(['message' => 'Bus non supprimés récupérés avec succès', 'data' => $buses], 200);
    }

    public function store(Request $request)
    {
        $validatedData = $request->validate([
            'matricule' => 'required|string',
            'photo' => 'required|string',
            'brand' => 'required|string',
            'model' => 'required|string',
            'seat' => 'required|string',
            'status' => 'in:actif,inactif',
        ]);

        $validatedData['status'] = $request->input('status', 'actif');

        if ($request->hasFile('photo')) {
            $file = $request->file('photo');
            $filename = time() . $file->getClientOriginalName();
            $file->storeAs('public/images', $filename);
            $validatedData['photo'] = 'images/' . $filename;
        }

        $bus = Bus::create($validatedData);
        return response()->json(['message' => 'Bus créé avec succès', 'data' => $bus], 201);
    }

    public function show(Bus $bus)
    {
        return response()->json(['message' => 'Bus récupéré avec succès', 'data' => $bus], 200);
    }

    public function update(Request $request, Bus $bus)
    {
        $validatedData = $request->validate([
            'matricule' => 'string',
            'photo' => 'string',
            'brand' => 'string',
            'model' => 'string',
            'seat' => 'string',
            'status' => 'in:actif,inactif',
        ]);

        $bus->update($validatedData);
        return response()->json(['message' => 'Bus mis à jour avec succès', 'data' => $bus], 200);
    }

    public function destroy(Bus $bus)
    {
        $bus->delete();
        return response()->json(['message' => 'Bus désactivé avec succès'], 204);
    }

    public function search(Request $request)
    {
        $perPage = $request->input('per_page', 10); // Utilisation de la méthode input pour obtenir la valeur de la requête
        $query = $request->input('query', '');

        $buses = Bus::query();

        if ($query) {
            $buses->where('matricule', 'like', '%' . $query . '%')
                ->orWhere('brand', 'like', '%' . $query . '%')
                ->orWhere('model', 'like', '%' . $query . '%');
        }

        $buses = $buses->paginate($perPage);

        return response()->json(['message' => 'Résultats de recherche récupérés avec succès', 'data' => $buses], 200);
    }
}
