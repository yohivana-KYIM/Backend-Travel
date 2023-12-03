<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Resources\StudentResource;
use App\Models\Student;
use Illuminate\Http\Request;

class StudentController extends Controller
{
    /**
     * Affiche une liste de ressources.
     */
    public function index()
    {
        // Récupère tous les étudiants
        $students = Student::all();

        // Retourne une collection de ressources d'étudiants
        return StudentResource::collection($students);
    }

    /**
     * Stocke une nouvelle ressource dans le stockage.
     */
    public function store(Request $request)
    {
        // Valide les données du formulaire
        $data = $request->validate([
            'matricule' => 'required|unique:students,matricule',
            // Ajoutez d'autres règles de validation au besoin pour d'autres champs.
        ]);

        // Crée un nouvel étudiant avec les données validées
        $student = Student::create($data);

        // Retourne une ressource d'étudiant nouvellement créée
        return new StudentResource($student);
    }

    /**
     * Affiche la ressource spécifiée.
     */
    public function show(string $id)
    {
        // Récupère l'étudiant spécifié par l'ID
        $student = Student::findOrFail($id);

        // Retourne une ressource d'étudiant
        return new StudentResource($student);
    }

    /**
     * Met à jour la ressource spécifiée dans le stockage.
     */
    public function update(Request $request, string $id)
    {
        // Valide les données du formulaire
        $data = $request->validate([
            'matricule' => 'required|unique:students,matricule,' . $id,
            // Ajoutez d'autres règles de validation au besoin pour d'autres champs.
        ]);

        // Récupère l'étudiant spécifié par l'ID
        $student = Student::findOrFail($id);

        // Met à jour les données de l'étudiant avec les données validées
        $student->update($data);

        // Retourne une ressource d'étudiant mise à jour
        return new StudentResource($student);
    }

    /**
     * Supprime la ressource spécifiée du stockage.
     */
    public function destroy(string $id)
    {
        // Récupère l'étudiant spécifié par l'ID
        $student = Student::findOrFail($id);

        // Supprime l'étudiant
        $student->delete();

        // Retourne une réponse JSON indiquant que l'étudiant a été supprimé avec succès
        return response()->json([
            'message' => 'Étudiant supprimé avec succès',
        ]);
    }
    
    //delete compte
  

}
