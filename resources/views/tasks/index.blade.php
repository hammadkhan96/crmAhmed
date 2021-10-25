@extends('layouts.master')
@section('heading')
    {{ __('All tasks')}}
@stop

@section('content')

    <div class="row mb-4" style="margin-bottom: 2%;">
        <div class="col-sm-4">
            <fieldset class="form-group">
                <select name="user_id" id="user_id" class="form-control select2">
                <option value="" selected>Select User</option>
                    @foreach($users as $user)
                        <option value="{{$user->id}}">{{$user->name}}</option>
                    @endforeach
                </select>
            </fieldset>
        </div>
        <div class="col-sm-4">

            <div class="form-group ">
                <input type="text" name="date_from"
                       class="form-control pickadate bg-primary border-primary white rounded-right"
                       id="date_from" placeholder="Date (From)">
            </div>
        </div>
        <div class="col-sm-3">
            <div class="form-group ">

                <input type="text" name="date_to"
                       class="form-control pickadate bg-primary border-primary white rounded-right"
                       id="date_to" placeholder="Date (To)">
            </div>

        </div>
        <div class="col-3">
            <button type="button" id="search_filter_btn" class="mr-1 mb-1 btn btn btn-brand"> Search</button>
        </div>
    </div>
    <table class="table table-hover" id="tasks-table">
        <thead>
        <tr>

            <th>{{ __('Title') }}</th>
            <th>{{ __('Description') }}</th>
            <th>{{ __('Client') }}</th>
            <th>{{ __('Deadline') }}</th>
            <th>{{ __('Created at') }}</th>
            <th>{{ __('Assigned') }}</th>
            <th>
                <select name="status_id" id="status-task" class="table-status-input">
                    <option value="" disabled>{{ __('Status') }}</option>
                    @foreach($statuses as $status)
                        <option class="table-status-input-option" {{ $status->title == 'Open' ? 'selected' : ''}} value="{{$status->title}}">{{$status->title}}</option>
                    @endforeach
                    <option value="all">All</option>
                </select>
            </th>
        </tr>
        </thead>
    </table>

    <!-- DELETE MODAL SECTION -->
    <div id="deletion" class="modal fade" role="dialog">
        <div class="modal-dialog ">
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
                            <input type="checkbox" name="delete_invoice"> @lang('Delete invoice')
                        </label>
                        <p>
                            @lang('If the invoice is not deleted it will be attached to the client, without a reference to the task').
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
    <!-- END OF THE DELETE MODAL SECTION -->
@stop

@push('scripts')
    <style type="text/css">
    /* thead, th {text-align: center;} */
        .table > tbody > tr > td {
            border-top:none !important;
            /* word-wrap: break-word; */
           word-break : break-word;
        }
        .table-actions {
            opacity: 0;
        }
        #tasks-table tbody tr:hover .table-actions{
            opacity: 1;
        }
        /* .title-table-tab {
            width:260px;
        }
        .client-table-tab {
            width:220px;
        }
         .title-table-description{
            width:220px;
        } */
      

    </style>
    <script>
        $(function () {
            var table = $('#tasks-table').DataTable({
                processing: true,
                serverSide: true,
                autoWidth: false,
                // scrollX:true,
                "ordering": false,
                // responsive: true,
                dom: 'Bfrtip',
                /*    buttons: [
                        'excel', 'pdf',
                    ],*/
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
                            title: 'Task List',
                        },
                        {
                            //PDF
                            extend: 'pdf',
                            text: '<i class="fa fa-file-pdf-o"></i> PDF',
                            title: 'Task List',
                        },
                    ]
                },
                ajax:{
                    url: '{{ route('tasks.data') }}',
                    data: function (d) {
                        d.user_id = $('#user_id').val();
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
                },
                columns: [
                    {data: 'titlelink', name: 'titlelink', class: 'title-table-tab', orderable: false,sortable:false},
                    {data: 'description', name: 'description', class: 'title-table-description'},
                    {data: 'client', name: 'c.company_name', class: 'client-table-tab'},
                    {data: 'deadline', name: 'deadline'},
                    {data: 'created_at', name: 'created_at'},
                    {data: 'user', name: 'u.name'},
                    {data: 'status', name: 's.title', orderable: false},
                    {data: 'view', name: 'view', orderable: false, searchable: false, class: 'table-actions'},
                ],
            //     columnDefs: [
            //     {
            //         render: function (data, type, full, meta) {
            //             return "<div class='text-wrap width-200' id='description_div'>" + data + "</div>";
            //         },
            //         targets: 1
            //     }
            //  ]
            });
            table.columns(6).search('^' + 'Open' + '$', true, false).draw();
            $('#status-task').change(function () {
                selected = $("#status-task option:selected").val();
                if (selected == "all") {
                    table.columns(6).search('').draw();
                } else {
                    table.columns(6).search(selected ? '^' + selected + '$' : '', true, false).draw();
                }
            });

            $('#search_filter_btn').on('click',function(){
                table.draw();
            });

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


        $( '#deletion' ).on( 'show.bs.modal', function (e) {
            var target = e.relatedTarget;
            var id = $(target).data('id');
            var title = $(target).data('title');

            $("#deletion-title").text(title);
            $('#deletion-form').attr('action', id)

        });
    </script>
@endpush