@extends('Master.master')

@section('content')
    <div class="col-12 col-lg-12 pt-4 pt-lg-0">
        <div class="tab-content p-2">
            <div class="card p-3">
                <div class="card-header">

                </div>
                <div class="card-body">
                    <form action="{{ route('dashboard.jobs.store') }}" method="POST">
                        @csrf

                        <div class="form-group mb-3">
                            <label for="title">title</label>
                            <input type="text" name="title" id="title"
                                   class="form-control @error('title') is-invalid @enderror" value="{{ old('title') }}"
                                   placeholder="title">
                            @error('title')
                            <small class="text-danger">{{ $message }}</small>
                            @enderror
                        </div>

                        <div class="form-group mb-3">
                            <label for="description">description</label>
                            <textarea name="description" id="description" rows="5"
                                      class="form-control @error('description') is-invalid @enderror"
                                      placeholder="description">{{ old('description') }}</textarea>
                            @error('description')
                            <small class="text-danger">{{ $message }}</small>
                            @enderror
                        </div>

                        <button type="submit" class="btn btn-primary">Save</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    </div>
@endsection
@push('scripts')
@endpush
