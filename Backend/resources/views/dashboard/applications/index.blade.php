@extends('Master.master')

@section('content')
    <div class="col-12 col-lg-12 pt-4 pt-lg-0">
        <div class="tab-content p-2">

            <div class="card p-3 mb-4">
                <div class="card-header d-flex justify-content-between align-items-center">
                    <h4>Applications Dashboard</h4>
                    <span class="badge bg-primary">{{ $applications->count() }} Applications</span>
                </div>
                <div class="card-body">
                    @foreach ($applications as $application)
                        <div class="card mb-3 shadow-sm hover-shadow">
                            <div class="card-body d-flex justify-content-between align-items-center">
                                <div>
                                    <h5>{{ $application->candidate->first_name }} ({{ $application->candidate->email }})
                                    </h5>
                                    <p class="mb-1"><strong>Job:</strong> {{ $application->job->title }}</p>
                                    <p class="mb-0"><strong>Stage:</strong>
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
                                </div>

                                <div class="d-flex gap-2">
                                    {{-- زر الانتقال لصفحة Schedule Interview فقط للـ stage interview --}}
                                    @if ($application->stage == 'interview')
                                        <a href="{{ route('dashboard.interviews.create', $application->id) }}"
                                            class="btn btn-sm btn-outline-success">
                                            Schedule Interview
                                        </a>
                                    @endif

                                    {{-- أزرار باقي المراحل --}}
                                    @if ($application->stage != 'rejected' && $application->stage != 'hired')
                                        <form action="{{ route('dashboard.applications.next', $application->id) }}"
                                            method="POST">
                                            @csrf
                                            <button type="submit" class="btn btn-sm btn-outline-primary">Move to Next
                                                Stage</button>
                                        </form>
                                        <form action="{{ route('dashboard.applications.reject', $application->id) }}"
                                            method="POST">
                                            @csrf
                                            @method('PUT')
                                            <button type="submit" class="btn btn-sm btn-outline-danger">Reject</button>
                                        </form>
                                    @elseif($application->stage == 'rejected' || $application->stage == 'hired')
                                        <span class="text-muted">No actions available</span>
                                    @endif
                                </div>
                            </div>
                        </div>
                    @endforeach

                    <div class="mt-3">
                        {{ $applications->links('pagination::bootstrap-5') }}
                    </div>
                </div>
            </div>

        </div>
    </div>
@endsection

@push('scripts')
@endpush
