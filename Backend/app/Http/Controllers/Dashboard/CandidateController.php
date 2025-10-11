<?php

namespace App\Http\Controllers\Dashboard;

use App\Http\Controllers\Controller;
use App\Models\Candidate;
use Illuminate\Http\Request;

class CandidateController extends Controller
{
    public function index()
    {
        $candidates = Candidate::with([
            'applications.interviews',
            'applications.histories',
            'applications.job'
        ])->paginate(10);

        return view('dashboard.candidates.index', compact('candidates'));
    }
}
