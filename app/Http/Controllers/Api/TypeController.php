<?php

namespace App\Http\Controllers\Api;

use App\Models\Type;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class TypeController extends Controller
{
    public function indexNotTrashed()
    {
        $types = Type::all();
        return response()->json(['message' => 'Types non supprimés récupérés avec succès', 'data' => $types], 200);
    }

    public function indexTrashed()
    {
        $types = Type::onlyTrashed()->get();
        return response()->json(['message' => 'Types supprimés récupérés avec succès', 'data' => $types], 200);
    }

    public function destroy(Type $type)
    {
        $type->delete();
        return response()->json(['message' => 'Type désactivé avec succès'], 204);
    }

    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:255',
        ]);

        $type = Type::create([
            'name' => $request->input('name'),
        ]);

        return response()->json(['message' => 'Type créé avec succès', 'data' => $type], 201);
    }

    public function update(Request $request, Type $type)
    {
        $request->validate([
            'name' => 'required|string|max:255',
        ]);

        $type->update([
            'name' => $request->input('name'),
        ]);

        return response()->json(['message' => 'Type mis à jour avec succès', 'data' => $type], 200);
    }

    public function search(Request $request)
    {
        $query = $request->input('query');

        $types = Type::where('name', 'like', "%$query%")->get();

        return response()->json(['message' => 'Résultats de la recherche', 'data' => $types], 200);
    }

    public function paginate(Request $request)
    {
        $perPage = $request->input('per_page', 10); // Nombre d'éléments par page

        $types = Type::paginate($perPage);

        return response()->json(['message' => 'Types paginés récupérés avec succès', 'data' => $types], 200);
    }
}
