<div class="modal-header">
    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                aria-hidden="true">&times;</span></button>
    <h4 class="modal-title" id="myModalLabel">
        {{ __('Product') }} <span style="font-size: 1rem;">{{ $product ? $product->name : ''}}</span></h4>

</div>
<form action="{{route('products.update', [optional($product)->external_id])}}" method="POST">
<div class="modal-body">
    <div class="row">
        <div class="col-lg-6">
            <div class="form-group col-lg-12 removeleft">
                <label for="name" class="thin-weight">@lang('Name')</label>
                <input type="text" name="name" class="form-control input-sm" value="{{ optional($product)->name }}">
            </div>
            <div class="form-group col-lg-12 removeleft" >
                <label for="source" class="thin-weight">@lang('Description')</label>
                <textarea name="description" id="description" class="form-control">{{optional($product)->description}}</textarea>
            </div>
            <div class="form-group col-lg-12 removeleft">
                <label for="price" class="thin-weight">@lang('Product number')</label>
                <input type="text" name="product_number" class="form-control" value="{{ optional($product)->number}}">
            </div>
            <div class="form-group col-lg-12 removeleft">
                <label for="type" class="control-label thin-weight">{{trans('Type')}}</label>
                <select name="type"  class="type form-control">
                    <option value="pieces" {{optional($product)->default_type == 'pieces' ? 'selected' : ''}}>{{trans('pieces')}}</option>
                    <option value="meters" {{optional($product)->default_type == 'meters' ? 'selected' : ''}}>{{trans('meters')}}</option>
                    <option value="kilometer" {{optional($product)->default_type == 'kilometer' ? 'selected' : ''}}>{{trans('kilometer')}}</option>
                    <option value="kg" {{optional($product)->default_type == 'kg' ? 'selected' : ''}}>{{trans('kg')}}</option>
                    <option value="package" {{optional($product)->default_type == 'package' ? 'selected' : ''}}>{{trans('package')}}</option>
                    <option value="boxes" {{optional($product)->default_type == 'boxes' ? 'selected' : ''}}>{{trans('boxes')}}</option>
                </select>
            </div>
            <div class="form-group col-lg-12 removeleft">
                <label for="price" class="thin-weight">@lang('Price')</label>
                <input type="number" name="price" step=".01" class="form-control" placeholder="example 300" value="{{ optional($product)->price}}">
            </div>
            <div class="form-group col-lg-12 removeleft">
                <label for="joint" class="thin-weight">@lang('Joint WIDTH')</label>
                <input type="number" name="joint" class="form-control" value="{{ optional($product)->joint_width}}">
            </div>
        </div>
        <div class="col-lg-6">
            <div class="form-group col-lg-12 removeleft">
                <label for="visible" class="thin-weight">@lang('Visible Surface')</label>
                <input type="number" name="visible" class="form-control" value="{{ optional($product)->visible_surface}}">
            </div>
            <div class="form-group col-lg-12 removeleft">
                <label for="profile" class="thin-weight">@lang('Profile Height')</label>
                <input type="number" name="profile" class="form-control" value="{{ optional($product)->profile_height}}">
            </div>
            <div class="form-group col-lg-12 removeleft">
                <label for="totalWidth" class="thin-weight">@lang('Total Width')</label>
                <input type="number" name="totalWidth" class="form-control" value="{{ optional($product)->total_width}}">
            </div>
            <div class="form-group col-lg-12 removeleft">
                <label for="surface" class="thin-weight">@lang('Surface')</label>
                <input type="text" name="surface" class="form-control" value="{{ optional($product)->surface}}">
            </div>
            <div class="form-group col-lg-12 removeleft">
                <label for="movement" class="thin-weight">@lang('Movement Capacity')</label>
                <input type="number" name="movement" class="form-control" value="{{ optional($product)->movement_capacity}}">
            </div>
            <div class="form-group col-lg-12 removeleft">
                <label for="loadCapacity" class="thin-weight">@lang('Load Capacity')</label>
                <input type="text" name="loadCapacity" class="form-control" value="{{ optional($product)->load_capacity}}">
            </div>
        </div>
        {{csrf_field()}}
    </div>
</div>
<div class="modal-footer">
    <button type="button" class="btn btn-default col-lg-6"
            data-dismiss="modal">{{ __('Close') }}</button>
    <div class="col-lg-6">
        <input type="submit" value="{{__('Submit')}}" class="btn btn-brand form-control closebtn">
    </div>
</div>
</form>

@push('scripts')
    <script>

        $('#payment_date').pickadate({
            hiddenName:true,
            format: "{{frontendDate()}}",
            formatSubmit: 'yyyy/mm/dd',
            closeOnClear: false,
        });
    </script>
@endpush
