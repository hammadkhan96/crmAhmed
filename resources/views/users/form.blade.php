
<div class="col-sm-3">
    <label for="name" class="base-input-label">@lang('Name')</label>
</div>
<div class="col-sm-9">
        <div class="form-group col-sm-8">
            <input type="text" name="name" class="form-control" value="{{isset($user) ? optional($user)->name : ''}}">
        </div>
</div>
<div class="col-sm-12">
    <hr>
</div>
<div class="col-sm-3">
    <label for="image_path" class="base-input-label">@lang('Image')</label>
</div>
<div class="col-sm-9">
    <div class="form-group form-inline col-sm-8">
        <div class="input-group ">
            <img id="preview_avatar" src="{{isset($user) ? optional($user)->avatar : '/images/default_avatar.jpg'}}" style="max-height: 40px; border-radius: 25px;">
        </div>
        <div id="input_avatar" class="input-group" style="margin-left: 0.7em;">
            <input type="file" name="img" id="avatar_image" onchange="loadPreview(this);">
            <span style="font-size:10px">Recommended size 300x300</span>
        </div>
        <div class="input-group" style="margin-left: 0.7em;">
            <button id="delete_avatar" type="button">remove</button>
        </div>
    </div>
</div>
<div class="col-sm-12">
    <hr>
</div>
<div class="col-sm-3">
    <label for="name" class="base-input-label">@lang('Address')</label>
</div>
<div class="col-sm-9">
    <div class="form-group col-sm-8">
        <input type="text" name="address" class="form-control" value="{{isset($user) ? optional($user)->address : ''}}">
    </div>
</div>
<div class="col-sm-12">
    <hr>
</div>
<div class="col-sm-3">
    <label for="name" class="base-input-label">@lang('Contact information')</label>
</div>
<div class="col-sm-9">
    <div class="form-group col-sm-8">
        <label for="email" class="control-label thin-weight">Email</label>
        <input type="email" name="email" class="form-control" value="{{isset($user) ? $user->email : ''}}">
    </div>
    <div class="form-group col-sm-8">
        <label for="primary_number" class="control-label thin-weight">@lang('Primary number')</label>
        <input type="number" name="primary_number" class="form-control" value="{{isset($user) ? optional($user)->primary_number : ''}}">
    </div>
    <div class="form-group col-sm-8">
        <label for="secondary_number" class="control-label thin-weight">@lang('Secondary number')</label>
        <input type="number" name="secondary_number" class="form-control" value="{{isset($user) ? optional($user)->secondary_number : ''}}">
    </div>
</div>
<div class="col-sm-12">
    <hr>
</div>

@if(isset($user))
    @if(auth()->user()->canChangePasswordOn($user))
    <div class="col-sm-3">
        <label for="name" class="base-input-label">@lang('Security')</label>
    </div>

    <div class="col-sm-9">
        <div class="form-group col-sm-8">
            <label for="password" class="control-label thin-weight">Password</label>
            <input type="password" name="password" class="form-control">
        </div>
        <div class="form-group col-sm-8">
            <label for="password_confirmation" class="control-label thin-weight">Confirm password</label>
            <input type="password" name="password_confirmation" class="form-control" >
        </div>
    </div>
    @endif
@else 
<div class="col-sm-3">
        <label for="name" class="base-input-label">@lang('Security')</label>
    </div>

    <div class="col-sm-9">
        <div class="form-group col-sm-8">
            <label for="password" class="control-label thin-weight">Password</label>
            <input type="password" name="password" class="form-control">
        </div>
        <div class="form-group col-sm-8">
            <label for="password_confirmation" class="control-label thin-weight">Confirm password</label>
            <input type="password" name="password_confirmation" class="form-control">
        </div>
    </div>
@endif
<div class="col-sm-12">
    <hr>
</div>
<div class="col-sm-3">
    <label for="name" class="base-input-label">@lang('Access')</label>
</div>
<div class="col-sm-9">
@if(auth()->user()->canChangeRole())
    <div class="form-group col-sm-8">
        <label for="roles" class="control-label thin-weight">@lang('Assign role')</label>
        <select name="roles" id="" class="form-control">
        @foreach($roles as $key => $role)
                <option {{ isset($user) && optional($user->userRole)->role_id === $key ? "selected" : "" }} value="{{$key}}">{{$role}}</option>
        @endforeach
        </select>
    </div>
@endif
    <div class="form-group col-sm-8">
        <label for="departments" class="control-label thin-weight">@lang('Assign department')</label>
        <select name="departments" id="" class="form-control">
            @foreach($departments as $key => $department)
                <option {{ isset($user) && $user->department->first()->id === $key ? "selected" : "" }} value="{{$key}}">{{$department}}</option>
            @endforeach
        </select>
    </div>
    <div class="form-group col-sm-8">
        <label for="departments" class="control-label thin-weight">@lang('Employee Number')</label>
        <input type="text" name="employee_number" class="form-control" value="{{isset($user) ? optional($user)->employee_number : ''}}">
    </div>
    <div class="form-group col-sm-8">
        <label for="departments" class="control-label thin-weight">@lang('Branch')</label>
        <input type="text" name="branch" class="form-control" value="{{isset($user) ? optional($user)->branch : ''}}">
    </div>
    <div class="form-group col-sm-8">
        <label for="status" class="control-label thin-weight">@lang('Status')</label>
        <select name="status_id" id="" class="form-control">
        @foreach($status as $key => $st)
            <option {{ isset($user) && $user->status_id === $key ? "selected" : "" }} value="{{$key}}">{{$st}}</option>
        @endforeach
        </select>
    </div>
</div>
<div class="col-sm-12">
    <hr>
</div>
<div class="col-sm-3">
    <label for="name" class="base-input-label">@lang('Settings')</label>
</div>
<div class="col-sm-9">
    <div class="form-group col-sm-8">
        <label for="language" class="control-label thin-weight">@lang('Language')</label> <br>
        <label class="radio-inline">
            <input value="dk" type="radio" name="language" {{isset($user) && strtolower($user->language) == "dk" ? 'checked': ''}}>@lang('Danish')
        </label>
        <label class="radio-inline">
            <input value="en" type="radio" name="language" {{isset($user) && strtolower($user->language) == "en" ? 'checked': ''}}>@lang('English')
        </label>
        <label class="radio-inline">
            <input value="es" type="radio" name="language" {{isset($user) && strtolower($user->language) == "es" ? 'checked': ''}}>@lang('Spanish')
        </label>
    </div>
</div>
<div class="col-sm-12">
    <hr>
</div>
<div class="col-sm-3">
    <label for="name" class="base-input-label">@lang('Add Documents')</label>
</div>
<div class="sm-9">
    <div class="col-sm-8">
        <table class="table table-bordered" id="dynamic_field">
            <tr>
                <td><input type="file" name="document[0]"  class="form-control document" /></td>
                <td><button type="button" name="add" id="add" class="btn btn-success">Add More</button></td>
            </tr>
        </table>
    </div>
</div>
<div class="col-lg-12 text-center">
    <input type="submit" value="{{$submitButtonText}}" class="btn btn-md btn-brand">
</div>