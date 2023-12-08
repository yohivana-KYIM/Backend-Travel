<?php

namespace App\Http\Controllers\Api;

use App\Models\Route;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class RouteController extends Controller
{
    public function index()
    {
        $routes = Route::all();
        return response()->json(['message' => 'Routes récupérées avec succès', 'data' => $routes], 200);
    }

    public function show(Route $route)
    {
        return response()->json(['message' => 'Route récupérée avec succès', 'data' => $route], 200);
    }

    public function store(Request $request)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'from' => 'required|string|max:255',
            'to' => 'required|string|max:255',
            'cost' => 'required|numeric',
        ]);

        $route = Route::create([
            'name' => $request->input('name'),
            'from' => $request->input('from'),
            'to' => $request->input('to'),
            'cost' => $request->input('cost'),
        ]);

        return response()->json(['message' => 'Route créée avec succès', 'data' => $route], 201);
    }

    public function update(Request $request, Route $route)
    {
        $request->validate([
            'name' => 'required|string|max:255',
            'from' => 'required|string|max:255',
            'to' => 'required|string|max:255',
            'cost' => 'required|numeric',
        ]);

        $route->update([
            'name' => $request->input('name'),
            'from' => $request->input('from'),
            'to' => $request->input('to'),
            'cost' => $request->input('cost'),
        ]);

        return response()->json(['message' => 'Route mise à jour avec succès', 'data' => $route], 200);
    }

    public function destroy(Route $route)
    {
        $route->delete();
        return response()->json(['message' => 'Route supprimée avec succès'], 200);
    }

    public function search(Request $request)
    {
        $query = $request->input('query');

        $routes = Route::where('name', 'like', "%$query%")
            ->orWhere('from', 'like', "%$query%")
            ->orWhere('to', 'like', "%$query%")
            ->get();

        return response()->json(['message' => 'Résultats de la recherche', 'data' => $routes], 200);
    }

    public function paginate(Request $request)
    {
        $perPage = $request->input('per_page', 10);

        $routes = Route::paginate($perPage);

        return response()->json(['message' => 'Routes paginées récupérées avec succès', 'data' => $routes], 200);
    }
}
