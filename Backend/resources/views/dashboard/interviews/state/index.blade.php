@extends('Master.master')

@section('content')
    <div class="col-12 col-lg-12 pt-4 pt-lg-0">
        <div class="tab-content p-2">

            <div class="card p-3 mb-4">
                <div class="card-header d-flex justify-content-between align-items-center">
                    <h4>Interview Applications</h4>
                    <span class="badge bg-primary">{{ count($interviewApplications) }} Applications</span>
                </div>

                <div class="card-body">
                    @forelse ($interviewApplications as $app)
                        <div class="card mb-3 shadow-sm hover-shadow">
                            <div class="card-body d-flex justify-content-between align-items-center">

                                <div>
                                    <h5>{{ $app['candidate']['first_name'] }} ({{ $app['candidate']['email'] }})</h5>
                                    <p class="mb-1"><strong>Job:</strong> {{ $app['job']['title'] }}</p>
                                    <p class="mb-1"><strong>Stage:</strong>
                                        <span class="badge bg-primary">{{ ucfirst($app['stage']) }}</span>
                                    </p>
                                    <p class="mb-0"><strong>Scheduled Interview:</strong>
                                        {{ $app['interviews'][0]['scheduled_at'] ?? 'Not scheduled' }}
                                    </p>
                                </div>

                                <div class="d-flex gap-2">
                                    <a href="{{ route('dashboard.interviews.create', $app['id']) }}"
                                        class="btn btn-sm btn-outline-primary">
                                        Schedule / Edit Interview
                                    </a>
                                </div>

                            </div>
                        </div>
                    @empty
                        <p class="text-muted">No applications in interview stage yet.</p>
                    @endforelse

                    <div class="mt-3 d-flex justify-content-center">
                        @if ($totalPages > 1)
                            <nav>
                                <ul class="pagination">
                                    @for ($i = 1; $i <= $totalPages; $i++)
                                        <li class="page-item {{ $i == $page ? 'active' : '' }}">
                                            <a class="page-link"
                                                href="{{ route('dashboard.interviews.state.index', ['page' => $i]) }}">{{ $i }}</a>
                                        </li>
                                    @endfor
                                </ul>
                            </nav>
                        @endif
                    </div>

                </div>
            </div>

        </div>
    </div>
@endsection

@push('scripts')
@endpush
