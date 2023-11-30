<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Chauffeur;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Validator;


class ChauffeurController extends Controller
{
    public function index()
   {
       $chauffeurs = Chauffeur::all();
       return response()->json(['message' => 'Chauffeurs récupérés avec succès', 'data' => $chauffeurs], Response::HTTP_OK);
   }

   public function store(Request $request)
   {
      $validator = Validator::make($request->all(), [
          'nom' => 'required',
          'prenom' => 'required',
          'numero_permis' => 'required|unique:chauffeurs',
      ]);
   
      if ($validator->fails()) {
          return response()->json(['message' => 'Validation Failed', 'errors' => $validator->errors()], Response::HTTP_UNPROCESSABLE_ENTITY);
      }
   
      $chauffeur = Chauffeur::create($request->all());
      return response()->json(['message' => 'Chauffeur créé avec succès', 'data' => $chauffeur], Response::HTTP_CREATED);
   }
   

   public function show(Chauffeur $chauffeur)
   {
       return response()->json(['message' => 'Chauffeur récupéré avec succès', 'data' => $chauffeur], Response::HTTP_OK);
   }

   public function update(Request $request, Chauffeur $chauffeur)
   {
       $chauffeur->update($request->all());
       return response()->json(['message' => 'Chauffeur mis à jour avec succès', 'data' => $chauffeur], Response::HTTP_OK);
   }

   public function destroy(Chauffeur $chauffeur)
   {
       $chauffeur->delete();
       return response()->json(['message' => 'Chauffeur supprimé avec succès'], Response::HTTP_NO_CONTENT);
   }
}
