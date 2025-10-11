<?php

namespace App\Http\Controllers\Api;

use App\Http\Controllers\Controller;
use App\Http\Requests\Api\Application\ApplicationRequest;
use App\Http\Resources\Application\ApplicationResponse;
use App\Models\Application;
use App\Models\Candidate;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

use function App\Http\Helpers\responseFail;
use function App\Http\Helpers\responseSuccess;

class ApplicationsController extends Controller
{
    // public function index()
    // {
    //     $applications = Application::with(['candidate', 'job', 'histories'])->get();

    //     return responseSuccess(
    //         200,
    //         'All applications retrieved successfully.',
    //         ApplicationResponse::collection($applications)
    //     );
    // }

    public function store(ApplicationRequest $request)
    {
        $data = $request->validated();

        DB::beginTransaction();

        try {
            $candidate = Candidate::firstOrCreate(
                ['email' => $data['candidate']['email']],
                ['first_name' => $data['candidate']['first_name']]
            );

            $existing = Application::where('job_id', $data['job_id'])
                ->where('candidate_id', $candidate->id)
                ->first();

            if ($existing) {
                DB::rollBack();
                return responseFail(409, 'Candidate already applied to this job.');
            }

            $application = Application::create([
                'job_id' => $data['job_id'],
                'candidate_id' => $candidate->id,
                'stage' => Application::initialStage(),
            ]);

            $application->histories()->create([
                'from_stage' => null,
                'to_stage' => Application::initialStage(),
            ]);

            DB::commit();

            return responseSuccess(
                201,
                'Application created successfully.',
                new ApplicationResponse($application->load('candidate', 'job', 'histories'))
            );
        } catch (\Throwable $e) {
            DB::rollBack();
            dd($e->getMessage(), $e->getFile(), $e->getLine());
            return responseFail(
                500,
                'Something went wrong while creating application.',
                ['error' => $e->getMessage()]
            );
        }
    }

    public function show(Application $application)
    {
        $application->load(['candidate', 'job', 'histories']);

        return responseSuccess(
            200,
            'Application retrieved successfully.',
            new ApplicationResponse($application)
        );
    }
}
