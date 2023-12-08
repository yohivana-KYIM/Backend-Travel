<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class AgentUpdateRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        return [
            'type_id' => ['required', 'integer', 'exists:types,id'],
            'driving_license' => ['required_if:type_id,chauffeur'],
            'first_name' => ['required', 'string'],
            'last_name' => ['required', 'string'],
            'gender' => ['required', 'string'],
            'phone' => ['required', 'string', 'min:9', 'max:15'],
            'address' => ['required', 'string'],
            'email' => ['required', 'email'],
            'password' => ['sometimes', 'confirmed', 'min:8'],
        ];
    }
}
