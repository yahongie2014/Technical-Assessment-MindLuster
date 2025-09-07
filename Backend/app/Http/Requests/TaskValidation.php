<?php

namespace App\Http\Requests;

use Illuminate\Foundation\Http\FormRequest;

class TaskValidation extends FormRequest
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
            'title' => 'required|string|max:255',
            'description' => 'nullable|string',
            'column' => 'nullable|in:todo,in_progress,done',
            'due_date' => 'nullable|date',
            'priority' => 'nullable|integer|min:1|max:5',
            'meta' => 'nullable|array',
        ];
    }
}
