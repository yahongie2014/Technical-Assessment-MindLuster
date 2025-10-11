@extends('Master.master')

@section('content')
    <div class="col-12 col-lg-12 pt-4 pt-lg-0">
        <div class="tab-content p-2">

            <!-- Basic Bootstrap Table -->
            <div class="card p-3">
                <div class="card-header">
                    <div class="d-flex justify-content-between align-items-center">
                        <div>
                            <h5>JOBS</h5>
                        </div>
                        <div>
                            <a href="{{ route('dashboard.jobs.create') }}" class="btn btn-primary">
                                Added Job
                            </a>
                        </div>
                    </div>
                </div>
                <div class="card-body" id="postsTable">
                    <table class="table table-white table-striped">
                        <thead>
                            <tr>
                                <th scope="col">ID</th>
                                <th scope="col">Recruiter Ndame</th>
                                <th scope="col">TITLE</th>
                                <th scope="col">DESCRIPTION</th>
                                <th scope="col">ACTION</th>

                            </tr>
                        </thead>
                        <tbody>
                            @foreach ($jobs as $job)
                                <tr>
                                    <th scope="row">{{ $job->id }}</th>
                                    <td>{{ $job->recruiter->name ?? '—' }}</td>
                                    <td>{{ $job->title }}</td>
                                    <td>{{ $job->description }}</td>
                                    <td>
                                        <a href="{{ route('dashboard.jobs.edit', $job->id) }}"
                                            class="btn btn-primary">Edit</a>
                                        <form action="{{ route('dashboard.jobs.destroy', $job->id) }}" method="POST"
                                            style="display:inline;">
                                            @csrf
                                            @method('DELETE')
                                            <button type="submit" class="btn btn-danger"
                                                onclick="return confirm('Are you sure?')">Delete</button>
                                        </form>
                                    </td>
                                </tr>
                            @endforeach
                        </tbody>

                    </table>
                    {{ $jobs->links() }}
                </div>
            </div>
        </div>
    </div>
    </div>
@endsection
@push('scripts')
@endpush
