<?php

namespace App\Http\Controllers\Dashboard;

use App\Http\Controllers\Controller;
use App\Http\Requests\Dashboard\JobRequest;
use App\Models\Job;
use Illuminate\Http\Request;

class JobsController extends Controller
{
    public function index()
    {
        $jobs = Job::with('recruiter')->paginate(10);
        return view('dashboard.Jobs.index', compact('jobs'));
    }

    public function create()
    {
        return view('dashboard.Jobs.create');
    }

    public function store(JobRequest $request)
    {
        $data = $request->validated();

        $data['recruiter_id'] = 1;

        Job::create($data);

        return redirect()->route('dashboard.jobs.index')
            ->with('success', 'Job created successfully!');
    }

    public function show(Job $job)
    {
        return view('dashboard.Jobs.show', compact('job'));
    }

    public function edit(Job $job)
    {
        return view('dashboard.Jobs.edit', compact('job'));
    }

    public function update(JobRequest $request, Job $job)
    {
        $data = $request->validated();

        $job->update($data);

        return redirect()->route('dashboard.jobs.index')
            ->with('success', 'Job updated successfully!');
    }

    public function destroy(Job $job)
    {
        $job->delete();

        return redirect()->route('dashboard.jobs.index')
            ->with('success', 'Job deleted successfully!');
    }
}
