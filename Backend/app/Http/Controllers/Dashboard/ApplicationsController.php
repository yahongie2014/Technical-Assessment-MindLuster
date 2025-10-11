<?php

namespace App\Http\Controllers\Dashboard;

use App\Http\Controllers\Controller;
use App\Models\Application;
use Illuminate\Http\Request;

use function App\Http\Helpers\responseFail;

class ApplicationsController extends Controller
{
    public function index()
    {
        $applications = Application::with(['candidate', 'job', 'histories'])->paginate(10);
        return view('dashboard.applications.index', compact('applications'));
    }

    public function show(Application $application)
    {
        $application->load(['candidate', 'job', 'histories']);

        return view('dashboard.applications.show', compact('application'));
    }

    public function rejectApplication(Application $application)
    {
        try {
            $application->reject();
            return redirect()->route('dashboard.applications.index');
        } catch (\Exception $e) {
            return responseFail(
                422,
                $e->getMessage()
            );
        }
    }

    public function moveToNext(Application $application)
    {
        try {
            $application->moveToNextStage();
            return redirect()->route('dashboard.applications.index');
        } catch (\Exception $e) {
            return responseFail(
                422,
                $e->getMessage()
            );
        }
    }
}
