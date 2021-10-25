@extends('layouts.master')
@section('heading')
    {{ __('All Clients') }}
@stop

@section('content')

    <table class="table table-hover" id="clients-table">
        <thead>
        <tr class="text-center">
            <!-- <th>{{ __('S.No.') }}</th> -->
            <th>{{ __('Company') }}</th>
            <th>{{ __('Address') }}</th>
            <th>{{ __('Assigned To') }}</th>
            <th>{{ __('Contact') }}</th>
            <th>{{ __('Email') }}</th>
            <th>{{ __('Category') }}</th>
            <th>
                <select name="status_id" id="status-client" class="table-status-input">
                    <option value="" disabled>{{ __('Status') }}</option>
                    @foreach($statuses as $status)
                        <option class="table-status-input-option" {{ $status->title == 'Active' ? 'selected' : ''}} value="{{$status->title}}">{{$status->title}}</option>
                    @endforeach
                    <option value="all">@lang('All')</option>
                </select>
            </th>
            <th>{{ __('Date') }}</th>
            <th class="action-header"></th>
            <th class="action-header"></th>
            <th class="action-header"></th>

        </tr>
        </thead>
    </table>
@stop

@push('scripts')
    <style type="text/css">
        .table > tbody > tr > td {
            border-top:none !important;
        }
        .table-actions {
            opacity: 0;
        }
        #clients-table tbody tr:hover .table-actions{
            opacity: 1;
        }
    </style>
    <script>
        $(function () {
           var table = $('#clients-table').DataTable({
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
                            title: 'Clients List',
                            customize: function (xlsx) {
                              var sheet = xlsx.xl.worksheets['sheet1.xml'];

                             $('c[r=G2] t', sheet).text('Status');
                             },
                            exportOptions: {
                                columns: ':not(.action-header)'
                            }
                        },
                        {
                            //PDF
                            extend: 'pdfHtml5',
                            text: '<i class="fa fa-file-pdf-o"></i> PDF',
                            title: 'Clients List',
                            orientation: 'landscape',
                            pageSize: 'LEGAL',
                            exportOptions: {
                                columns: ':not(.action-header)',
                                format: {
                                header: function ( data, columnIdx ) {
                                return columnIdx === 6 ? "Status" : data;
                                }
                                }
                            }
                        },
                    ]
                },
                scrollX : true,
                processing: true,
                serverSide: true,
                ajax: '{!! route('clients.data') !!}',
                language: {
                    url: '{{ asset('lang/' . (in_array(\Lang::locale(), ['dk', 'en']) ? \Lang::locale() : 'en') . '/datatable.json') }}'
                },
                name:'search',
                drawCallback: function(){
                    var length_select = $(".dataTables_length");
                    var select = $(".dataTables_length").find("select");
                    select.addClass("tablet__select");
                },
                autoWidth: false,
                columns: [
                    // {data: 'id', name: 'id'},
                    {data: 'company_name', name: 'company_name'},
                    {data: 'address', name: 'address'},
                    {data: 'user', name: 'u.name'},
                    {data: 'number', name: 'c.primary_number'},
                    {data: 'email', name: 'c.email'},
                    {data: 'category', name: 'clients.category'},
                    {data: 'status', name: 's.title', orderable: false},
                    {data: 'date', name: 'date'},

                    { data: 'view', name: 'view', orderable: false, searchable: false, class:'fit-action-delete-th table-actions'},

                        @if(Entrust::can('client-update'))
                    { data: 'edit', name: 'edit', orderable: false, searchable: false, class:'fit-action-delete-th table-actions'},
                        @endif
                        @if(Entrust::can('client-delete'))
                    { data: 'delete', name: 'delete', orderable: false, searchable: false, class:'fit-action-delete-th table-actions'},
                    @endif

                ]
            });
            table.columns(6).search('^' + 'Active' + '$', true, false).draw();
            $('#status-client').change(function () {
                selected = $("#status-client option:selected").val();
                if (selected == "all") {
                    table.columns(6).search('').draw();
                } else {
                    table.columns(6).search(selected ? '^' + selected + '$' : '', true, false).draw();
                }
            });

        });
        $(document).ready(function () {
            if(!getCookie("step_client_index")) {
                var canCreateTask = '{{ auth()->user()->can('task-create') }}';
                var canCreateProject = '{{ auth()->user()->can('project-create') }}';

                $("#projects").addClass("in");
                $("#tasks").addClass("in");
                // Instance the tour
                var tour = new Tour({
                    storage: false,
                    backdrop: true,
                });
                tour.addStep({
                    element: "#clients-table",
                    title: "{{trans("Client overview")}}",
                    content: "{{trans("All your active clients will be shown here")}}",
                    placement: 'top'
                })
                if(canCreateTask) {
                    tour.addStep( {
                        element: "#newTask",
                        title: "{{trans("Create task")}}",
                        content: "{{trans("Same as with clients you can create a new task. Tasks has a primary user assigned, and a client, it can also be related to a project")}}"
                    })
                }
                if (canCreateProject) {
                    tour.addStep({
                        element: "#newProject",
                        title: "{{trans("Create project")}}",
                        content: "{{trans("Projects are used to keep track of tasks that might be related to a bigger assignment for the client. And gives the possibility of multiple people working various tasks and keep track of the tasks.")}}",
                    })
                }
                // Initialize the tour
                tour.init();

                tour.start();
                setCookie("step_client_index", true, 1000)
            }
            function setCookie(key, value, expiry) {
                var expires = new Date();
                expires.setTime(expires.getTime() + (expiry * 24 * 60 * 60 * 2000));
                document.cookie = key + '=' + value + ';expires=' + expires.toUTCString();
            }

            function getCookie(key) {
                var keyValue = document.cookie.match('(^|;) ?' + key + '=([^;]*)(;|$)');
                return keyValue ? keyValue[2] : null;
            }
        });
    </script>
@endpush


