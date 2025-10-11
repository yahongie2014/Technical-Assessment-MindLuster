@extends('Master.master')

@section('content')
    <div class="col-12 col-lg-12 pt-4 pt-lg-0">
        <div class="row g-3">

            @foreach ($candidates as $candidate)
                <div class="col-12 col-md-6 col-lg-4">
                    <div class="card shadow-sm h-100">
                        <div class="card-header shadow">
                            <h5 class="mb-0">{{ $candidate->first_name }}</h5>
                            <small>{{ $candidate->email }}</small>
                        </div>
                        <div class="card-body">
                            <h6 class="fw-bold">Applications:</h6>
                            @forelse ($candidate->applications as $app)
                                <div class="mb-3 p-2 border rounded bg-light">
                                    <p class="mb-1"><strong>Job:</strong> {{ $app->job->title ?? '—' }}</p>
                                    <p class="mb-1"><strong>Stage:</strong> <span
                                            class="badge bg-info text-dark">{{ ucfirst($app->stage) }}</span></p>
                                    <p class="mb-1"><strong>Interviews:</strong>
                                        @if ($app->interviews->count())
                                            <ul class="mb-0 ps-3">
                                                @foreach ($app->interviews as $interview)
                                                    <li>{{ \Carbon\Carbon::parse($interview->scheduled_at)->format('d M Y, H:i') }}
                                                    </li>
                                                @endforeach
                                            </ul>
                                        @else
                                            None
                                        @endif
                                    </p>
                                    <p class="mb-0"><strong>History:</strong>
                                        @if ($app->histories->count())
                                            <ul class="mb-0 ps-3">
                                                @foreach ($app->histories as $history)
                                                    <li>{{ $history->from_stage ?? '—' }} → {{ $history->to_stage }}</li>
                                                @endforeach
                                            </ul>
                                        @else
                                            None
                                        @endif
                                    </p>
                                </div>
                            @empty
                                <p class="text-muted">No applications yet.</p>
                            @endforelse
                        </div>
                    </div>
                </div>
            @endforeach

        </div>

        <!-- Pagination -->
        <div class="mt-4">
            {{ $candidates->links() }}
        </div>
    </div>
@endsection

@push('scripts')
@endpush
