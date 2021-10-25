@extends('layouts.master')
@section('heading')
    {{ __('All Stock-Out')}}
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
            <th>{{ __('Price') }}</th>
            <th>{{ __('Quantity') }}</th>
            <th>{{ __('StockOut By') }}</th>
            <th>{{ __('Description') }}</th>
            <th>{{ __('Created At') }}</th>
        </tr>
        </thead>
    </table>

    <div class="modal fade text-left" id="SampleModal" data-backdrop="static" tabindex="-1" role="dialog" aria-labelledby="SampleModal"
         aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title" id="">Add Stock Out Details</h4>
                </div>
                <div class="modal-body justify-content-center">
                    <div class="row">
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
                                    data-width="100%"
                                    required>
                                    <option value="" default></option>
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
                                    <label>Out Quantity</label>
                                    <input type="number" name="quantity" id="quantity" class="form-control" required>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="form-group">
                                    <label>Price</label>
                                    <input type="number" name="price" id="price" class="form-control" required>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="form-group">
                                    <label>Details</label>
                                    <input type="text" name="description" id="description" class="form-control" required>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-sm-12">
                                <div class="form-group">
                                    <label>Stock Out By</label>
                                    <input type="text" name="user"  value="{{auth()->user()->name}}" Readonly  class="form-control" required>
                                </div>
                            </div>
                        </div>
                        <form id="sample_form" method="post">
                            @csrf   
                            <div id="form_data_submit">

                            </div>
                        
                        </form>
                    <button id="add_to_bill" class="btn btn-success float-right"> Add </button>
                </div>
                <div class="modal-body justify-content-center">
               
                    <table class="table" id="invo_table">
                        <thead>
                            <tr>
                            <th scope="col">#</th>
                            <th scope="col">Product Name</th>
                            <th scope="col">Quantity</th>
                            <th scope="col">Price</th>
                            </tr>
                        </thead>
                        <tbody id="add_invo">
                            
                        </tbody>
                    </table>
                    
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
    <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" />
<script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script>
    <script type="text/javascript" src="{{ URL::asset('js/buttons.server-side.js') }}"></script>
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
                        text: 'Add Stock-Out', //u can define a diferent text or icon
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
                url: '{{ route('stockout.list') }}',
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
                {data: 'quantity', name: 'stock_ins.quantity'},
                {data: 'price', name: 'stock_ins.price'},
                {data: 'received_byname', name: 'received_byname'},
                {data: 'description', name: 'stock_ins.description'},
                
                {data: 'created_at', name: 'created_at'},
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

        $('#sample_submit').on('click',function(){
           var formData=$('#sample_form').serialize();
           $.ajaxSetup({
                    headers: {
                        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
                    }
                });
                $.ajax({
                    url: '{{ route('stockout.submit') }}',
                    type: 'POST',
                    dataType: 'json',
                    data: formData,
                    success: function(d) {
                        if (d.success == true) {
                            $('#add_invo').html('');
                            $('#form_data_submit').html('');
                            $('#SampleModal').modal('hide');
                            swal('Success!', 'record has been saved.', 'success');
                            table.ajax.reload();        
                        }else{
                            swal('Error!', 'Something went wrong.', 'error');
                        }
                    }
                })
           
        });
     
        $(document).ready(function () {
            $('#product_name').select2();
            // $('#product_name').on('changed.bs.select', function (e, clickedIndex, isSelected, previousValue) {
            //     var value = $("#product_name").val();
            //     if(value == "new_product") {
            //     window.location.href = "/products"
            //     }
            // });
            // $('#product_name').selectpicker()
        });
        
       
        $('body').on('click', '#add_to_bill', function(e) {
            var product_data= $("#product_name").select2('data');
            var p_name = product_data[0].text;
            var Product_id = product_data[0].id;
            var price= $("input[name='price']").val();
            var qty= $("input[name='quantity']").val();
            var description= $("input[name='description']").val();
            var rowCount = $('#invo_table tr').length;
            
            if(qty <= 0 || qty == ''){
                swal('Error!', 'Invalid Quantity', 'success');
            }else if(price <= 0 || price == '') 
            {
                swal('Error!', 'Invalid Price', 'success');
            }else{
                $("input[name='price']").val('');
                $("input[name='quantity']").val('');
                $("input[name='description']").val('');
               // $("#product_name").select2("val", "");
                $('#product_name').val(null).trigger('change');
                var cols='';
                cols += '<input type="hidden" name="product_code[]" value="'+Product_id+'"/>';
                cols += '<input type="hidden" name="product_price[]" value="' + price + '"/>';
                cols += '<input type="hidden" name="product_qty[]" value="' + qty + '"/>';
                cols += '<input type="hidden" name="product_desc[]" value="' + description + '"/>';
                var add_html='';
                add_html+='<tr><th scope="row">'+rowCount+'</th><td>'+p_name+'</td><td>'+qty+'</td><td>'+price+'</td></tr>';           
                $('#add_invo').append(add_html);
                $('#form_data_submit').append(cols);
            }
        });

       

    </script>
@endpush
