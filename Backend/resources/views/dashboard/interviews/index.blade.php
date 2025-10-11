@extends('Master.master')

@section('content')
    <div class="col-12 col-lg-12 pt-4 pt-lg-0">
        <div class="tab-content p-2">

            <!-- Basic Bootstrap Table -->
            <div class="card p-3">
                <div class="card-header">
                    <div class="d-flex justify-content-between align-items-center">
                        <div>
                            <h5>INTERVIEWS for Application #{{ $application->id }}</h5>
                            <p>Candidate: {{ $application->candidate->first_name }} | Job: {{ $application->job->title }}
                            </p>
                        </div>
                        <div>
                            <a href="{{ route('dashboard.interviews.create', $application->id) }}" class="btn btn-primary">
                                Schedule Interview
                            </a>
                        </div>
                    </div>
                </div>
                <div class="card-body" id="interviewsTable">
                    @if ($application->interviews->count())
                        <table class="table table-white table-striped">
                            <thead>
                                <tr>
                                    <th scope="col">ID</th>
                                    <th scope="col">Scheduled At</th>
                                    <th scope="col">Created At</th>
                                </tr>
                            </thead>
                            <tbody>
                                @foreach ($application->interviews as $interview)
                                    <tr>
                                        <th scope="row">{{ $interview->id }}</th>
                                        <td>{{ $interview->scheduled_at }}</td>
                                        <td>{{ $interview->created_at }}</td>
                                    </tr>
                                @endforeach
                            </tbody>
                        </table>
                    @else
                        <p>No interviews scheduled yet.</p>
                    @endif
                </div>
            </div>
        </div>
    </div>
@endsection

@push('scripts')
@endpush
