<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Resources\Jobs\JobResource;
use App\Models\Job;

use function App\Http\Helpers\paginatedJsonResponse;
use function App\Http\Helpers\responseSuccess;

class JobsController extends Controller
{
    public function index()
    {
        $jobs = Job::paginate(10);
        return paginatedJsonResponse('Jobs list retrieved successfully ', ['items' => JobResource::collection($jobs)]);
    }

    public function show(Job $job)
    {
        return responseSuccess(200, 'Job retrieved successfully', new JobResource($job));
    }
}
