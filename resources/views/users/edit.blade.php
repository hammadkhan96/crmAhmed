@extends('layouts.master')

@section('heading')
    {{ __('Edit user') }}
@stop

@section('content')


    {!! Form::model($user, [
            'method' => 'PATCH',
            'route' => ['users.update', $user->external_id],
            'files'=>true,
            'enctype' => 'multipart/form-data'
            ]) !!}
            {!! Form::close() !!}
            <form   action="{{route('users.update', [$user->external_id])}}"
                    method="POST"
                    enctype="multipart/form-data"
                    data-file="true"
            >
            @method('PATCH')
            {{csrf_field()}}
    @include('users.form', ['submitButtonText' =>  __('Update user')])
            </form>

@stop

@push('scripts')
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
@include('images._uploadAvatarPreview')
@endpush
