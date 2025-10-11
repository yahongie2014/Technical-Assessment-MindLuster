@extends('Master.master')

@section('content')
    <div class="col-12 col-lg-12 pt-4 pt-lg-0">
        <div class="tab-content p-2">

            <div class="card p-3">
                <div class="card-header d-flex justify-content-between align-items-center">
                    <h4>Application Details</h4>
                    <span class="badge bg-primary">ID: {{ $application->id }}</span>
                </div>

                <div class="card-body">
                    <h5 class="mb-1">{{ $application->candidate->first_name }} ({{ $application->candidate->email }})</h5>
                    <p class="mb-1"><strong>Job:</strong> {{ $application->job->title }}</p>
                    <p class="mb-3"><strong>Stage:</strong>
                        <span
                            class="badge 
                        @if ($application->stage == 'applied') bg-info
                        @elseif($application->stage == 'phone_screen') bg-warning
                        @elseif($application->stage == 'interview') bg-primary
                        @elseif($application->stage == 'hired') bg-success
                        @elseif($application->stage == 'rejected') bg-danger @endif">
                            {{ ucfirst($application->stage) }}
                        </span>
                    </p>

                    <div class="d-flex gap-2 mb-4">
                        @if ($application->stage != 'rejected' && $application->stage != 'hired')
                            <form action="{{ route('dashboard.applications.next', $application->id) }}" method="POST">
                                @csrf
                                <button type="submit" class="btn btn-outline-primary btn-sm">Move to Next Stage</button>
                            </form>

                            <form action="{{ route('dashboard.applications.reject', $application->id) }}" method="POST">
                                @csrf
                                @method('PUT')
                                <button type="submit" class="btn btn-outline-danger btn-sm">Reject</button>
                            </form>
                        @else
                            <span class="text-muted">No actions available</span>
                        @endif
                    </div>

                    <div>
                        <h6>Stage History:</h6>
                        <ul class="list-group list-group-flush">
                            @foreach ($application->histories as $history)
                                <li class="list-group-item">
                                    <strong>{{ ucfirst($history->from_stage ?? 'N/A') }}</strong> →
                                    <strong>{{ ucfirst($history->to_stage) }}</strong>
                                    <small class="text-muted">({{ $history->created_at->format('d M Y, H:i') }})</small>
                                </li>
                            @endforeach
                        </ul>
                    </div>

                </div>
            </div>

        </div>
    </div>
@endsection
