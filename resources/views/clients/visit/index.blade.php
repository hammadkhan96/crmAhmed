@extends('layouts.master')
@section('heading')
    {{ __('All Clients Visit')}}
@stop
@section('content')
    <div class="row mt-4 justify-content-center">
        <div class="col-sm-4 col-md-4">
            <div class="form-group ">
                <input type="text" name="date_from"
                       class="form-control pickadate bg-primary border-primary white rounded-right"
                       id="date_from" placeholder="Date (From)">
            </div>
        </div>
        <div class="col-sm-4 col-md-4 text-center">
            <div class="form-group ">

                <input type="text" name="date_to"
                       class="form-control pickadate bg-primary border-primary white rounded-right"
                       id="date_to" placeholder="Date (To)">
            </div>

        </div>
        <div class="col-sm-4  col-md-4">
            <button type="button" id="search_filter_btn" class="mr-1 mb-1 btn btn btn-brand"> Search</button>
        </div>
    </div>
    <table class="table table-hover mt-4" id="clients-visit-table">
        <thead>
        <tr>

            <!-- <th>{{ __('S.No.') }}</th> -->
            <th>{{ __('Company Name') }}</th>
            <th>{{ __('Address') }}</th>
            <th>{{ __('Project Category') }}</th>
            <th>{{ __('Purpose') }}</th>
            <th>{{ __('Contact') }}</th>
            <th>{{ __('Email') }}</th>
            <th>{{ __('Visited By') }}</th>
            <th>{{ __('Time') }}</th>
            <th>{{ __('Created At') }}</th>
            {{-- <th>
                 <select name="status_id" id="status-task" class="table-status-input">
                     <option value="" disabled>{{ __('Status') }}</option>
                     @foreach($statuses as $status)
                         <option class="table-status-input-option" {{ $status->title == 'Open' ? 'selected' : ''}} value="{{$status->title}}">{{$status->title}}</option>
                     @endforeach
                     <option value="all">@lang('All')</option>
                 </select>
             </th>--}}
        </tr>
        </thead>
    </table>

    <!-- DELETE MODAL SECTION -->
    {{-- <div id="deletion" class="modal fade" role="dialog">
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
     </div>--}}
    <!-- END OF THE EDIT MODAL SECTION -->
@stop
@push('scripts')
    <style type="text/css">
        .table > tbody > tr > td {
            border-top:none !important;
        }
        .table-actions {
            opacity: 0;
        }
        #clients-visit-table tbody tr:hover .table-actions{
            opacity: 1;
        }
        .title-table-tab {
            width:260px;
        }
        .client-table-tab {
            width:220px;
        }
    </style>
    <script>
        $(function () {
            var table = $('#clients-visit-table').DataTable({
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
                            title: 'All Client Visit List',
                        },
                        {
                            //PDF
                            extend: 'pdf',
                            text: '<i class="fa fa-file-pdf-o"></i> PDF',
                            title: 'All Client Visit List',
                            orientation: 'landscape',
                            pageSize: 'LEGAL'
                        },
                    ]
                },
                scrollX : true,
                order : [8,'desc'],
                processing: true,
                serverSide: true,
                autoWidth: false,
                // responsive : true,
                ajax:{
                    url: '{{ route('client_visit.list') }}',
                    data: function (d) {
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
                    // {data: 'id', name: 'client_visits.id'},
                    {data: 'company_name', name: 'client_visits.company_name',searchable:true},
                    {data: 'address', name: 'client_visits.address'},
                    {data: 'project_category', name: 'client_visits.project_category'},
                    {data: 'purpose', name: 'client_visits.purpose'},
                    {data: 'contact', name: 'client_visits.contact'},
                    {data: 'email', name: 'client_visits.email'},
                    {data: 'name', name: 'u.name'},
                    {data: 'time', name: 'client_visits.time'},
                    {data: 'created_at', name: 'created_at'},
                    //{data: 'view', name: 'view', orderable: false, searchable: false, class: 'table-actions'},
                ]
            });
            /*table.columns(5).search('^' + 'Open' + '$', true, false).draw();
            $('#status-task').change(function () {
                selected = $("#status-task option:selected").val();
                if (selected == "all") {
                    table.columns(5).search('').draw();
                } else {
                    table.columns(5).search(selected ? '^' + selected + '$' : '', true, false).draw();
                }
            });*/

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

            $('#sample_submit').on('click',function(){
                $('#sample_form').submit();
            });

            $('#search_filter_btn').on('click',function(){
                table.draw();
            });
        });
        /* $( '#deletion' ).on( 'show.bs.modal', function (e) {
             var target = e.relatedTarget;
             var id = $(target).data('id');
             var title = $(target).data('title');

             $("#deletion-title").text(title);
             $('#deletion-form').attr('action', id)

         });*/
    </script>
@endpush
