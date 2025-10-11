<?php

namespace App\Http\Resources\Application;

use Illuminate\Http\Request;
use Illuminate\Http\Resources\Json\JsonResource;

class ApplicationResponse extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @return array<string, mixed>
     */
    public function toArray($request): array
    {
        return [
            'id' => $this->id,
            'stage' => $this->stage,
            'candidate' => [
                'first_name' => $this->candidate->first_name,
                'email' => $this->candidate->email,
            ],
            'job' => [
                'title' => $this->job->title,
                'description' => $this->job->description,
            ],
            'histories' => $this->histories->map(function ($history) {
                return [
                    'from_stage' => $history->from_stage,
                    'to_stage' => $history->to_stage,
                    'created_at' => $history->created_at,
                ];
            }),
            'created_at' => $this->created_at,
            'updated_at' => $this->updated_at,
        ];
    }
}
