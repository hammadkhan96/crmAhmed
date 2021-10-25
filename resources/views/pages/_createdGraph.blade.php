<div class="tablet">
    <div class="tablet__head">
        <div class="tablet__head-label">
            <h3 class="tablet__head-title">{{ __('Follow-Ups') }}</h3>
        </div>
    </div>
    <div class="tablet__body">
        <div class="tablet__items">
           {{-- <graphline class="chart" :datasheet="{{json_encode($datasheet)}}"></graphline>--}}
            <div class="row text-center" id="follow_up">
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
        </div>
    </div>
    <div class="tablet__footer">

    </div>
</div>
