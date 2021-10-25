@extends('layouts.master')
@section('heading')
    {{ __('Sample Record Data')}}
@stop

@section('content')
    <div class="row mb-4 justify-content-center" style="margin-bottom: 1%; margin-top: 2%;">
        <!-- <div class="col-sm-4">
            <fieldset class="form-group">
                <select name="search_status" id="search_status" class="form-control select2">
                    <option value="" selected>Select Status</option>
                    <option value="1">Received</option>
                    <option value="2">Not Received</option>
                </select>
            </fieldset>
        </div> -->
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
        <div class="col-3">
            <button type="button" id="search_filter_btn" class="mr-1 mb-1 btn btn btn-brand"> Search</button>
        </div>
    </div>
    <table class="table table-hover" id="sample-data-table" style=" overflow:auto; width:100%;position:relative;">
        <thead>
        <tr>
            <!-- <th>{{ __('S.No') }}</th> -->
            <th>{{ __('Company') }}</th>
            <th>{{ __('Project') }}</th>
            <th>{{ __('Contact Person') }}</th>
            <th>{{ __('Issue Date') }}</th>
            <!-- <th>{{ __('Status') }}</th> -->
            <th>{{ __('Sample Name') }}</th>
            <th>{{ __('Quantity') }}</th>
            <th>{{ __('Created At') }}</th>
            <th>
            <select name="status_id" id="status-task" class="table-status-input">
                    <option value="" disabled>{{ __('Status') }}</option>
                    @foreach($statuses as $status)
                        <option class="table-status-input-option" {{ $status->title == 'Received' ? 'selected' : ''}} value="{{$status->title}}">{{$status->title}}</option>
                    @endforeach
                    <option value="all">All</option>
                </select>
            </th>
        </tr>
        </thead>
    </table>

    <div class="modal fade text-left" id="SampleModal" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="SampleModal"
         aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="">Add New Sample</h4>
                </div>
                <div class="modal-body">
                    <form id="sample_form" action="{{route('sampledata.submit')}}" method="post">
                        @csrf
                        <div class="row">
                            <div class="col-sm-4">
                                <div class="form-group">
                                    <label>Company Name</label>
                                    <input type="text" name="company" id="company" class="form-control">
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="form-group">
                                    <label>Project</label>
                                    <input type="text" name="project" id="project" class="form-control">
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="form-group">
                                    <label>Contact Person</label>
                                    <input type="text" name="contact_person" id="contact_person" class="form-control">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-4">
                                <div class="form-group">
                                    <label>Issue Date</label>
                                    <input type="text" name="issue_date" id="issue_date" class="form-control" placeholder="Select Date">
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="form-group">
                                    <label>Status</label>
                                
                                    <select name="status_id" id="status_id" class="form-control select2">
                                    @foreach($statuses as $status)
                                        <option class="table-status-input-option" value="{{$status->id}}">{{$status->title}}</option>
                                    @endforeach
                                    </select>
                                </div>
                            </div>
                            <div class="col-sm-4">
                                <div class="form-group">
                                    <label>Sample</label>
                                    <input type="text" name="sample" id="sample" class="form-control">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-4">
                                <div class="form-group">
                                    <label>Quantity</label>
                                    <input type="text" name="quantity" id="quantity" class="form-control">
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
                <div class="modal-footer" style="text-align: center;">
                    <button type="button" class="btn  btn-brand text-align-center" id="sample_submit">Submit</button>
                    <button type="button" class="btn btn-info text-align-center" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
@stop

@push('scripts')
    <link href="{{ URL::asset('css/buttons.min.css') }}" rel="stylesheet" type="text/css">

    <style type="text/css">
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
        var table2 = $('#sample-data-table').DataTable({
            dom: 'Bfrtip',

            buttons: {
                dom: {
                    button: {
                        className: 'btn btn-brand'
                    }
                },
                buttons: [
                    {
                        text: 'Add Sample', //u can define a diferent text or icon
                        action: function () {
                            $('#SampleModal').modal('show');
                        }
                    },

                ]
            },
            processing: true,
            serverSide: true,
            autoWidth: false,
        
            paging:false,
            /*  responsive: true,*/
            ajax:{
                url: '{{ route('dashboard.sampledata') }}',
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
                $(".table ").css({"width":"100%"});
            },
            columns: [
                // {data: 'id', name: 'id'},
                {data: 'company', name: 'sample_data.company'},
                {data: 'project', name: 'sample_data.project'},
                {data: 'contact_person', name: 'sample_data.contact_person'},
                {data: 'issue_date', name: 'sample_data.issue_date'},
                {data: 'sample', name: 'sample_data.sample'},
                {data: 'quantity', name: 'sample_data.quantity'},
                {data: 'created_at', name: 'sample_data.created_at'},
                {data: 'title', name: 's.title',orderable:false,sortable:false},
            ]

        });
        table2.columns(7).search('^' + 'Received' + '$', true, false).draw();
            $('#status-task').change(function () {
                selected = $("#status-task option:selected").val();
                if (selected == "all") {
                    table2.columns(7).search('').draw();
                } else {
                    table2.columns(7).search(selected ? '^' + selected + '$' : '', true, false).draw();
                }
            });
        $('#search_filter_btn').on('click',function(){
            table2.draw();
        });

        $('#issue_date').pickadate({
            hiddenName:true,
            format: "{{frontendDate()}}",
            formatSubmit: 'yyyy/mm/dd',
            closeOnClear: false,
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

        $('#sample_submit').on('click',function(){
            $('#sample_form').submit();
        });
    </script>
@endpush