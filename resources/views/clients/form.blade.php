<div class="col-sm-3">
    <p class="calm-header">{{ __('Primary contact person')}}</p>
</div>
<div class="col-sm-9" id="primaryContact">
    <div class="form-group">
        {!! Form::label('name', __('Name'). ':', ['class' => 'control-label thin-weight']) !!}
        {!! 
            Form::text('name',  
            isset($data['owners']) ? $data['owners'][0]['name'] : null, 
            ['class' => 'form-control']) 
        !!}
    </div>
    <div class="form-group">
        {!! Form::label('email', __('Email'). ':', ['class' => 'control-label thin-weight']) !!}
        {!! 
            Form::email('email',
            isset($data['email']) ? $data['email'] : null, 
            ['class' => 'form-control']) 
        !!}
    </div>
    <div class="form-inline">
    <div class="form-group col-sm-6 removeleft">
        {!! Form::label('primary_number', __('Primary number'). ':', ['class' => 'control-label thin-weight']) !!}
        {!! 
            Form::text('primary_number',  
            isset($data['phone']) ? $data['phone'] : null, 
            ['class' => 'form-control']) 
        !!}
    </div>

    <div class="form-group col-sm-6 removeleft removeright">
        {!! Form::label('secondary_number', __('Secondary number'). ':', ['class' => 'control-label thin-weight']) !!}
        {!! 
            Form::text('secondary_number',  
            null, 
            ['class' => 'form-control']) 
        !!}
    </div>
</div>
</div>
<hr>

<div class="col-sm-3">
    <p class="calm-header">{{ __('Business information') }}</p>
</div>
<div class="col-sm-9" id="businessInfo">
    <div class="form-inline">
   {{-- <div class="form-group col-sm-6 removeleft">
        {!! Form::label('vat', __('Vat'). ':', ['class' => 'control-label thin-weight']) !!}
        {!! 
            Form::text('vat',
            isset($data['vat']) ?$data['vat'] : null,
            ['class' => 'form-control']) 
        !!}
    </div>--}}

    <div class="form-group col-sm-12 removeleft removeright">
        {!! Form::label('company_name', __('Company name'). ':', ['class' => 'control-label thin-weight']) !!}
        {!! 
            Form::text('company_name',
            isset($data['name']) ? $data['name'] : null, 
            ['class' => 'form-control']) 
        !!}
    </div>
</div>
<div class="form-group">
    {!! Form::label('address', __('Address'). ':', ['class' => 'control-label thin-weight']) !!}
    {!! 
        Form::text('address',
        isset($data['address']) ? $data['address'] : null, 
        ['class' => 'form-control'])
    !!}
</div>

<div class="form-inline">
    <div class="form-group col-sm-4 removeleft">
        {!! Form::label('Date', __('Date'). ':', ['class' => 'control-label thin-weight']) !!}
        {!! 
            Form::text('date',
             isset($data['date']) ? $data['date'] : null,
             ['class' => 'form-control','id'=>'date','placeholder' => "Select Date"])
        !!}
    </div>

    <div class="form-group col-sm-4 removeleft">
        {!! Form::label('Time', __('Time'). ':', ['class' => 'control-label thin-weight']) !!}
        {!!
            Form::text('time',
             isset($data['time']) ? $data['time'] : null,
             ['class' => 'form-control','id'=>'time','placeholder' => "Select TIme"])
        !!}
    </div>

    <div class="form-group col-sm-4 removeleft removeright">
        {!! Form::label('city', __('City'). ':', ['class' => 'control-label thin-weight']) !!}
        {!! 
            Form::text('city',
            isset($data['city']) ? $data['city'] : null,
            ['class' => 'form-control'])
        !!}
    </div>
</div>
<div class="form-group">

    {!! Form::label('purpose', __('Purpose'). ':', ['class' => 'control-label thin-weight']) !!}
    {!!
        Form::textarea('purpose',
        isset($data['purpose']) ? $data['purpose'] : null,
        ['class' => 'form-control','rows' => 4 ])
    !!}
</div>
<div class="form-group col-sm-4 removeleft">
    {!! Form::label('industry', __('Industry'). ':', ['class' => 'control-label thin-weight']) !!}
    {!!
        Form::select('industry_id',
        $industries,
        null,
        ['class' => 'form-control ui search selection top right pointing search-select',
        'id' => 'search-select'])
    !!}
</div>

<div class="form-group col-sm-4 ">
    {!! Form::label('status', __('Status'). ':', ['class' => 'control-label thin-weight']) !!}
    {!!
        Form::select('status_id',
       ['21' => 'Active', '22' => 'In-Active'],null,
        ['class' => 'form-control ui search selection top right pointing search-select',
        'id' => 'search-select'])
    !!}
</div>

<div class="form-group col-sm-4">
    {!! Form::label('Category', __('Category'). ':', ['class' => 'control-label thin-weight']) !!}
    {!!
        Form::text('category',
       isset($data['category']) ? $data['category'] : null,
        ['class' => 'form-control' ])
    !!}

</div>
</div>
<hr>
<div class="col-sm-3">
    <p class="calm-header">{{ __('Visited By') }}</p>
</div>
<div class="col-sm-9" id="assignUser">
    <div class="form-group">
        {!! Form::label('user_id', __('Visited By'). ':', ['class' => 'control-label thin-weight']) !!}
        {!! Form::select('user_id', $users, null, ['class' => 'form-control ui search selection top right pointing search-select', 'id' => 'search-select']) !!}

    </div>
</div>
<hr>
<div class="col-sm-10 text-center">
    {!! Form::submit($submitButtonText, ['class' => 'btn btn-md btn-brand', 'id' => 'submitClient']) !!}
</div>
<div class="col-sm-2">

</div>