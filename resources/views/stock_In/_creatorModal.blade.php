<div class="modal-header">
                    <h4 class="modal-title" id="">Add Stock In Details</h4>
                </div>
                <form id="sample_form" action="{{route('stockIn.submit')}}" method="post">
                <div class="modal-body">
                
                        @csrf
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
                                    data-width="100%">
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