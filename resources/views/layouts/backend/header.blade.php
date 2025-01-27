<!DOCTYPE html>
<html dir="ltr" lang="en">

<head>
    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <title>DMS</title>
    <meta name="csrf-token" content="{{ csrf_token() }}"> 
    <link rel="stylesheet" href="{{ url('assets/backend/assets/libs/apexcharts/dist/apexcharts.css') }}" />
    <link href="{{ url('assets/backend/assets/extra-libs/calendar/calendar.css') }}" rel="stylesheet" />
    <link href="{{ url('assets/backend/assets/libs/fullcalendar/dist/fullcalendar.min.css') }}"rel="stylesheet" />
    <link rel="canonical" href="https://www.wrappixel.com/templates/flexy-bootstrap-admin-template/" />
    <link rel="icon" type="image/png" sizes="16x16" href="{{ url('assets/backend/assets/images/favicon.png')}}" /> 
    <link rel="stylesheet" href="{{ url('assets/backend/assets/extra-libs/taskboard/css/lobilist.css') }}" />
    <link rel="stylesheet" href="{{ url('assets/backend/assets/extra-libs/taskboard/css/jquery-ui.min.css') }}" />
    <link rel="stylesheet" type="text/css" href="{{ url('assets/backend/assets/libs/bootstrap-datepicker/dist/css/bootstrap-datepicker.min.css') }}" />
    <link href="{{ url('assets/backend/dist/css/style.min.css') }}" rel="stylesheet" />
    <link href="{{ url('assets/backend/dist/css/custom.css') }}" rel="stylesheet" />
    <link rel="stylesheet" type="text/css" href="{{ url('assets/backend/assets/libs/dropzone/dist/min/dropzone.min.css')}}" />
    <link rel="stylesheet" type="text/css" href="{{ url('assets/backend/assets/libs/select2/dist/css/select2.min.css')}}" />
    <!-- <link href="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/css/select2.min.css" rel="stylesheet" /> -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" rel="stylesheet" />
    <!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/5.3.3/js/bootstrap.min.js" integrity="sha512-ykZ1QQr0Jy/4ZkvKuqWn4iF3lqPZyij9iRv6sGqLRdTPkY69YX6+7wvVGmsdBbiIfN/8OdsI7HABjvEok6ZopQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script> -->
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<style>
    .topNavbarAdd {
        display: flex;
        align-items: center;
    }
    .topNavbarAdd ul{
        list-style: none;
        display: flex;
        align-items: center;
    }
    .topNavbarAdd ul li{
        padding: 0 8px;
        border-right: 1px solid #253a76;
        margin: 0 5px;
    }
    .topNavbarAdd ul li a{
        color:#253a76;
    } 
    a.sidebar-link.waves-effect.waves-dark {
        background: none;
    }
    .iconcolortext svg{
        color:#fff !important
    }
    .iconcolortext span{
        color:#fff !important;
    }
    a.sidebar-link.has-arrow.waves-effect.waves-dark.iconcolortext.active span, a.sidebar-link.has-arrow.waves-effect.waves-dark.iconcolortext.active svg{
        color:#253a76 !important
    } 
    a.sidebar-link.has-arrow.waves-effect.waves-dark.iconcolortext:focus span, a.sidebar-link.has-arrow.waves-effect.waves-dark.iconcolortext:focus svg{
        color:#253a76 !important
    } 
    a.sidebar-link.waves-effect.waves-dark.iconcolortext.active span, a.sidebar-link.waves-effect.waves-dark.iconcolortext.active svg{
        color:#253a76 !important
    }
    .mini-sidebar .logo-icon img{
        width: 50px !important;
    }
    .logoicon{
        padding: 2rem 0 1rem 0;
    }
    .logoicon img{
        width:65%;
    } 
</style>

</head> 
<body>
    <div class="preloader">
        <svg class="tea lds-ripple" width="37" height="48" viewbox="0 0 37 48" fill="none"
            xmlns="http://www.w3.org/2000/svg">
            <path
                d="M27.0819 17H3.02508C1.91076 17 1.01376 17.9059 1.0485 19.0197C1.15761 22.5177 1.49703 29.7374 2.5 34C4.07125 40.6778 7.18553 44.8868 8.44856 46.3845C8.79051 46.79 9.29799 47 9.82843 47H20.0218C20.639 47 21.2193 46.7159 21.5659 46.2052C22.6765 44.5687 25.2312 40.4282 27.5 34C28.9757 29.8188 29.084 22.4043 29.0441 18.9156C29.0319 17.8436 28.1539 17 27.0819 17Z"
                stroke="#fec80e" stroke-width="2"></path>
            <path
                d="M29 23.5C29 23.5 34.5 20.5 35.5 25.4999C36.0986 28.4926 34.2033 31.5383 32 32.8713C29.4555 34.4108 28 34 28 34"
                stroke="#fec80e" stroke-width="2"></path>
            <path id="teabag" fill="#fec80e" fill-rule="evenodd" clip-rule="evenodd"
                d="M16 25V17H14V25H12C10.3431 25 9 26.3431 9 28V34C9 35.6569 10.3431 37 12 37H18C19.6569 37 21 35.6569 21 34V28C21 26.3431 19.6569 25 18 25H16ZM11 28C11 27.4477 11.4477 27 12 27H18C18.5523 27 19 27.4477 19 28V34C19 34.5523 18.5523 35 18 35H12C11.4477 35 11 34.5523 11 34V28Z">
            </path>
            <path id="steamL" d="M17 1C17 1 17 4.5 14 6.5C11 8.5 11 12 11 12" stroke-width="2" stroke-linecap="round"
                stroke-linejoin="round" stroke="#fec80e"></path>
            <path id="steamR" d="M21 6C21 6 21 8.22727 19 9.5C17 10.7727 17 13 17 13" stroke="#fec80e"
                stroke-width="2" stroke-linecap="round" stroke-linejoin="round"></path>
        </svg>
    </div>
    <div id="main-wrapper">
        <header class="topbar">
            <nav class="navbar top-navbar navbar-expand-md navbar-dark">
                <div class="navbar-header" style="background-color: #253a76;">
                    <a class="nav-toggler waves-effect waves-light d-block d-md-none" href="javascript:void(0)"><i class="ri-close-line ri-menu-2-line fs-6"></i></a>
                    <a class="navbar-brand" href="{{route('dashboard')}}">
                        <b class="logo-icon logoicon ">
                            <img src="{{ url('assets/backend/assets/images/logos.png') }}" alt="homepage" class="dark-logo" />
                            <img src="{{ url('assets/backend/assets/images/logos.png') }}" class="light-logo" alt="homepage" />
                        </b>
                        <!-- <span class="logo-text">
                            <img
                            src="{{ url('assets/backend/assets/images/airport_logol.png') }}"
                            alt="homepage" class="dark-logo" style="display: none;"/>
                            <img
                            src="{{ url('assets/backend/assets/images/airport_logol.png') }}"
                             class="light-logo" alt="homepage" />
                        </span> -->
                    </a>
                    <a class="topbartoggler d-block d-md-none waves-effect waves-light" href="javascript:void(0)"
                        data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                        aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation"><i
                            class="ri-more-line fs-6"></i></a>
                </div>
                <div class="navbar-collapse collapse" id="navbarSupportedContent" style="background-color: #e7e7e7" >
                    <ul class="navbar-nav me-auto d-flex justify-content-between w-100">
                        <!-- This is  -->
                       <div class="d-flex">
                        <li class="nav-item">
                            <a class="nav-link sidebartoggler d-none d-md-block" href="javascript:void(0)"><i data-feather="menu"></i></a>
                        </li>
                        <!-- search -->
                        <!-- <li class="nav-item search-box">
                            <a class="nav-link" href="javascript:void(0)">
                                <i data-feather="search"></i>
                            </a>
                            <form class="app-search position-absolute">
                                <input type="text" class="form-control border-0" placeholder="Search &amp; enter" />
                                <a class="srh-btn"><i data-feather="x-circle" class="feather-sm text-muted"></i></a>
                            </form>
                        </li> -->
                       </div>
                       <div class="topNavbarAdd">
                        <ul> 
                      
                        <li class="sidebar-item">
                            <a class="sidebar-link waves-effect waves-dark sidebar-link" href="{{route('admin.task.index')}}" aria-expanded="false">
                                <span class="hide-menu">Tasks</span>
                            </a>
                        </li> 
                        @php
                            $all_document_check = App\Models\backend\UserPermission::where('user_id', Auth::user()->id)->where('menu_id', 14)->exists();
                        @endphp
                          @if($all_document_check)
                        <li class="sidebar-item">
                            <a class="sidebar-link waves-effect waves-dark sidebar-link" href="{{route('backend.document.index')}}" aria-expanded="false">
                                <span class="hide-menu">All Document</span>
                            </a>
                        </li>
                        @endif

                        @php
                            $all_department_check = App\Models\backend\UserPermission::where('user_id', Auth::user()->id)->where('menu_id', 38)->exists();
                        @endphp
                          @if($all_department_check)
                        <li class="sidebar-item">
                            <a class="sidebar-link waves-effect waves-dark" href="{{route('backend.department.index')}}" aria-expanded="false">
                                <span class="hide-menu">Departments</span>
                            </a>
                        </li>
                        @endif
                        @if(Auth::user()->role_type_id == 1)
                        <li class="sidebar-item">
                            <a class="sidebar-link waves-effect waves-dark sidebar-link" href="{{route('backend.document_audit.index')}}"
                                aria-expanded="false"><span class="hide-menu">Document Audits</span>
                            </a>
                        </li>
                        <li class="sidebar-item">
                            <a class="sidebar-link waves-effect waves-dark sidebar-link" href="{{route('backend.login_audit.index')}}"
                                aria-expanded="false"><span class="hide-menu">Login Report</span>
                            </a>
                        </li>
                        @endif 
                    <!-- 
                        @php
                            $master_check_list_check = App\Models\backend\UserPermission::where('user_id', Auth::user()->id)->where('menu_id', 52)->exists();
                        @endphp
                          @if($master_check_list_check)
                        <li class="sidebar-item">
                            <a class="sidebar-link waves-effect waves-dark" href="{{route('backend.check_list.index')}}" aria-expanded="false">
                                <span class="hide-menu">Master Check List</span>
                            </a>
                        </li>
                        @endif -->

                        <!-- @php
                            $assigned_check_list_check = App\Models\backend\UserPermission::where('user_id', Auth::user()->id)->where('menu_id', 55)->exists();
                        @endphp
                          @if($assigned_check_list_check)
                        <li class="sidebar-item">
                            <a class="sidebar-link waves-effect waves-dark" href="{{route('backend.assigned_check_list.index')}}" aria-expanded="false">
                                <span class="hide-menu">Assigned Check List</span>
                            </a>
                        </li>
                        @endif 
                    --> 
                        </ul>
                       </div>
                    </ul>
                    <ul class="navbar-nav">

                     <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle" href="#" data-bs-toggle="dropdown"
                                aria-haspopup="true" aria-expanded="false">
                                <div class="d-flex align-items-center justify-content-center h-100">
                                    <i data-feather="bell"></i>
                                </div>
                                <div class="notify">
                                    <span class="point bg-primary"></span>
                                </div>
                            </a>
                            <div class="dropdown-menu dropdown-menu-end mailbox dropdown-menu-animate-up">
                          @php
                $notifications = App\Models\backend\Notification::where('notification_for', Auth::user()->id)->orderBy('id', 'desc')->get();
                          @endphp
                                <ul class="list-style-none">
                                    <li>
                                        <div class="rounded-top p-30 pb-2 d-flex align-items-center ">
                                            <h3 class="card-title mb-0">Notifications</h3>
                                            <!-- <span class="badge bg-warning ms-3">{{count($notifications)}} New</span> -->
                                            <span class="badge bg-warning ms-3">{{count($notifications)}}</span>
                                        </div>
                                    </li>
                                    <li class="p-30 pt-0">
                                        <div class="message-center message-body position-relative">
                                            <!-- <a href="javascript:void(0)"
                                                class="message-item px-2 d-flex align-items-center py-3">
                                                <span class="user-img position-relative d-inline-block">
                                                <i class="fa fa-comment" aria-hidden="true"></i>
                                                </span>
                                                <div class="w-75 d-inline-block v-middle ps-3 ms-1">
                                                    <h5 class="message-title mb-0 mt-1 fs-4 font-weight-medium "> Jolly completed tasks</h5>
                                                    <span class=" fs-3 text-nowrap d-block time text-truncate fw-normal mt-1 text-muted">Assign her new tasks</span>
                                                </div>
                                            </a> -->
                                            @foreach($notifications as $notification)
                                            <a href="{{$notification->url ?? '#'}}"
                                                class=" message-item px-2 d-flex align-items-center py-3">
                                                <span class="btn btn-light-danger text-danger btn-circle">
                                                {!! $notification->icon !!}
                                                </span>
                                                <div class="w-75 d-inline-block v-middle ps-3 ms-1">
                                                    <h5 class=" message-title mb-0 mt-1 fs-4 font-weight-medium ">{{$notification->title}} <span style="font-size: 12px; font-style: italic; color: gray;">{{$notification->created_at->diffForHumans()}}</span></h5>
                                                    <span class=" fs-3 text-nowrap d-block time text-truncate fw-normal mt-1 text-muted">{{$notification->notification}}</span>
                                                </div>
                                            </a>
                                            @endforeach
                                        </div>
                                        <!-- <div class="mt-4">
                                            <a class="btn btn-info text-white" href="javascript:void(0);">
                                                See all notifications
                                            </a>
                                        </div> -->
                                    </li>
                                </ul>
                            </div>
                        </li>
                        <li class="nav-item dropdown profile-dropdown">
                            <a class="nav-link dropdown-toggle d-flex align-items-center"  href="{{route('backend.user_profile.index')}}"
                                data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                @if(Auth::user()->profile_image == NULL)
                                <img src="{{url('assets/backend/assets/images/users/default_user.png')}}" alt="user" width="30" class="profile-pic rounded-circle" />
                                @else
                                <img src="{{ url('assets/backend/assets/images/upload/profile_image')}}/{{Auth::user()->profile_image}}" class="rounded-circle" height="50%" />
                                @endif

                                <div class="d-none d-md-flex">
                                    <span class="ms-2">Hi,
                                        <span class="text-dark fw-bold">{{Auth::user()->first_name.' '.Auth::user()->last_name}}</span></span>
                                    <span>
                                        <i data-feather="chevron-down" cla  ss="feather-sm"></i>
                                    </span>
                                </div>
                            </a>
                            <div class=" dropdown-menu dropdown-menu-end mailbox dropdown-menu-animate-up ">
                                <ul class="list-style-none">
                                    <li class="p-30 pb-2">
                                        <div class="rounded-top d-flex align-items-center">
                                            <h3 class="card-title mb-0">User Profile</h3>
                                            <div class="ms-auto">
                                                <a href="javascript:void(0)" class="link py-0">
                                                    <i data-feather="x-circle"></i>
                                                </a>
                                            </div>
                                        </div>
                                        <div class="d-flexalign-items-centermt-4pt-3pb-4border-bottom">
                                        @if(Auth::user()->profile_image == NULL)
                                            <img src="{{url('assets/backend/assets/images/users/default_user.png')}}" alt="user" width="90" class="rounded-circle" />
                                            @else
                                            <img src="{{ url('assets/backend/assets/images/upload/profile_image')}}/{{Auth::user()->profile_image}}" class="rounded-circle" width="30%" />
                                            @endif
                                            <div class="ms-4">
                                                <h4 class="mb-0">{{Auth::user()->first_name.' '.Auth::user()->last_name}}</h4>
                                                @php
                                                $user_role = App\Models\User::with('roleType:id,name', 'getDepartmentType')->where('id', Auth::user()->id)->first();
                                                @endphp
                                                    {{$user_role->roleType->name}}
                                                    @if($user_role->roleType->id == 2)
                                                    <p>{{$user_role->getDepartmentType?->name}}</p>
                                                    @endif
                                                <p class="text-muted mb-0 mt-1">
                                                    <i data-feather="mail" class="feather-sm me-1"></i>
                                                    {{Auth::user()->email}}
                                                </p>
                                            </div>
                                        </div>
                                    </li>
                                    <li class="p-30 pt-0">
                                        <div class="message-center message-body position-relative"
                                            style="height: 210px">
                                            <a href="{{route('backend.user_profile.index')}}"
                                                class=" message-item px-2 d-flex align-items-center border-bottom py-3">
                                                <span class="btn btn-light-info btn-rounded-lg text-info">
                                                <i class="fa fa-user" aria-hidden="true"></i>
                                                </span>
                                                <div class="w-75 d-inline-block v-middle ps-3 ms-1">
                                                    <h5 class=" message-title mb-0 mt-1 fs-4 font-weight-medium">My Profile</h5>
                                                    <span class="fs-3 text-nowrap d-block time text-truncate fw-normal mt-1 text-muted ">Account Settings</span>
                                                </div>
                                            </a>
                                        </div>
                                            @if(Auth::check())
                                                <form method="POST" action="{{ route('logout') }}">
                                                      @csrf
                                                      <div class="btn btn-info text-white">
                                                        <input type="submit" class="nav-link" value="LOGOUT" style="border:none; background:transparent">
                                                      </div>
                                                </form>
                                             @else
                                            <a class="nav-link" href="#" id="login_modal"><i class="fa-regular fa-circle-user"></i>LOGIN</a>
                                          @endif
                                          {{-- </li> --}}
                                    </li>
                                </ul>
                            </div>
                        </li>
                    </ul>
                </div>
            </nav>
        </header>
        <aside class="left-sidebar" style="background-color: #253a76;" >
            <div class="scroll-sidebar">
                <nav class="sidebar-nav my-4" >
                    <ul id="sidebarnav" style="background-color: #253a76;">
                        {{-- For Super Admin  --}}
                            {{--  @php
                                    $dashboard_check = App\Models\backend\UserPermission::where('user_id', Auth::user()->id)->where('menu_id', 1)->exists();
                                @endphp
                                @if($dashboard_check)
                        --}}
                        <li class="sidebar-item" style="background-color: #253a76;">
                            <a class="sidebar-link waves-effect waves-dark sidebar-link iconcolortext" href="{{route('dashboard')}}"
                                aria-expanded="false" style="background-color: #253a76;" >
                                <i data-feather="pie-chart"></i><span class="hide-menu">Dashboards</span>
                            </a>
                        </li>
                       {{-- @endif   --}}
 
                        <!-- @php
                            $main_category_check = App\Models\backend\UserPermission::where('user_id', Auth::user()->id)->where('menu_id', 2)->exists();
                        @endphp
                        @if($main_category_check)
                        <li class="sidebar-item">
                            <a href="{{route('backend.main_category.index')}}" class="sidebar-link  waves-effect waves-dark"><i class="ri-layout-top-2-line"></i>
                                <span class="hide-menu">All Main Category</span>
                            </a>
                        </li>
                        @endif

                        @php
                            $sub_category_check = App\Models\backend\UserPermission::where('user_id', Auth::user()->id)->where('menu_id', 8)->exists();
                        @endphp
                        @if($sub_category_check)
                        <li class="sidebar-item">
                            <a href="{{route('backend.sub_category.index')}}" class="sidebar-link  waves-effect waves-dark"><i class="ri-layout-right-2-line"></i>
                                <span class="hide-menu">All Sub Category</span>
                            </a>
                        </li>
                        @endif -->

                        @if(Auth::user()->role_type_id == 1 || Auth::user()->role_type_id == 2 || Auth::user()->role_type_id == 5)
                        <li class="sidebar-item" style="background-color: #253a76;">
                            <a class="sidebar-link waves-effect waves-dark sidebar-link iconcolortext" href="{{route('backend.user.create')}}"
                                aria-expanded="false" style="background-color: #253a76;" >
                                <i data-feather="user-check"></i><span class="hide-menu">Add User</span>
                            </a>
                        </li>
                        @endif

                        @if(Auth::user()->role_type_id == 1)
                        <li class="sidebar-item" style="background-color: #253a76;">
                            <a class="sidebar-link waves-effect waves-dark sidebar-link iconcolortext" href="{{route('backend.unit.index')}}"
                                aria-expanded="false" style="background-color: #253a76;" >
                                <i data-feather="user-check"></i><span class="hide-menu">Units</span>
                            </a>
                        </li>
                        @endif

                    @if(Auth::user()->role_type_id != 7)
                        <li class="sidebar-item">
                            <a class="sidebar-link has-arrow waves-effect waves-dark iconcolortext" href="javascript:void(0)" aria-expanded="false">
                                <i data-feather="inbox"></i><span class="hide-menu">User System</span></a>
                            <ul aria-expanded="false" class="collapse first-level" style="background-color: #253a76;">
                                @if(Auth::user()->role_type_id == 1)
                                   <li class="sidebar-item" style="background-color: #253a76;" >
                                          <a class="sidebar-link  waves-effect waves-dark iconcolortext" href="{{route('backend.head_department.index')}}" aria-expanded="false">
                                        <i data-feather="user-check"></i>
                                        <span class="hide-menu">Corporate Department</span>
                                    </a>
                                    </li>
                                @endif
                                {{-- @if(Auth::user()->role_type_id == 1 || Auth::user()->role_type_id == 2)
                                <li class="sidebar-item">
                                    <a class="sidebar-link  waves-effect waves-dark iconcolortext"href="{{route('backend.unit.index')}}" aria-expanded="false">
                                    <i data-feather="home"></i>
                                   <span class="hide-menu">Units</span>
                                    </a>
                                    </li>
                                    @endif --}}

                                    {{-- @if(Auth::user()->role_type_id == 1 || Auth::user()->role_type_id == 2 || Auth::user()->role_type_id == 3)
                                    <li class="sidebar-item">
                                    <a class="sidebar-link  waves-effect waves-dark iconcolortext" href="{{route('backend.hotel_department.index')}}" aria-expanded="false">
                                    <i data-feather="user-check"></i>
                                    <span class="hide-menu">Hotel Department</span>
                                    </a>
                                    </li> 
                                    @endif --}}

                                    @if(
                                        Auth::user()->role_type_id == 1 || Auth::user()->role_type_id == 2 ||
                                        Auth::user()->role_type_id == 3 || Auth::user()->role_type_id == 4
                                    ) 
                                    <li class="sidebar-item">
                                    <a class="sidebar-link  waves-effect waves-dark iconcolortext" href="{{route('backend.manager.index')}}" aria-expanded="false">
                                    <i data-feather="user-check"></i>
                                    <span class="hide-menu">Manager</span>
                                    </a>
                                    </li> 
                                    @endif
                                    @if(
                                        Auth::user()->role_type_id == 1 || Auth::user()->role_type_id == 2 ||
                                        Auth::user()->role_type_id == 3 || Auth::user()->role_type_id == 4 ||
                                        Auth::user()->role_type_id == 5
                                    ) 
                                    <li class="sidebar-item">
                                    <a class="sidebar-link  waves-effect waves-dark iconcolortext" href="{{route('backend.team_leader.index')}}" aria-expanded="false">
                                    <i data-feather="user-check"></i>
                                    <span class="hide-menu">Team Leader</span>
                                    </a>
                                    </li>
                                    @endif
                                    @if(
                                        Auth::user()->role_type_id == 1 || Auth::user()->role_type_id == 2 ||
                                        Auth::user()->role_type_id == 3 || Auth::user()->role_type_id == 4 ||
                                        Auth::user()->role_type_id == 5 || Auth::user()->role_type_id == 6
                                    ) 
                                    <li class="sidebar-item">
                                    <a class="sidebar-link  waves-effect waves-dark iconcolortext" href="{{route('backend.team_member.index')}}" aria-expanded="false">
                                    <i data-feather="user-check"></i>
                                    <span class="hide-menu">Team Member</span>
                                    </a>
                                    </li>
                                    @endif
                                    </ul>
                                    </li>  
                    @endif 
                        <!-- @php
                            $all_employee_check = App\Models\backend\UserPermission::where('user_id', Auth::user()->id)->where('menu_id', 31)->exists();
                        @endphp
                          @if($all_employee_check)
                        <li class="sidebar-item">
                            <a class="sidebar-link waves-effect waves-dark" href="{{route('backend.employee.index')}}" aria-expanded="false"><i data-feather="users"></i>
                                <span class="hide-menu">All Employees</span>
                            </a>
                        </li>
                        @endif -->
                            <!-- <li class="sidebar-item">
                                <a class="sidebar-link waves-effect waves-dark" href="{{route('backend.database_entry.index')}}" aria-expanded="false"><i data-feather="users"></i>
                                    <span class="hide-menu">Add Permission</span>
                                </a>
                            </li> -->
                       

                        {{-- <li class="sidebar-item">
                            <a class="sidebar-link  waves-effect waves-dark" href="{{route('backend.login_audit.index')}}" aria-expanded="false">
                                <i data-feather="user-check"></i>
                                <span class="hide-menu">Login Audits</span>
                            </a>
                        </li> --}}
                       {{-- <li class="sidebar-item">
                            <a class="sidebar-link  waves-effect waves-dark" href="{{route('backend.all_document.folders')}}" aria-expanded="false">
                                <i data-feather="user-check"></i>
                                <span class="hide-menu">Folders</span>
                            </a> 
                        </li> --}}
                        @php 
                        $main_folder_assigned_permissions = App\Models\backend\UserMainFolderPermission::where('user_id', Auth::user()->id)->pluck('main_folder_id')->toArray();
                        @endphp
                        <li class="sidebar-item">
                            <a class="sidebar-link  waves-effect waves-dark iconcolortext" href="{{route('backend.folders.main_folder_list')}}" aria-expanded="false">
                                <i data-feather="user-check"></i>
                                <span class="hide-menu">All Departments</span>
                            </a>
                        </li>


                     {{--   <li class="sidebar-item">
                            <a class="sidebar-link has-arrow waves-effect waves-dark nav-folder" href="javascript:void(0)" aria-expanded="false">
                                <i data-feather="inbox">
                                </i><span class="hide-menu">All Departments</span></a>
                            <ul aria-expanded="false" class="collapse first-level dropDown_menu_color"> 
                                @foreach($main_folders as $main_folder)
                                    @if(Auth::user()->role_type_id != 1)
                                        @if(Auth::user()->role_type_id == 2)
                                            @php
                                            if (!in_array(Auth::user()->department_type_id, $main_folder_assigned_permissions)) {
                                                    $main_folder_assigned_permissions[] = Auth::user()->department_type_id;
                                                }
                                            @endphp
                                        @endif
                                        @if(in_array($main_folder->id, $main_folder_assigned_permissions))
                                        
                                        <li class="sidebar-item">
                                            <a class="sidebar-link waves-effect waves-dark" href="{{route('backend.folders.index', [Crypt::encrypt($main_folder->id)])}}"
                                                aria-expanded="false">
                                                <i class="fa-solid fa-folder" style="color:#efcc68 !important;"></i> 
                                                <span class="hide-menu">{{$main_folder->name}}</span>
                                            </a> 
                                        </li>

                                        @endif
 
                                        @else
                                            <li class="sidebar-item folder_ico">
                                                <a class="sidebar-link waves-effect waves-dark" href="{{route('backend.folders.index', [Crypt::encrypt($main_folder->id)])}}"
                                                    aria-expanded="false">
                                                    <i class="far fa-folder-open folder_ico"></i>
                                                    <span class="hide-menu">{{$main_folder->name}}</span>
                                                </a> 
                                            </li> 
                                        @endif
 
                                @endforeach
                            </ul>
                        </li> 
                        --}}

                        @if(Auth::user()->role_type_id == 1) 
                            <li class="sidebar-item">
                                <a class="sidebar-link waves-effect waves-dark sidebar-link iconcolortext" href="{{route('backend.document.archived_document')}}"
                                    aria-expanded="false">
                                    <i data-feather="pie-chart"></i><span class="hide-menu">Archived Documents</span>
                                </a>
                            </li>  
                            <li class="sidebar-item">
                                <a class="sidebar-link has-arrow waves-effect waves-dark iconcolortext" href="javascript:void(0)" aria-expanded="false">
                                <i class="ri-settings-line"></i><span class="hide-menu">Setting</span>
                                </a>
                                <ul aria-expanded="false" class="collapse first-level" style="background-color: #253a76;">
                                    <li class="sidebar-item">
                                        <a class="sidebar-link  waves-effect waves-dark iconcolortext" href="{{route('backend.state.index')}}" aria-expanded="false">
                                            <i data-feather="edit-3"></i><span class="hide-menu">State</span>
                                        </a>
                                    </li>
                                    <li class="sidebar-item">
                                        <a class="sidebar-link  waves-effect waves-dark iconcolortext" href="{{route('backend.city.index')}}" aria-expanded="false">
                                            <i data-feather="edit-3"></i><span class="hide-menu">City</span>
                                        </a>
                                    </li> 
                                   <li class="sidebar-item" style="background-color: #253a76;" >
                                        <a class="sidebar-link  waves-effect waves-dark iconcolortext" href="{{route('backend.role_type.index')}}" aria-expanded="false">
                                        <i data-feather="edit-3"></i><span class="hide-menu">Role</span>
                                        </a>
                                    </li> 
                                </ul>
                            </li> 
                        @endif
                    </ul>

                </nav>
            </div>
        </aside>
       
