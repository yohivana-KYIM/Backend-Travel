<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Resources\RoleResource;
use App\Models\Role;
use Illuminate\Http\Request;

class RoleController extends Controller
{
    /**
     * Affiche une liste de ressources.
     */
    public function index()
    {
        // Récupère tous les rôles
        $roles = Role::all();

        // Retourne une collection de ressources de rôles
        return RoleResource::collection($roles);
    }

    /**
     * Stocke une nouvelle ressource dans le stockage.
     */
    public function store(Request $request)
    {
        // Valide les données du formulaire
        $data = $request->validate([
            'name' => 'required',
            // Ajoutez d'autres règles de validation au besoin pour d'autres champs.
        ]);

        // Crée un nouveau rôle avec les données validées
        $role = Role::create($data);

        // Retourne une ressource de rôle nouvellement créée
        return new RoleResource($role);
    }

    /**
     * Affiche la ressource spécifiée.
     */
    public function show(string $id)
    {
        // Récupère le rôle spécifié par l'ID
        $role = Role::findOrFail($id);

        // Retourne une ressource de rôle
        return new RoleResource($role);
    }

    /**
     * Met à jour la ressource spécifiée dans le stockage.
     */
    public function update(Request $request, string $id)
    {
        // Valide les données du formulaire
        $data = $request->validate([
            'name' => 'required',
            // Ajoutez d'autres règles de validation au besoin pour d'autres champs.
        ]);

        // Récupère le rôle spécifié par l'ID
        $role = Role::findOrFail($id);

        // Met à jour les données du rôle avec les données validées
        $role->update($data);

        // Retourne une ressource de rôle mise à jour
        return new RoleResource($role);
    }


    /**
     * Supprime la ressource spécifiée du stockage.
     */
    public function destroy(string $id)
    {
        // Récupère le rôle spécifié par l'ID
        $role = Role::findOrFail($id);

        // Supprime le rôle
        $role->delete();

        // Retourne une réponse JSON indiquant que le rôle a été supprimé avec succès
        return response()->json([
            'message' => 'Rôle supprimé avec succès',
        ]);
    }
}
