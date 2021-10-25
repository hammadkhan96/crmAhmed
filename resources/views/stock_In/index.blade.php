@extends('layouts.master')
@section('heading')
    {{ __('All Stock-In')}}
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
    <table class="table table-hover mt-4" id="stockIn-table">
        <thead>
        <tr>
            <th>{{ __('Product Name') }}</th>
            <th>{{ __('Description') }}</th>
            <th>{{ __('Quantity') }}</th>
            <th>{{ __('Price') }}</th>
            <th>{{ __('Received From') }}</th>
            <th>{{ __('Received By') }}</th>
            <th>{{ __('Created At') }}</th>
            <th>{{ __('Actions') }}</th>
        </tr>
        </thead>
    </table>

    <div class="modal fade text-left" id="SampleModal" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="SampleModal"
         aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="myModalLabel47">Add Stock In Details</h4>
                </div>
               
                <form id="sample_form" action="{{route('stockIn.submit')}}" method="post">
                <div class="modal-body">
                
                        @csrf
                        <div class="row">
                            <input type="hidden" name="hiddenselect" id="selected2">
                        <input type="hidden" name="external_id">
                        <div class="col-sm-12">
                                <div class="form-group">
                                    <label>Product Name</label>
                                    <!--  -->
                                    <select
                                    name="product_name"
                                    id="product_name"
                                    data-container="body"
                                    data-live-search="true"
                                    data-style-base="form-control"
                                    data-style=""
                                    data-width="100%">
                                    <option value="" ></option>
                                @if($products->isEmpty())
                                    
                                    
                                @endif
                                @foreach($products as $products => $productsK)
                                
                                    <option value="{{$products}}">{{$productsK}}</option>
                                @endforeach
                                <option value="new_product">+ @lang('Create New Product')</option>
                            </select>
                                    <!--  -->
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="form-group">
                                    <label>Description</label>
                                    <input type="text" name="description" id="description" class="form-control">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="form-group">
                                    <label>Quantity</label>
                                    <input type="number" name="quantity" id="quantity" class="form-control">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="form-group">
                                    <label>Price</label>
                                    <input type="number" name="price" id="price" class="form-control">
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="form-group">
                                    <label>Received From</label>
                                    <input type="text" name="received_from" id="received_from" class="form-control">
                                </div>
                            </div>
                        </div>
                    
                </div>
                <div class="modal-footer" style="text-align: center;">
                    <button type="button" class="btn  btn-brand text-align-center" id="sample_submit">Submit</button>
                    <button type="button" class="btn btn-info text-align-center" data-dismiss="modal">Close</button>
                </div>
                </form>
            </div>
        </div>
    </div>
    @if(Entrust::can('product-delete'))
<!-- DELETE MODAL SECTION -->
<div id="deletion" class="modal fade" role="dialog">
    <div class="modal-dialog">
    <!-- Modal content-->
    <div class="modal-content">
        <form  id="deletion_record">
            <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h4 class="modal-title">@lang('Deletion of ') <span id="deletion-title" style="font-size: 1rem;"></span></h4>
            
            </div>
            <div class="modal-body">
            @lang('Are you sure you want to delete this record?')
            
            @csrf
            
            </div>
                <div class="modal-footer">
                    <input type="text" id="delete_id">
                <button type="button" class="btn btn-default" data-dismiss="modal">@lang('Cancel')</button>
                <input type="submit" class="btn btn-brand" value="{{__('Delete')}}">
                </div>
            </form>
        </div>
    </div>
</div>
@endif
<!-- END OF THE DELETE MODAL SECTION -->
@stop
@push('scripts')
<link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
 
<link href="{{ URL::asset('css/buttons.min.css') }}" rel="stylesheet" type="text/css">

    <style type="text/css">
        .table > tbody > tr > td {
            border-top:none !important;
        }
        .table-actions {
            opacity: 0;
        }
        #stockIn-table tbody tr:hover .table-actions{
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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js" integrity="sha512-AA1Bzp5Q0K1KanKKmvN/4d3IRKVlv9PYgwFPvm32nPO6QS8yH1HO7LbgB1pgiOxPtfeg5zEn2ba64MUcqJx6CA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-sweetalert/1.0.1/sweetalert.js" integrity="sha512-XVz1P4Cymt04puwm5OITPm5gylyyj5vkahvf64T8xlt/ybeTpz4oHqJVIeDtDoF5kSrXMOUmdYewE4JS/4RWAA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-sweetalert/1.0.1/sweetalert.css" integrity="sha512-f8gN/IhfI+0E9Fc/LKtjVq4ywfhYAVeMGKsECzDUHcFJ5teVwvKTqizm+5a84FINhfrgdvjX8hEJbem2io1iTA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <script>
        var table = $('#stockIn-table').DataTable({
            dom: 'Bfrtip',

            buttons: {
                dom: {
                    button: {
                        className: 'btn btn-brand'
                    }
                },
                buttons: [
                    {
                        text: 'Add Stock-In', //u can define a diferent text or icon
                        action: function () {
                            $("#product_name").select2("val", "");
                            $('#sample_form').trigger("reset");
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
                url: '{{ route('stockin.list') }}',
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
                $(".table ").css({"width":"100%"});
            },
            columns: [
                {data: 'product_name', name: 'product_name',searchable:true},
                {data: 'description', name: 'stock_ins.description'},
                {data: 'quantity', name: 'stock_ins.quantity'},
                {data: 'price', name: 'stock_ins.price'},
                {data: 'received_from', name: 'stock_ins.received_from'},
                {data: 'received_byname', name: 'received_byname'},
                {data: 'created_at', name: 'created_at'},
                {data:"actions",
                    "render": function(data, type, full, meta) {
                        console.log(full.product_id);
                        return '<button class="btn edit_stockin_btn" id="edit-stockin-btn" data-stockin_offer_external_id="'+full.external_id+'"><span class="fa fa-pencil"></span></button> <button class="btn btn-warning to_delete_record"  data-title="asd"  data-id="'+full.external_id+'"><span class="fa fa-trash"></span></button>';
                    }
                }
            ]
        });
        $('#search_filter_btn').on('click',function(){
            table.draw();
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

      
         /***********************   Edit Record   ******************************/
        $("body").on("click", ".edit_stockin_btn", function(e) {
            var product_id='asd';
            var stockinExternalId = $(this).data('stockin_offer_external_id');
            var id = $(this).attr("data-id");
            $("#myModalLabel47").html("Edit StockIn Details")
            $("input[name='id']").val(id);
            $("input").prop("disabled",false);
            $("select").prop("disabled",false);
            $("select").css("-webkit-appearance", "revert");
            $.get(" {{route('stockIn.creator','') }}/"+stockinExternalId, function(d) {$('#product_name').val(d['product_id']);$('#product_name').trigger('change');$('input[name="hiddenselect"]').val(d['product_id']);$('input[name="description"]').val(d['description']);$('input[name="quantity"]').val(d['quantity']);$('input[name="price"]').val(d['price']);$('input[name="received_from"]').val(d['received_from']);}, 'json');
             $('#SampleModal').modal({
                backdrop: 'static',
                keyboard: false
            })
         
            $('#SampleModal').modal('show');
        });
      

        $('#sample_submit').on('click',function(){
            $('#sample_form').submit();
        });
        // 
        $(document).ready(function () {
            $('#product_name').select2();
            // $('#product_name').on('changed.bs.select', function (e, clickedIndex, isSelected, previousValue) {
            //     var value = $("#product_name").val();
            //     if(value == "new_product") {
            //     window.location.href = "/products"
            //     }
            //});

            //$('#product_name').selectpicker()
        });
        // $( '#deletion' ).on( 'show.bs.modal', function (e) {
            
        //     alert('hello')

        //     console.log(id);

        //    // $("#deletion-title").text(title);

        //     $('#delete_id').val(id)

        // });
        $('#deletion_record').submit(function(e) {
            $('#deletion').modal('hide');
            e.preventDefault();
            
            var id = $('#delete_id').val();
            var urle = "{{ url('stockIn/delete/') }}"+"/"+id;
            $.ajaxSetup({
                    headers: {
                        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                    }
                });
                $.ajax({
                    url: urle,
                    type: 'DELETE',
                    dataType: 'json',
                    data: {
                        id: id
                    },
                    success: function(d) {
                        if (d.success == true) {
                            swal('Deleted!', 'record has been deleted.', 'success');
                            table.ajax.reload();
                        }
                    }
                })
            
        });
        $('body').on('click', '.to_delete_record', function(e) {
            var id=$(this).data("id");
            var urle = "{{ url('stockIn/delete/') }}"+"/"+id;
            // $('#delete_id').val(id)
            // $('#deletion').modal('show');
            swal({
                title: 'Are you sure?',
                text: "You won't be able to revert this!",
                type: 'warning',
                showCancelButton: true,
                confirmButtonClass: 'btn btn-danger',
                cancelButtonClass: 'btn btn- ml-2',
                confirmButtonText: 'Yes, delete it!',
                closeOnConfirm: true,
                closeOnCancel: false
            },function(isConfirm) {
                if (isConfirm) {
                $.ajaxSetup({
                    headers: {
                        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                    }
                });
                $.ajax({
                    url: urle,
                    type: 'DELETE',
                    dataType: 'json',
                    data: {
                        id: id
                    },
                    success: function(d) {
                        if (d.success == true) {
                            swal('Deleted!', 'record has been deleted.', 'success');
                            table.ajax.reload();
                        }
                    }
                })
            } else {
                    swal('Cancelled', 'Delete Cancelled', 'error');
                }
            })
        });
    </script>
@endpush
