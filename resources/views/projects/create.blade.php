@extends('layouts.master')
@section('heading')
    {{__('Create project')}} <span class="small">{{$client ? '(' . $client->company_name . ')': ''}}</span>
@stop

@section('content')

   {{-- <div class="row">--}}
        <form action="{{route('projects.store')}}" method="POST" id="createProjectForm" enctype="multipart/form-data">
            {{csrf_field()}}
            <div class="row" style="background-color: #ffffff">
                <div class="tablet">
                    <div class="tablet__body">
                            <div class="form-group">
                                <label for="title" class="control-label thin-weight">@lang('Title')</label>
                                <input type="text" name="title" id="title" class="form-control">
                            </div>
                            <div class="form-group">
                                <label for="description" class="control-label thin-weight">@lang('Description')</label>
                                <textarea name="description" id="description" cols="50" rows="10" class="form-control"></textarea>
                            </div>
                    </div>
                </div>
                @if(Entrust::can('project-upload-files') && $filesystem_integration)
                    <div class="tablet">
                        <div class="tablet__body">
                                <label class="control-label">@lang('Files')</label>
                                <div class="dropzone dz-default dz-message" id="dropzone-images">
                                    <span>@lang('Drop files here or click to upload')</span>
                                </div>

                        </div>
                    </div>
                @endif
            </div>
            <div class="row" style="background-color: #ffffff">
                {{--<div class="tablet">
                    <div class="tablet__body">--}}
                <div class="col-sm-4">
                    <div class="form-group">
                        <label for="user_assigned_id" class="control-label thin-weight">@lang('Assign user')</label>
                        <select name="user_assigned_id" id="user_assigned_id" class="form-control">
                            @foreach($users as $user => $userK)
                                <option value="{{$user}}">{{$userK}}</option>
                            @endforeach
                        </select>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="form-group">
                        @if(Request::get('client') != "" || $client)
                            <input type="hidden" name="client_external_id" value="{!! Request::get('client') ?: $client->external_id !!}">
                        @else
                            <label for="client_external_id" class="control-label thin-weight">@lang('Assign client')</label>
                            <select
                                    name="client_external_id"
                                    id="client_external_id"
                                    data-container="body"
                                    data-live-search="true"
                                    data-style-base="form-control"
                                    data-style=""
                                    data-width="100%">
                                @if($clients->isEmpty())
                                    <option value="" default></option>
                                    <option value="new_client">+ @lang('Create New Client')</option>
                                @endif
                                @foreach($clients as $client => $clientK)
                                    <option value="{{$client}}">{{$clientK}}</option>
                                @endforeach
                            </select>
                        @endif
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="form-group">
                        <label for="deadline" class="control-label thin-weight">@lang('Deadline')</label>
                        <input type="text" id="deadline" name="deadline" data-value="{{now()->addDays(3)}}" class="form-control">
                    </div>
                </div>

                <div class="col-sm-4">
                    <div class="form-group">
                        <label for="status" class="control-label thin-weight">@lang('Status')</label>
                        <select name="status_id" id="status" class="form-control">
                            @foreach($statuses as $status => $statusK)
                                <option value="{{$status}}">{{$statusK}}</option>
                            @endforeach
                        </select>
                    </div>
                </div>
              {{--  <div class="col-sm-4">
                    <div class="form-group">
                        <label for="deadline" class="control-label thin-weight">@lang('Project Manager')</label>
                        <input type="text" id="manager" name="manager"  class="form-control">
                    </div>
                </div>--}}
                <div class="col-sm-4">
                    <div class="form-group">
                        <label for="location" class="control-label thin-weight">@lang('Location')</label>
                        <input type="text" id="location" name="location"  class="form-control">
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="form-group">
                        <label for="quotation_date" class="control-label thin-weight">@lang('Quotation Date')</label>
                        <input type="text" id="quotation_date" name="quotation_date" class="form-control">
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="form-group">
                        <label for="quotation_status" class="control-label thin-weight">@lang('Quotation Status')</label>
                        <select name="qoutation_status" id="qoutation_status" class="form-control">
                            <option value=""> -- Select One --</option>
                            @foreach($invoice_status as $status)
                                <option value="{{$status->id}}">{{$status->title}}</option>
                            @endforeach
                        </select>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="form-group">
                        <label for="quotation" class="control-label thin-weight">@lang('Invoice Date')</label>
                        <input type="text" id="invoice_date" name="invoice_date"  class="form-control">
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="form-group">
                        <label for="quotation_status" class="control-label thin-weight">@lang('Invoice Status')</label>
                        <select name="invoice_status" id="invoice_status" class="form-control">
                            <option value=""> -- Select One --</option>
                            @foreach($invoice_status as $status)
                                <option value="{{$status->id}}">{{$status->title}}</option>
                            @endforeach
                        </select>
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="form-group">
                        <label for="invoice" class="control-label thin-weight">@lang('Invoice')</label>
                        <input type="file" name="invoice"  class="form-control" />
                    </div>
                </div>
                <div class="col-sm-4">
                    <div class="form-group">
                        <label for="qoutation" class="control-label thin-weight">@lang('Qoutation')</label>
                        <input type="file" name="qoutation"  class="form-control" />
                    </div>
                </div>
            </div>
            <div class="row" style="background-color: #ffffff">
                <div class="col-sm-12 text-center">
                    <div class="form-group">
                        <input type="submit" class="btn btn-md btn-brand movedown" id="createProject" value="{{__('Create project')}}">
                    </div>
                </div>
            </div>
           {{--     </div>
            </div>--}}
        </form>
{{--    </div>--}}
    <div class="alert alert-danger title-alert" style="display: none;">
        {{__("Title is required")}}
    </div>
    <div class="alert alert-danger description-alert" style="display: none;">
        {{__("Description is required")}}
    </div>
    <div class="alert alert-danger client-alert" style="display: none;">
        {{__("Client is required")}}
    </div>
@stop

@push('scripts')
    <script>
        Dropzone.autoDiscover = false;
        $(document).ready(function () {
          $('#client_external_id').on('changed.bs.select', function (e, clickedIndex, isSelected, previousValue) {
            var value = $("#client_external_id").val();
            if(value == "new_client") {
              window.location.href = "/clients/create"
            }
          });

          $('#client_external_id').selectpicker()
          $('#description').summernote({
            toolbar: [
                [ 'fontsize', [ 'fontsize' ] ],
                [ 'font', [ 'bold', 'italic', 'underline','clear'] ],
                [ 'color', [ 'color' ] ],
                [ 'para', [ 'ol', 'ul', 'paragraph'] ],
                [ 'table', [ 'table' ] ],
                [ 'insert', [ 'link'] ],
                [ 'view', [ 'fullscreen' ] ]
            ],
             height:300,
             disableDragAndDrop: true

           });
            $('#deadline').pickadate({
                hiddenName:true,
                format: "{{frontendDate()}}",
                formatSubmit: 'yyyy/mm/dd',
                closeOnClear: false,
            });
            $('#quotation_date').pickadate({
                hiddenName:true,
                format: "{{frontendDate()}}",
                formatSubmit: 'yyyy/mm/dd',
                closeOnClear: false,
            });
            $('#invoice_date').pickadate({
                hiddenName:true,
                format: "{{frontendDate()}}",
                formatSubmit: 'yyyy/mm/dd',
                closeOnClear: false,
            });
            myDropzone = null;
         /*   @if(Entrust::can('project-upload-files') && $filesystem_integration)
            var myDropzone = new Dropzone("#createProjectForm", {
                autoProcessQueue: false,
                uploadMultiple: true,
                parallelUploads: 5,
                maxFiles: 50,
                addRemoveLinks: true,
                previewsContainer: "#dropzone-images",
                clickable:'#dropzone-images',
                paramName: 'images',
                acceptedFiles: "image/!*,application/pdf, application/vnd.openxmlformats-officedocument.spreadsheetml.sheet, application/vnd.openxmlformats-officedocument.spreadsheetml.template, application/vnd.openxmlformats-officedocument.presentationml.template, application/vnd.openxmlformats-officedocument.presentationml.slideshow, application/vnd.openxmlformats-officedocument.presentationml.presentation, application/vnd.openxmlformats-officedocument.presentationml.slide, application/vnd.openxmlformats-officedocument.wordprocessingml.document, application/vnd.openxmlformats-officedocument.wordprocessingml.template, application/vnd.ms-excel.addin.macroEnabled.12, application/vnd.ms-excel.sheet.binary.macroEnabled.12,text/rtf,text/plain,audio/!*,video/!*,.csv,.doc,.xls,.ppt,application/vnd.ms-powerpoint,.pptx",

            });

            myDropzone.on("success", function(file, response) {
                window.location.href = ("/projects/"+response.project_external_id)
            });

            myDropzone.on("processing", function(file, response) {
                $('input[type="submit"]').attr("disabled", true);
            });
            myDropzone.on("error", function(file, response) {
                $('input[type="submit"]').attr("disabled", false);
            });

            @endif*/
          /*  $('input[type="submit"]').on("click", function (e) {
                e.preventDefault();
                e.stopPropagation();
                if (myDropzone != null && myDropzone.getQueuedFiles().length > 0) {
                    myDropzone.processQueue();

                } else {
                    $.ajax({
                        type: 'post',
                        url: '{{route('projects.store')}}',
                        data: $("#createProjectForm").serialize(),
                        success: function(response){
                            window.location.href = ("/projects/"+response.project_external_id)
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            if (jqXHR.responseJSON.errors.title != undefined) {
                                $('.title-alert').show();
                            } else {
                                $('.title-alert').hide();
                            }
                            if (jqXHR.responseJSON.errors.description != undefined) {
                                $('.description-alert').show();
                            }else {
                                $('.description-alert').hide();
                            }
                            if (jqXHR.responseJSON.errors.client_external_id != undefined) {
                                $('.client-alert').show();
                            }else {
                                $('.client-alert').hide();
                            }

                        }
                    });
                }

            });*/



        });


    </script>
@endpush
