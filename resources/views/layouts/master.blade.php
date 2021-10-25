<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>CRM</title>
    <link href="{{ URL::asset('css/jasny-bootstrap.css') }}" rel="stylesheet" type="text/css">
    <link href="{{ URL::asset('css/font-awesome.min.css') }}" rel="stylesheet" type="text/css">
    <link href="{{ URL::asset('css/dropzone.css') }}" rel="stylesheet" type="text/css">
    <link href="{{ URL::asset('css/jquery.atwho.min.css') }}" rel="stylesheet" type="text/css">
    <link href="{{ URL::asset('css/fonts/flaticon.css') }}" rel="stylesheet" type="text/css">
    <link href="{{ URL::asset('css/bootstrap-tour-standalone.min.css') }}" rel="stylesheet" type="text/css">
    <link href="{{ URL::asset('css/picker.classic.css') }}" rel="stylesheet" type="text/css">
    <link href="{{ URL::asset('css/buttons.min.css') }}" rel="stylesheet" type="text/css">
    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/v/dt/jszip-2.5.0/dt-1.11.2/af-2.3.7/b-2.0.0/b-colvis-2.0.0/b-html5-2.0.0/b-print-2.0.0/cr-1.5.4/date-1.1.1/fc-3.3.3/fh-3.1.9/kt-2.6.4/r-2.2.9/rg-1.1.3/rr-1.2.8/sc-2.0.5/sb-1.2.1/sp-1.4.0/sl-1.3.3/datatables.min.css"/>



    <link rel="stylesheet" href="https://unpkg.com/vis-timeline@7.3.4/styles/vis-timeline-graph2d.min.css">
    <link rel="stylesheet" href="{{ asset(elixir('css/vendor.css')) }}">
    <link rel="stylesheet" href="{{ asset(elixir('css/app.css')) }}">
    <link href="https://unpkg.com/ionicons@4.5.5/dist/css/ionicons.min.css" rel="stylesheet">
    <meta name="csrf-token" content="{{ csrf_token() }}"/>
    <link rel="stylesheet" href="{{ asset(elixir('css/bootstrap-select.min.css')) }}">
    <link href="{{ URL::asset('css/summernote.css') }}" rel="stylesheet">
    <link rel="shortcut icon" href="{{{ asset('images/favicon.png') }}}">
    <script>
        var DayByDay =  {
            csrfToken: "{{csrf_token()}}",
            stripeKey: "{{config('services.stripe.key')}}"
        }
    </script>
<?php if(isDemo()) { ?>
<!-- Global site tag (gtag.js) - Google Analytics -->
    <script async src="https://www.googletagmanager.com/gtag/js?id=UA-152899919-3"></script>
    <script>
        window.dataLayer = window.dataLayer || [];
        function gtag(){dataLayer.push(arguments);}
        gtag('js', new Date());

        gtag('config', 'UA-152899919-3');
    </script>
    <?php } ?>
    <script src="https://js.stripe.com/v3/"></script>
    @stack('style')
</head>
<body>

<div id="wrapper">

@include('layouts._navbar')
<!-- /#sidebar-wrapper -->
    <!-- Sidebar menu -->

    <nav id="myNavmenu" class="navmenu navmenu-default navmenu-fixed-left offcanvas-sm" role="navigation">
        <div class="list-group panel">
            <p class=" list-group-item siderbar-top" title=""><img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRGx9gSwOq5DUGW4KDR5f-_SK7rSH0HGR5qDA&usqp=CAU" alt="" style="width: 100%; margin: 1em 0;"></p>
            <a href="{{route('dashboard')}}" class=" list-group-item" data-parent="#MainMenu"><i
                        class="fa fa-home sidebar-icon"></i><span id="menu-txt">{{ __('Dashboard') }} </span></a>

            



            <a href="{{route('users.show', \Auth::user()->external_id)}}" class=" list-group-item"
               data-parent="#MainMenu"><i
                        class="fa fa-user sidebar-icon"></i><span id="menu-txt">{{ __('Profile') }}</span> </a>

                        <a href="{{route('sample_view')}}" class=" list-group-item" data-parent="#MainMenu"><i
                        class="fa fa-adjust sidebar-icon"></i><span id="menu-txt">{{ __('Sample Record') }} </span></a>

            <a href="#clients" class=" list-group-item" data-toggle="collapse" data-parent="#MainMenu"><i
                        class="fa fa-user-secret sidebar-icon"></i><span id="menu-txt">{{ __('Clients') }}</span>
                <i class="icon ion-md-arrow-dropup arrow-side sidebar-arrow"></i></a>
            <div class="collapse" id="clients">

                <a href="{{ route('clients.index')}}" class="list-group-item childlist"> <i
                            class="bullet-point"><span></span></i> {{ __('All Clients') }}</a>
                @if(Entrust::can('client-create'))
                    <a href="{{ route('clients.create')}}" id="newClient"
                       class="list-group-item childlist"> <i
                                class="bullet-point"><span></span></i> {{ __('New Client') }}</a>
                @endif

                <a href="{{ route('client_visit')}}" id="clientVisit"
                   class="list-group-item childlist"> <i
                            class="bullet-point"><span></span></i> {{ __('All Client Visit') }}</a>


                <a href="{{ route('clients.visit.create')}}" id="createClientVisit"
                   class="list-group-item childlist"> <i
                            class="bullet-point"><span></span></i> {{ __('Create Client Visit') }}</a>
            </div>

            <a href="#projects" class="list-group-item" data-toggle="collapse" data-parent="#MainMenu"><i
                        class="fa fa-briefcase sidebar-icon "></i><span id="menu-txt">{{ __('Projects') }}</span>
                <i class="icon ion-md-arrow-dropup arrow-side sidebar-arrow"></i></a>
            <div class="collapse" id="projects">
                <a href="{{ route('projects.index')}}" class="list-group-item childlist"> <i
                            class="bullet-point"><span></span></i> {{ __('All Projects') }}</a>
                @if(Entrust::can('project-create'))
                    <a href="{{ route('projects.create')}}" id="newProject"  class="list-group-item childlist"> <i
                                class="bullet-point"><span></span></i> {{ __('New Project') }}</a>
                @endif
            </div>
            <a href="#tasks" class="list-group-item" data-toggle="collapse" data-parent="#MainMenu"><i
                        class="fa fa-tasks sidebar-icon "></i><span id="menu-txt">{{ __('Tasks') }}</span>
                <i class="icon ion-md-arrow-dropup arrow-side sidebar-arrow"></i></a>
            <div class="collapse" id="tasks">
                <a href="{{ route('tasks.index')}}" class="list-group-item childlist"> <i
                            class="bullet-point"><span></span></i> {{ __('All Tasks') }}</a>
                @if(Entrust::can('task-create'))
                    <a href="{{ route('tasks.create')}}" id="newTask" class="list-group-item childlist"> <i
                                class="bullet-point"><span></span></i> {{ __('New Task') }}</a>
                @endif
            </div>

            <a href="#user" class=" list-group-item" data-toggle="collapse" data-parent="#MainMenu"><i
                        class="fa fa-users sidebar-icon"></i><span id="menu-txt">{{ __('Users') }}</span>
                <i class="icon ion-md-arrow-dropup arrow-side sidebar-arrow"></i></a>
            <div class="collapse" id="user">
                <a href="{{ route('users.index')}}" class="list-group-item childlist"> <i
                            class="bullet-point"><span></span></i> {{ __('All Users') }}</a>
                @if(Entrust::can('user-create'))
                    <a href="{{ route('users.create')}}"
                       class="list-group-item childlist"> <i class="bullet-point"><span></span></i> {{ __('New User') }}
                    </a>
                @endif
            </div>

            <a href="#leads" class=" list-group-item" data-toggle="collapse" data-parent="#MainMenu"><i
                        class="fa fa-hourglass-2 sidebar-icon"></i><span id="menu-txt">{{ __('Follow-Ups') }}</span>
                <i class="icon ion-md-arrow-dropup arrow-side sidebar-arrow"></i></a>
            <div class="collapse" id="leads">
                <a href="{{ route('leads.index')}}" class="list-group-item childlist"> <i
                            class="bullet-point"><span></span></i> {{ __('All Follow-Ups') }}</a>
                @if(Entrust::can('lead-create'))
                    <a href="{{ route('leads.create')}}"
                       class="list-group-item childlist"> <i class="bullet-point"><span></span></i> {{ __('New Follow-Ups') }}
                    </a>
                @endif
            </div>
            <a href="#sales" class=" list-group-item" data-toggle="collapse" data-parent="#MainMenu"><i
                 class="fa fa-dollar sidebar-icon"></i><span id="menu-txt">{{ __('Inventory & POS') }}</span>
                 <i class="icon ion-md-arrow-dropup arrow-side sidebar-arrow"></i></a>
             <div class="collapse" id="sales">
             <!-- <a href="{{ route('invoices.overdue')}}" class="list-group-item childlist">
                 <i class="bullet-point"><span></span></i> {{ __('Overdue') }}
             </a> -->
             <a href="{{ route('products.index')}}" class="list-group-item childlist">
                 <i class="bullet-point"><span></span></i> {{ __('Products') }}
             </a>
             <a href="{{ route('stockIn.index')}}" class="list-group-item childlist">
                 <i class="bullet-point"><span></span></i> {{ __('Stock-In') }}
             </a>
             <a href="{{ route('stockout.index')}}" class="list-group-item childlist">
                 <i class="bullet-point"><span></span></i> {{ __('Stock-Out') }}
             </a>
             </div>

            @if(Entrust::can('calendar-view'))
                  <a href="#appointments" class="list-group-item" data-toggle="collapse" data-parent="#MainMenu"><i
                              class="fa fa-calendar sidebar-icon"></i><span id="menu-txt">{{ __('Appointments') }}</span>
                      <i class="icon ion-md-arrow-dropup arrow-side sidebar-arrow"></i></a>
                  <div class="collapse" id="appointments">
                      <a href="{{ route('appointments.calendar')}}" target="_blank"
                         class="list-group-item childlist"> <i
                                  class="bullet-point"><span></span></i> {{ __('Calendar') }}</a>
                  </div>
              @endif
            <a href="#hr" class=" list-group-item" data-toggle="collapse" data-parent="#MainMenu"><i
                        class="fa fa-handshake-o sidebar-icon"></i><span id="menu-txt">{{ __('HR') }}</span>
                <i class="icon ion-md-arrow-dropup arrow-side sidebar-arrow"></i></a>
            <div class="collapse" id="hr">
                @if(Entrust::can('absence-view'))
                    <a href="{{ route('absence.index')}}"
                       class="list-group-item childlist"> <i
                                class="bullet-point"><span></span></i> {{ __('Absence overview') }}</a>
                @endif
                @if(Entrust::can('absence-manage'))
                    <a href="{{ route('absence.create', ['management' => 'true'])}}"
                       class="list-group-item childlist"> <i
                                class="bullet-point"><span></span></i> {{ __('Register absence') }}</a>
                @endif
                <a href="{{ route('departments.index')}}"
                   class="list-group-item childlist"> <i
                            class="bullet-point"><span></span></i> {{ __('Departments') }}</a>
            </div>

            @if(Entrust::hasRole('administrator') || Entrust::hasRole('owner'))
                <a href="#settings" class=" list-group-item" data-toggle="collapse" data-parent="#MainMenu"><i
                            class="fa fa-cog sidebar-icon"></i><span id="menu-txt">{{ __('Settings') }}</span>
                    <i class="icon ion-md-arrow-dropup arrow-side sidebar-arrow"></i></a>
                <div class="collapse" id="settings">
                    <a href="{{ route('settings.index')}}"
                       class="list-group-item childlist"> <i
                                class="bullet-point"><span></span></i> {{ __('Overall Settings') }}</a>

                    <a href="{{ route('roles.index')}}"
                       class="list-group-item childlist"> <i
                                class="bullet-point"><span></span></i> {{ __('Role & Permissions Management') }}</a>
                    <a href="{{ route('integrations.index')}}"
                       class="list-group-item childlist"> <i
                                class="bullet-point"><span></span></i> {{ __('Integrations') }}</a>
                </div>
            @endif
        </div>
    </nav>


    <!-- Page Content -->
    <div id="page-content-wrapper">
        <div class="container-fluid">
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="global-heading">@yield('heading')</h1>
                    @yield('content')
                </div>
            </div>
        </div>
        @if($errors->any())
            <div class="alert alert-danger">
                @foreach($errors->all() as $error)
                    <p>{{ $error }}</p>
                @endforeach
            </div>

        @endif
        @if(Session::has('flash_message_warning'))

            <message message="{{ Session::get('flash_message_warning') }}" type="warning"></message>
        @endif
        @if(Session::has('flash_message'))
            <message message="{{ Session::get('flash_message') }}" type="success"></message>
        @endif
    </div>

    <!-- /#page-content-wrapper -->
</div>
<script src="/js/manifest.js"></script>
<script src="/js/vendor.js"></script>
<script type="text/javascript" src="{{ URL::asset('js/app.js') }}"></script>
<script type="text/javascript" src="{{ URL::asset('js/dropzone.js') }}"></script>
{{--<script type="text/javascript" src="{{ URL::asset('js/jquery.dataTables.min.js') }}"></script>--}}
{{--<script type="text/javascript" src="{{ URL::asset('js/buttons.server-side.js') }}"></script>--}}
<script type="text/javascript" src="{{ URL::asset('js/jasny-bootstrap.min.js') }}"></script>
<script type="text/javascript" src="{{ URL::asset('js/jquery.caret.min.js') }}"></script>
<script type="text/javascript" src="{{ URL::asset('js/jquery.atwho.min.js') }}"></script>
<script type="text/javascript" src="{{ URL::asset('js/summernote.min.js') }}"></script>
<script type="text/javascript" src="{{ URL::asset('js/jquery-ui-sortable.min.js') }}"></script>
<script type="text/javascript" src="{{ URL::asset('js/bootstrap-tour-standalone.min.js') }}"></script>
<script type="text/javascript" src="{{ URL::asset('js/picker.js') }}"></script>

<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/pdfmake.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/pdfmake/0.1.36/vfs_fonts.js"></script>
<script type="text/javascript" src="https://cdn.datatables.net/v/dt/jszip-2.5.0/dt-1.11.2/af-2.3.7/b-2.0.0/b-colvis-2.0.0/b-html5-2.0.0/b-print-2.0.0/cr-1.5.4/date-1.1.1/fc-3.3.3/fh-3.1.9/kt-2.6.4/r-2.2.9/rg-1.1.3/rr-1.2.8/sc-2.0.5/sb-1.2.1/sp-1.4.0/sl-1.3.3/datatables.min.js"></script>


@if(App::getLocale() == "dk")
    <script>
        $(document).ready(function () {
            $.extend( $.fn.pickadate.defaults, {
                monthsFull: [ 'januar', 'februar', 'marts', 'april', 'maj', 'juni', 'juli', 'august', 'september', 'oktober', 'november', 'december' ],
                monthsShort: [ 'jan', 'feb', 'mar', 'apr', 'maj', 'jun', 'jul', 'aug', 'sep', 'okt', 'nov', 'dec' ],
                weekdaysFull: [ 'søndag', 'mandag', 'tirsdag', 'onsdag', 'torsdag', 'fredag', 'lørdag' ],
                weekdaysShort: [ 'søn', 'man', 'tir', 'ons', 'tor', 'fre', 'lør' ],
                today: 'i dag',
                clear: 'slet',
                close: 'luk',
                firstDay: 1,
                format: 'd. mmmm yyyy',
                formatSubmit: 'yyyy/mm/dd'
            });
        });
    </script>
@endif
@stack('scripts')
<script>
    window.trans = <?php
    // copy all translations from /resources/lang/CURRENT_LOCALE/* to global JS variable
    try {
        $filename = File::get(resource_path() . '/lang/' . App::getLocale() . '.json');
    } catch (\Illuminate\Contracts\Filesystem\FileNotFoundException $e) {
        return;
    }
    $trans = [];
    $entries = json_decode($filename, true);
    foreach ($entries as $k => $v) {
        $trans[$k] = trans($v);
    }
    $trans[$filename] = trans($filename);
    echo json_encode($trans);
    ?>;
</script>
</body>

</html>
