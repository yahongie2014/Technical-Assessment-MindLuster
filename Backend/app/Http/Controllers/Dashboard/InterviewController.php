<?php

namespace App\Http\Controllers\Dashboard;

use App\Http\Controllers\Controller;
use App\Http\Requests\Dashboard\Intervie\InterviewRequest;
use App\Iterate\Eloquent\ApplicationIterator;
use App\Models\Application;
use Illuminate\Http\Request;

class InterviewController extends Controller
{

    public function __construct(private readonly ApplicationIterator $iterator) {}
    public function interviewsState(Request $request)
    {
        $page = $request->query('page', 1);
        $perPage = 1;

        $interviewApplications = [];
        foreach ($this->iterator->filterByStage('interview', $perPage, $page) as $app) {
            $interviewApplications[] = $app;
        }

        $totalApplications = $this->iterator->countByStage('interview');
        $totalPages = ceil($totalApplications / $perPage);


        return view('dashboard.interviews.state.index', compact('interviewApplications', 'page', 'totalPages'));
    }


    public function index(Application $application)
    {
        $application->load('interviews', 'candidate', 'job');
        return view('dashboard.interviews.index', compact('application'));
    }

    public function create(Application $application)
    {
        return view('dashboard.interviews.create', compact('application'));
    }

    public function store(InterviewRequest $request, $applicationId)
    {
        $application = Application::findOrFail($applicationId);

        $interview = $application->interviews()->create([
            'scheduled_at' => $request->scheduled_at,
        ]);

        return redirect()->route('dashboard.interviews.index', $application)
            ->with('success', 'Interview scheduled successfully.');
    }
}
