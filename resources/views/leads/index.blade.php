@extends('layouts.master')
@section('heading')
    {{__('All Follow-Ups')}}
@stop

@section('content')
    <dynamictable dateFormat="{{frontendDate()}}"></dynamictable>
@stop

