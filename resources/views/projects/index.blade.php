@extends('layouts.master')
@section('heading')
    {{ __('All projects')}}
@stop

@section('content')
    <div class="row mb-4 justify-content-center" style="margin-bottom: 2%; margin-top: 2%;">
        <div class="col-sm-5">
            <div class="form-group">
                <input type="text" name="date_from"
                       class="form-control pickadate bg-primary border-primary white rounded-right"
                       id="date_from" placeholder="Date (From)">
            </div>
        </div>
        <div class="col-sm-5">
            <div class="form-group">

                <input type="text" name="date_to"
                       class="form-control pickadate bg-primary border-primary white rounded-right"
                       id="date_to" placeholder="Date (To)">
            </div>

        </div>
        <div class="col-4">
            <button type="button" id="search_filter_btn" class="mr-1 mb-1 btn btn btn-brand"> Search</button>
        </div>
    </div>
    
    <table class="table table-hover" id="projects-table" width="100%">
        <thead>
        <tr>

            <th>{{ __('Title') }}</th>
            <th>{{ __('Description') }}</th>
            <th>{{ __('Client') }}</th>
            <th>{{ __('Location') }}</th>
            <th>{{ __('Deadline') }}</th>
            <th>{{ __('Created at') }}</th>
            <th>{{ __('Created By') }}</th>
            <th>{{ __('Assigned') }}</th>
            <th>
                <select name="status_id" id="status-task" class="table-status-input">
                    <option value="" disabled>{{ __('Project Status') }}</option>
                    @foreach($statuses as $status)
                        <option class="table-status-input-option" {{ $status->title == 'Open' ? 'selected' : ''}} value="{{$status->title}}">{{$status->title}}</option>
                    @endforeach
                    <option value="all">@lang('All')</option>
                </select>
            </th>
            <th>{{ __('Quotation Date') }}</th>
            <th>
                <select name="status_id" id="status-qoutation" class="table-status-input">
                    <option value="" disabled>{{ __('Quotation Status') }}</option>
                    @foreach($invoice_status as $status)
                        <option class="table-status-input-option" {{ $status->title == 'All' ? 'selected' : ''}} value="{{$status->title}}">{{$status->title}}</option>
                    @endforeach
                    <option value="all">@lang('All')</option>
                </select>
            </th>
            <th>{{ __('Invoice Date') }}</th>
            <th>
                <select name="invoice_status_id" id="status-invoice" class="table-status-input">
                    <option value="" disabled>{{ __('Invoice Status') }}</option>
                    @foreach($invoice_status as $status)
                        <option class="table-status-input-option" {{ $status->title == 'All' ? 'selected' : ''}} value="{{$status->title}}">{{$status->title}}</option>
                    @endforeach
                    <option value="all">@lang('All')</option>
                </select>
            </th>
           <th class="view">{{ __('Qoutation') }}</th>
            <th class="view">{{ __('Invoice') }}</th>
            <th class="action-header"></th>
            <th class="action-header"></th>
        </tr>
        </thead>
    </table>


    <!-- DELETE MODAL SECTION -->
    <div id="deletion" class="modal fade" role="dialog">
        <div class="modal-dialog">
            <!-- Modal content-->
            <div class="modal-content">
                <form method="POST" id="deletion-form">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title">@lang('Deletion of ') <span id="deletion-title"></span></h4>
                    </div>
                    <div class="modal-body">

                        @method('delete')
                        @csrf
                        <label style="font-weight: 300; color:#333; font-size:14px;">
                            <input type="checkbox" name="delete_tasks"> @lang('Delete tasks')
                        </label>
                        <p>
                            @lang('If the tasks are not deleted, they will be attached to the client, without a reference to the project').
                        </p>
                        <p>
                            @lang('Keep in mind, every document, activity, appointment, and comment related will be deleted as well').
                        </p>
                        <p>
                            @lang('Once deleted, it is not possible to restore it. Are you sure?')
                        </p>

                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-default" data-dismiss="modal">@lang('Cancel')</button>
                        <input type="submit" class="btn btn-brand" value="{{__('Delete')}}">
                    </div>
                </form>
            </div>
        </div>
    </div>
    <!-- END OF THE EDIT MODAL SECTION -->
@stop

@push('scripts')
    <link href="{{ URL::asset('css/buttons.min.css') }}" rel="stylesheet" type="text/css">

    <style type="text/css">
    .scrolledTable{ overflow-y: auto; clear:both; }
        .table > tbody > tr > td {
            border-top:none !important;
        }
        .table-actions {
            opacity: 0;
        }
        #projects-table tbody tr:hover .table-actions{
            opacity: 1;
        }
        .title-table-tab {
            width:260px;
        }
        .client-table-tab {
            width:220px;
        }
    </style>
    <script type="text/javascript" src="{{ URL::asset('js/buttons.server-side.js') }}"></script>
    <script>
        $(function () {
            var table = $('#projects-table').DataTable({
                order : [5,'desc'],
               
                dom: 'Bfrtip',
                buttons: {
                    dom: {
                        button: {
                            className: 'btn btn-pill btn-primary'
                        }
                    },
                    buttons: [
                        {
                            //EXCEL
                            extend: 'excelHtml5',
                            text: '<i class="fa fa-file-excel-o"></i> EXCEL', //u can define a diferent text or icon
                            title: 'Project List',
                            customize: function (xlsx) {
                              var sheet = xlsx.xl.worksheets['sheet1.xml'];

                             $('c[r=I2] t', sheet).text('Status');
                             },
                            exportOptions: {
                                columns: ':not(.action-header,.view)',
                               
                            },
                        },
                        {
                            //PDF
                            extend: 'pdfHtml5',
                            text: '<i class="fa fa-file-pdf-o"></i> PDF',
                            title: 'Project List',
                            orientation: 'landscape',
                            pageSize: 'LEGAL',
                            exportOptions: {
                                columns: ':not(.action-header,.view)'
                            },
                        }   
                    ]
                },
                // scrollX : true,
                processing: true,
                serverSide: true,
                autoWidth: false,
                ajax:{
                    url: '{{ route('projects.index.data') }}',
                    data: function (d) {
                        d.status = $('#search_status').val();
                        d.date_from = $('input[name="date_from"]').val();
                        d.date_to = $('input[name="date_to"]').val();
                    }
                },
                language: {
                    url: '{{ asset('lang/' . (in_array(\Lang::locale(), ['dk', 'en']) ? \Lang::locale() : 'en') . '/datatable.json') }}'
                },
                drawCallback: function(){
                    var length_select = $(".dataTables_length");
                    var select = $(".dataTables_length").find("select");
                    select.addClass("tablet__select");
                    $('#projects-table').wrap("<div class='scrolledTable'></div>");
                    
                },
                columns: [
                    {data: 'titlelink', name: 'title', class: 'title-table-tab'},
                    {data: 'description', name: 'projects.description', class: 'title-table-tab'},
                    {data: 'client', name: 'c.company_name', class: 'client-table-tab'},
                    {data: 'location', name: 'projects.location', class: 'client-table-tab'},
                    {data: 'deadline', name: 'projects.deadline'},
                    {data: 'created_at', name: 'projects.created_at'},
                    {data: 'created_by', name: 'ui.name'},
                    {data: 'user_assigned', name: 'u.name'},
                    {data: 'status', name: 's.title', orderable: false},
                    {data: 'qoutation_date', name: 'projects.qoutation_date', orderable: false},
                    {data: 'qoutation_status', name: 'si.title', orderable: false},
                    {data: 'invoice_date', name: 'projects.invoice_date', orderable: false},
                    {data: 'invoice_status', name: 'is.title', orderable: false},
                    {data: 'qoutation', name: 'qoutation', orderable: false},
                    {data: 'invoice', name: 'invoice', orderable: false},
                    {data: 'view', name: 'view', orderable: false, searchable: false, class: 'table-actions'},
                ]
            });
            table.columns(8).search('^' + 'Open' + '$', true, false).draw();
            $('#status-task').change(function () {
                selected = $("#status-task option:selected").val();
                if (selected == "all") {
                    table.columns(8).search('').draw();
                } else {
                    table.columns(8).search(selected ? '^' + selected + '$' : '', true, false).draw();
                }
            });
            table.columns(10).search('^' + 'Approved' + '$', true, false).draw();
            $('#status-qoutation').change(function () {
                selected = $("#status-qoutation option:selected").val();
                if (selected == "all") {
                    table.columns(10).search('').draw();
                } else {
                    table.columns(10).search(selected ? '^' + selected + '$' : '', true, false).draw();
                }
            });
            table.columns(12).search('^' + 'Approved' + '$', true, false).draw();
            $('#status-invoice').change(function () {
                selected = $("#status-invoice option:selected").val();
                if (selected == "all") {
                    table.columns(12).search('').draw();
                } else {
                    table.columns(12).search(selected ? '^' + selected + '$' : '', true, false).draw();
                }
            });
            $('#search_filter_btn').on('click',function(){
                table.draw();
            });
        });
        $( '#deletion' ).on( 'show.bs.modal', function (e) {
            var target = e.relatedTarget;
            var id = $(target).data('id');
            var title = $(target).data('title');
            $("#deletion-title").text(title);
            $('#deletion-form').attr('action', id)
        });
        $('#date_from').pickadate({
            hiddenName:true,
            format: "{{frontendDate()}}",
            formatSubmit: 'yyyy/mm/dd',
            closeOnClear: false,
        });
        $('#date_to').pickadate({
            hiddenName:true,
            format: "{{frontendDate()}}",
            formatSubmit: 'yyyy/mm/dd',
            closeOnClear: false,
        });
    </script>
@endpush