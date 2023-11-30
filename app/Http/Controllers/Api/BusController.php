<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Models\Bus;

class BusController extends Controller
{
   public function index()
   {
       $buses = Bus::with('trajet', 'chauffeur')->get();
       return response()->json(['message' => 'Buses récupérés avec succès', 'data' => $buses], 200);
   }

   public function indexTrashed()
   {
       $buses = Bus::onlyTrashed()->with('trajet', 'chauffeur')->get();
       return response()->json(['message' => 'Buses supprimés récupérés avec succès', 'data' => $buses], 200);
   }

   public function indexNotTrashed()
   {
       $buses = Bus::withoutTrashed()->with('trajet', 'chauffeur')->get();
       return response()->json(['message' => 'Buses non supprimés récupérés avec succès', 'data' => $buses], 200);
   }

   public function store(Request $request)
   {
       $validatedData = $request->validate([
           'capacitemaximale' => 'required|integer',
           'photo' => 'required|image',
           'statut' => 'required|in:active,inactif',
           'modelebus' => 'required|string',
           'trajet_id' => 'required|exists:trajets,id',
           'chauffeur_id' => 'required|exists:chauffeurs,id',
       ]);

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
       $bus->load('trajet', 'chauffeur');
       return response()->json(['message' => 'Bus récupéré avec succès', 'data' => $bus], 200);
   }

   public function update(Request $request, Bus $bus)
   {
       $validatedData = $request->validate([
           'capacitemaximale' => 'integer',
           'photo' => 'string',
           'statut' => 'in:active,inactif',
           'modelebus' => 'string',
           'trajet_id' => 'exists:trajets,id',
           'chauffeur_id' => 'exists:chauffeurs,id',
       ]);

       $bus->update($validatedData);
       return response()->json(['message' => 'Bus mis à jour avec succès', 'data' => $bus], 200);
   }

   public function destroy(Bus $bus)
   {
       $bus->delete();
       return response()->json(['message' => 'Bus désactivé avec succès'], 204);
   }
}
