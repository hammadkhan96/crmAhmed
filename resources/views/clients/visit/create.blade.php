@extends('layouts.master')
@section('content')
    <h1>Create Client Visit</h1>
    <hr>
    @if(session('success'))
        <div class="alert alert-success">
            {{session('success')}}
        </div>
    @endif
    <form id="visit_form" method="post" action="{{route('clients.visit.submit')}}" novalidate="novalidate">
        @csrf
        <div class="col-sm-6">
            <div class="form-group">
                <label class="control-label thin-weight">Company Name</label>
                <input type="text" name="company" id="company" class="form-control">
            </div>
        </div>
        <div class="col-sm-6">
            <div class="form-group">
                <label class="control-label thin-weight">Email</label>
                <input type="email" name="email" id="email" class="form-control">
            </div>
        </div>

        <div class="col-sm-6">
            <div class="form-group">
                <label class="control-label thin-weight">Contact</label>
                <input type="text" name="number" id="number" class="form-control">
            </div>
        </div>

        <div class="col-sm-6">
            <div class="form-group">
                <label class="control-label thin-weight">Address</label>
                <input type="text" name="address" id="address" class="form-control">
            </div>
        </div>

        <div class="col-sm-6">
            <div class="form-group">
                <label class="control-label thin-weight">Project Category</label>
                <input type="text" name="category" id="category" class="form-control">
            </div>
        </div>

        <div class="col-sm-6">
            <div class="form-group">
                <label class="control-label thin-weight">Purpose</label>
                <input type="text" name="purpose" id="purpose" class="form-control">
            </div>
        </div>
        <div class="col-sm-6">
            <div class="form-group">
                <label class="control-label thin-weight">Time</label>
                <input type="text" name="time" id="time" class="form-control" placeholder="Select Time">
            </div>
        </div>
        <div class="col-sm-12 text-center" style="margin-top: 2%;">
            <div class="form-group">
                <input type="submit" class="btn btn-md btn-brand movedown" id="createProject" value="{{__('Create Client Visit')}}">
            </div>
        </div>
    </form>


@endsection
@push('scripts')
    <script>
        $(document).ready(function () {
            $('#visit_form #time').pickatime({
                editable: true,
                formatSubmit: 'HH:i',
            });

        });
    </script>
@endpush