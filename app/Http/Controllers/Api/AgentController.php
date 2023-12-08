<?php

namespace App\Http\Controllers\Api;

use App\Enums\TypeAgentEnum;
use App\Http\Controllers\Controller;
use App\Http\Requests\AgentStoreRequest;
use App\Http\Resources\AgentResource;
use App\Http\Resources\DriverResource;
use App\Models\Agent;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\Rule;
use Illuminate\Support\Facades\Validator;

class AgentController extends Controller
{
    public function index()
    {
        $agents = Agent::query()->whereNotIn('type_id', [TypeAgentEnum::DRIVER->value])->get();

        return AgentResource::collection($agents);
    }

    public function drivers()
    {
        $agents = Agent::query()->whereIn('type_id', [TypeAgentEnum::DRIVER->value])->get();

        return DriverResource::collection($agents);
    }

    public function store(AgentStoreRequest $request)
    {
        $data = $request->validated();

        // Create an agent
        $agent = Agent::create($data);

        // Create a user associated with the agent
        $data['password'] = Hash::make($data['password']);
        $agent->user()->create($data);

        return response()->json(new AgentResource($agent));
    }


    public function show(Agent $agent)
    {
        return new AgentResource($agent);
    }


    public function update(Agent $agent, Request $request)
    {
        $data = $request->validated();

        $agent->update($data);

        if ($data['password']) {
            $data['password'] = Hash::make($data['password']);
        }

        $agent->user()->update($data);

        return new AgentResource($agent);
    }

    public function destroy(Agent $agent)
    {
        $agent->user()->delete();
        $agent->delete();

        return response()->json([
            'message' => 'Agent supprimé avec succès',
        ]);
    }
}
