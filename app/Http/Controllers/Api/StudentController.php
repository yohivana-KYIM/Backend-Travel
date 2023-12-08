<?php

namespace App\Http\Controllers\Api;

use App\Models\Student;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Illuminate\Support\Facades\Hash;
use App\Http\Resources\StudentResource;
use App\Http\Requests\StudentStoreRequest;
use App\Http\Requests\StudentUpdateRequest;

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
    public function store(StudentStoreRequest $request)
    {
        // Valide les données du formulaire
        $data = $request->validated();

        // Crée un nouvel étudiant avec les données validées
        $student = Student::create($data);
        $data['password'] = Hash::make($data['password']);
        $student->user()->create($data);

        // Retourne une ressource d'étudiant nouvellement créée
        return new StudentResource($student);
    }

    /**
     * Affiche la ressource spécifiée.
     */
    public function show(Student $student)
    {
        // Retourne une ressource d'étudiant
        return new StudentResource($student);
    }

    /**
     * Met à jour la ressource spécifiée dans le stockage.
     */
    public function update(Student $student, StudentUpdateRequest $request)
    {
        // Valide les données du formulaire
        $data = $request->validated();

        // Met à jour les données de l'étudiant avec les données validées
        $student->update($data);

        if ($data['password']) {
            $data['password'] = Hash::make($data['password']);
        }

        $student->user()->update($data);

        // Retourne une ressource d'étudiant mise à jour
        return new StudentResource($student);
    }

    /**
     * Supprime la ressource spécifiée du stockage.
     */
    public function destroy(Student $student)
    {
        // Supprime l'étudiant
        $student->user()->delete();
        $student->delete();

        // Retourne une réponse JSON indiquant que l'étudiant a été supprimé avec succès
        return response()->json([
            'message' => 'Étudiant supprimé avec succès',
        ]);
    }
}
