@extends('layouts.master')
@section('heading')
    {{ __('Create user') }}
@stop

@section('content')
    @include('errors.messages')
    {!! Form::open([
            'route' => 'users.store',
            'files'=>true,
            'enctype' => 'multipart/form-data'

            ]) !!}
    @include('users.form', ['submitButtonText' => __('Create user')])

    {!! Form::close() !!}


@stop

@push('scripts')
@include('images._uploadAvatarPreview')
    <script>
        $(document).ready(function(){

            var i=1;

            $('#add').click(function(){
            i++;
            var id = i-1;
            $('#dynamic_field').append('<tr id="row'+i+'" class="dynamic-added"><td><input type="file" name="document['+id+']"  class="form-control document" /></td><td><button type="button" name="remove" id="'+i+'" class="btn btn-danger btn_remove">X</button></td></tr>');
            });


            $(document).on('click', '.btn_remove', function(){
            var button_id = $(this).attr("id");
            $('#row'+button_id+'').remove();
            });

        });
    </script>
@endpush