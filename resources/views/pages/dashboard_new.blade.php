@extends('layouts.master')

@section('content')
    <div class="row text-center" id="follow_up">
        <hr>
        <h2>Follow-Ups</h2>
        <hr>
        <div class="col-sm-12">
            <table class="table table-hover" id="follow-ups-table">
                <thead>
                <tr>
                    <th class="text-center">{{ __('Title') }}</th>
                    <th class="text-center">{{ __('Description') }}</th>
                    <th class="text-center">{{ __('Status') }}</th>
                    <th class="text-center">{{ __('Deadline') }}</th>
                </tr>
                </thead>
            </table>
        </div>
    </div>
    <div class="row text-center" id="notifications">
        <hr>
        <h2>Notifications</h2>
        <hr>
        <div class="col-sm-12">
            <table class="table table-hover" id="notifications-table">
               {{-- <thead>
                <tr>
                    <th class="text-center">{{ __('Title') }}</th>
                </tr>
                </thead>--}}
                <tbody>
                @foreach($notifications as $notification)
                    <tr class="bg-white">
                        <td><a href="{{$notification['data']['url']}}" onclick="{{route('notification.read')}}">{{$notification['data']['message']}}</a></td>
                    </tr>
                    @endforeach
                </tbody>
            </table>
        </div>
    </div>

    <hr>
    <h2 class="text-center mb-4">Sample Data</h2>
    <hr>
    <div class="row mb-4 justify-content-center" style="margin-bottom: 5%; margin-top: 2%;">
        <div class="col-sm-3">
            <fieldset class="form-group">
                 <select name="search_status" id="search_status" class="form-control select2">
                      <option value="" selected>Select Status</option>
                      <option value="1">Received</option>
                      <option value="2">Not Received</option>
                   </select>
            </fieldset>
        </div>
        <div class="col-sm-3">

            <div class="form-group">
                <input type="text" name="date_from"
                       class="form-control pickadate bg-primary border-primary white rounded-right"
                       id="date_from" placeholder="Date (From)">
            </div>
        </div>
        <div class="col-sm-3">
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
    <div class="row text-center mt-4" id="sample_data_div">
        <div class="col-sm-12">
            <table class="table table-hover" id="sample-data-table" style=" overflow:auto; width:100%;position:relative;">
                <thead>
                <tr>
                    <th>{{ __('S.No.') }}</th>
                    <th>{{ __('Company') }}</th>
                    <th>{{ __('Project') }}</th>
                    <th>{{ __('Contact Person') }}</th>
                    <th>{{ __('Issue Date') }}</th>
                    <th>{{ __('Status') }}</th>
                    <th>{{ __('Sample') }}</th>
                    <th>{{ __('Quantity') }}</th>
                    <th>{{ __('Created At') }}</th>
                </tr>
                </thead>
            </table>
        </div>
    </div>

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
                                 {{-- <input type="text" name="status_id" id="status_d" class="form-control">--}}
                                  <select name="status_id" id="status_id" class="form-control select2">
                                      <option value="1">Received</option>
                                      <option value="2">Not Received</option>
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
        .orange{
            background-color: orange;
        }
        #follow_up{
            height:100px;
        }
        table.dataTable tbody td {
            white-space: nowrap;
        }
    </style>
    <script>
        $(function () {

            setTimeout(function(){
            var table = $('#follow-ups-table').DataTable({
               /* dom: 'Bfrtip',
                buttons: [
                    'copy', 'excel', 'pdf'
                ],*/

                processing: true,
                serverSide: true,
                autoWidth: false,
                scrollY:        '20vh',
                paging:         false,
                searching: false,
                order: [['3','desc']],
                ajax: '{!! route('dashboard.followups') !!}',
                language: {
                    url: '{{ asset('lang/' . (in_array(\Lang::locale(), ['dk', 'en']) ? \Lang::locale() : 'en') . '/datatable.json') }}'
                },
                drawCallback: function(){
                    var length_select = $(".dataTables_length");
                    var select = $(".dataTables_length").find("select");
                    select.addClass("tablet__select");
                },
                columns: [
                    {data: 'title', name: 'leads.title', class: 'title-table-tab text-center'},
                    {data: 'description', name: 'leads.description', class: 'description-table-tab text-center'},
                    {data: 'status', name: 's.title', class: 'description-table-tab text-center'},
                    {data: 'deadline', name: 'leads.deadline', class: 'description-table-tab text-center'},
                ]
            });
            },5000);

            setTimeout(function(){

                var table2 = $('#sample-data-table').DataTable({
                    dom: 'Bfrtip',
                    buttons: [
                        /* 'copy', 'excel', 'pdf'*/
                        {
                            text: 'Add New',
                            action: function () {
                                $('#SampleModal').modal('show');
                            }
                        }
                    ],
                    processing: true,
                    serverSide: true,
                    autoWidth: false,
                    scrollY: '20vh',
                    paging:false,
                    /*  responsive: true,*/
                    order: [['4','desc']],

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
                        {data: 'id', name: 'id'},
                        {data: 'company', name: 'company'},
                        {data: 'project', name: 'project'},
                        {data: 'contact_person', name: 'contact_person'},
                        {data: 'issue_date', name: 'issue_date'},
                        {data: 'status_id', name: 'status_id'},
                        {data: 'sample', name: 'sample'},
                        {data: 'quantity', name: 'quantity'},
                        {data: 'created_at', name: 'created_at'},
                    ]

                });
                $('#search_filter_btn').on('click',function(){
                    table2.draw();
                });
            },5000);


        /* var table3 = $('#notifications-table').DataTable({

                processing: true,
                serverSide: true,
                autoWidth: false,
                scrollX:true,
                scrollY: '20vh',
                scrollCollapse: true,
                paging:false,
                ajax:{
                    url: '{{ route('dashboard.notifications') }}',

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
                    {data: 'title', name: 'title'},
                ]
            });*/

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



        });
    </script>
@endpush