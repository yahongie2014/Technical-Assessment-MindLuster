@extends('Master.master')

@section('content')
    <div class="col-12 col-lg-12 pt-4 pt-lg-0">
        <div class="tab-content p-2">
            <div class="card p-3">
                <div class="card-header">
                    <h5>Schedule Interview for Application #{{ $application->id }}</h5>
                    <p>Candidate: {{ $application->candidate->first_name }} | Job: {{ $application->job->title }}</p>
                </div>
                <div class="card-body">
                    <form action="{{ route('dashboard.interviews.store', $application->id) }}" method="POST">
                        @csrf
                        <div class="form-group mb-3">
                            <label for="scheduled_at">Interview Date & Time</label>
                            <input type="datetime-local" name="scheduled_at" id="scheduled_at"
                                class="form-control @error('scheduled_at') is-invalid @enderror" required>
                            @error('scheduled_at')
                                <small class="text-danger">{{ $message }}</small>
                            @enderror
                        </div>
                        <button type="submit" class="btn btn-success">Save</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
@endsection

@push('scripts')
@endpush
