@extends('layouts.master')
@section('heading')
    {{ __('All users') }}
@stop

@section('content')

    <table class="table table-hover" id="users-table">
        <thead>
        <tr>
            {{-- <th>{{ __('S.No.') }}</th>--}}
            <th>{{ __('Name') }}</th>
            <th>{{ __('Mail') }}</th>
            <th>{{ __('Contact') }}</th>
            <th>{{ __('Employee number') }}</th>
            <th>{{ __('Branch') }}</th>
            <th>
                <select name="status_id" id="status-user" class="table-status-input">
                    <option value="" disabled>{{ __('Status') }}</option>
                    @foreach($statuses as $status)
                        <option class="table-status-input-option" {{ $status->title == 'Active' ? 'selected' : ''}} value="{{$status->title}}">{{$status->title}}</option>
                    @endforeach
                    <option value="all">@lang('All')</option>
                </select>
            </th>
            <th class="action-header">{{ __('Documents') }}</th>
            <th class="action-header"></th>
            <th class="action-header"></th>
        
        </tr>
        </thead>
    </table>


    <div class="modal fade" id="myModal" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header" style="padding:35px 50px;">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4><span class="ion ion-md-lock" style="margin-right: 1em;"></span> Handle deletion of user</h4>
                </div>
                <div class="modal-body" style="padding:40px 50px;">
                    <form role="form">

                        <!--HANDLE TASKS-->
                        <div class="form-group">
                            <label for="tasks"><span class=""></span> {{ __('How to handle the user tasks?') }}</label>
                            <select name="handle_tasks" id="handle_tasks" class="form-control">
                                <option value="delete_all_tasks">{{ __('Delete all tasks') }}</option>
                                <option value="move_all_tasks"> {{ __('Move all tasks') }}</option>
                            </select>
                        </div>
                        <div class="form-group" id="assign_tasks" style="display:none">
                            <label for="user_tasks"><span class="glyphicon glyphicon-user"></span> {{ __('Choose a new user to assign the tasks') }}</label>
                            <select name="user_tasks" id="user_tasks" class="form-control">
                                <option value="null" disabled selected> {{ __('Select a user') }} </option>
                                @foreach ($users as $user)
                                    <option value="{{ $user->id }}">{{ $user->name }}</option>
                                @endforeach
                            </select>
                        </div>

                        <!--HANDLE LEADS-->
                        <div class="form-group">
                            <label for="handle_leads"><span class=""></span> {{ __('How to handle the user leads?') }}</label>
                            <select name="leads" id="handle_leads" class="form-control">
                                <option value="delete_all_leads">{{ __('Delete all leads') }}</option>
                                <option value="move_all_leads"> {{ __('Move all leads') }}</option>
                            </select>
                        </div>
                        <div class="form-group" id="assign_leads" style="display:none">
                            <label for="user_leads"><span class="glyphicon glyphicon-user"></span> {{ __('Choose a new user to assign the leads') }}</label>
                            <select name="user_leads" id="user_leads" class="form-control">
                                <option value="null" disabled selected> {{ __('Select a user') }} </option>
                                @foreach ($users as $user)
                                    <option value="{{ $user->id }}">{{ $user->name }}</option>
                                @endforeach
                            </select>
                        </div>

                        <!--HANDLE CLIENTS-->
                        <div class="form-group">
                            <label for="handle_clients"><span class=""></span> {{ __('How to handle the user clients?') }}</label>
                            <select name="clients" id="handle_clients" class="form-control">
                                <option value="delete_all_clients">{{ __('Delete all clients') }}</option>
                                <option value="move_all_clients"> {{ __('Move all clients') }}</option>
                            </select>
                        </div>
                        <div class="form-group" id="assign_clients" style="display:none">
                            <label for="user_clients"><span class="glyphicon glyphicon-user"></span> {{ __('Choose a new user to assign the clients') }}</label>
                            <select name="user_clients" id="user_clients" class="form-control">
                                <option value="null" disabled selected> {{ __('Select a user') }} </option>
                                @foreach ($users as $user)
                                    <option value="{{ $user->id }}">{{ $user->name }}</option>
                                @endforeach
                            </select>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="submit" class="btn btn-danger" data-dismiss="modal"><span class="glyphicon glyphicon-remove"></span> {{ __('Cancel') }}</button>
                    <button type="submit" id="confirm_delete" class="btn btn-success"><span class="glyphicon glyphicon-off"></span> {{ __('Delete') }}</button>
                </div>
            </div>

        </div>
    </div>

    <div class="modal fade" id="documents_modal" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="documents_modal"
         aria-hidden="true">
        <div class="modal-dialog modal-sm" role="document">
            <div class="modal-content">
                <div class="modal-header text-center">
                    <h4 class="modal-title w-100 font-weight-bold" style="float:left;margin-left:20%;">View Documents</h4>

                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body mx-3">

                </div>
            </div>
        </div>
    </div>

    <div class="modal fade" id="error_modal" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="error_modal"
         aria-hidden="true">
        <div class="modal-dialog modal-sm" role="document">
            <div class="modal-content">
            <div class="modal-header text-center">
                    <h4 class="modal-title w-100 font-weight-bold" style="float:left;margin-left:40%;" >Error</h4>

                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body mx-3 text-center">
                    <p>No document found for this user</p>
                </div>
            </div>
        </div>
    </div>


@stop

@push('scripts')
    <style type="text/css">
        .table > tbody > tr > td {
            border-top:none !important;
        }
        .table-actions {
            opacity: 0;
        }
        #users-table tbody tr:hover .table-actions{
            opacity: 1;
        }

    </style>

    <script>
        $(function () {
            var table = $('#users-table').DataTable({
                processing: true,
                serverSide: true,
                autoWidth: false,
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
                            title: 'Users List',
                            customize: function (xlsx) {
                              var sheet = xlsx.xl.worksheets['sheet1.xml'];

                             $('c[r=F2] t', sheet).text('Status');
                             },

                            exportOptions: {
                                columns: ':not(.action-header)'
                            }
                        },
                        {
                            //PDF
                            extend: 'pdf',
                            text: '<i class="fa fa-file-pdf-o"></i> PDF',
                            title: 'Users List',
                            
                            exportOptions: {
                                columns: ':not(.action-header)',
                                format: {
                                header: function ( data, columnIdx ) {
                                return columnIdx === 5 ? "Status" : data;
                                }
                                }
                            },
                            pageSize: 'LEGAL'
                        }
                    ]
                },
                ajax: '{!! route('users.data') !!}',
                language: {
                    url: '{{ asset('lang/' . (in_array(\Lang::locale(), ['dk', 'en']) ? \Lang::locale() : 'en') . '/datatable.json') }}'
                },
                drawCallback: function(){
                    var length_select = $(".dataTables_length");
                    var select = $(".dataTables_length").find("select");
                    select.addClass("tablet__select");
                },
                columns: [
                    /*  {data: 'id', name: 'users.id'},*/
                    {data: 'namelink', name: 'users.name'},
                    {data: 'email', name: 'users.email'},
                    {data: 'primary_number', name: 'users.primary_number'},
                    {data: 'employee_number', name: 'users.employee_number'},
                    {data: 'branch', name: 'users.branch'},
                    {data: 'status', name: 's.title', orderable: false},
                    { data: 'documents', name: 'documents', orderable: false, searchable: false, class:'documents'},
                    { data: 'view', name: 'view', orderable: false, searchable: false, class:'fit-action-delete-th table-actions'},
                        @if(Entrust::can('user-update'))
                    {
                        data: 'edit', name: 'edit', orderable: false, searchable: false, class:'fit-action-delete-th table-actions'
                    },
                    @endif
                    /**  @if(Entrust::can('user-delete'))
                    {
                    data: 'delete', name: 'delete', orderable: false, searchable: false, class:'fit-action-delete-th table-actions'
                },
                     @endif**/
                ]
            });
            table.columns(5).search('^' + 'Active' + '$', true, false).draw();
            $('#status-user').change(function () {
                selected = $("#status-user option:selected").val();
                if (selected == "all") {
                    table.columns(5).search('').draw();
                } else {
                    table.columns(5).search(selected ? '^' + selected + '$' : '', true, false).draw();
                }
            });

           $('#users-table tbody').on('click', '.documents', function () {

                var email = table.row($(this).parents('tr')).data().email;
                $.ajax({
                    url: '{!! route('users.documents') !!}',
                    method: 'POST',
                    data: {
                        '_token': '{{ csrf_token() }}',
                        'email': email,
                    }
                }).done(function (data) {
                    if(data.status === 1){
                      
                       var html = '';
                        html += '<table class="table table-sm datatable text-center">';
                        html += '<thead><tr><th class="text-center">S No.</th><th class="text-center"><strong>Document</strong></th></tr></thead>';
                        html += '<tbody>';

                        $.each(data.documents, function (index, value) {
                            console.log(value.document,value);
                            var ind = index + 1;
                            html += '<tr class=""><td>' + ind + '</td>';
                            html += '<td><a class="white" href="'+value+'" target="_blank"><button type="button" class="btn btn-primary btn-sm">View</button></a></td>';

                        });
                        html += '</tbody></table>';
                        $('#documents_modal .modal-body').html(html);
                        $('#documents_modal').modal('show');

                    }
                    else{
                       $('#error_modal').modal('show');                    }
                });

            });


        });



        function openModal(client_id) {
            $("#confirm_delete").attr('delete-id', client_id);
            $("#myModal").modal();
        }

        $("#handle_tasks").click(function () {

            if($("#handle_tasks").val() == "move_all_tasks") {
                $("#assign_tasks").css('display', 'block');
            } else
            {
                $("#assign_tasks").css('display', 'none');
            }

        });


        $("#handle_clients").click(function () {

            if($("#handle_clients").val() == "move_all_clients") {
                $("#assign_clients").css('display', 'block');
            } else {
                $("#assign_clients").css('display', 'none');
            }
        });

        $("#handle_leads").click(function () {

            if($("#handle_leads").val() == "move_all_leads") {
                $("#assign_leads").css('display', 'block');
            } else {
                $("#assign_leads").css('display', 'none');
            }
        });

        $("#confirm_delete").click(function () {
            external_id = $(this).attr("delete-id");
            handle_leads = $("#handle_leads").val();
            handle_tasks =  $("#handle_tasks").val();
            handle_clients =  $("#handle_clients").val()
            leads_user = $("#user_leads").val();
            tasks_user = $("#user_tasks").val();
            clients_user = $("#user_clients").val();
            $.ajax({
                url: "/users/" + external_id,
                type: 'DELETE',
                headers: {
                    'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                },
                data: {
                    tasks: handle_tasks,
                    leads: handle_leads,
                    clients: handle_clients,
                    task_user: tasks_user,
                    lead_user: leads_user,
                    client_user: clients_user,
                },
                complete: function (jqXHR, textStatus) {
                    location.reload();
                },
                success: function (data, textStatus, jqXHR) {
                    // success callback
                },
                error: function (jqXHR, textStatus, errorThrown) {
                    // error callback
                }
            });
        });
    </script>
@endpush
