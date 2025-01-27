<style>
    .ro_ss{
       display: flex;
       flex-wrap: wrap;
     
    }
    .w_20{
        width: 18%;
        margin: .5rem 0;
    }
    .card{
        border: none !important;
    }
    .btn-info{
        background-color: #253a76 !important;
        border-color: #253a76 !important;
    }
    .selected .active{ 
    } 
</style>
@extends('layouts/backend/main')
@section('main-section')
    <div class="page-wrapper">
        <div class="page-titles">
            <div class="row">
                <div class="col-lg-8 col-md-6 col-12 align-self-center">
                    <nav aria-label="breadcrumb">
                        <ol class="breadcrumb mb-0 d-flex align-items-center">
                            <li class="breadcrumb-item"><a href="{{route('dashboard')}}" class="link"><i class="ri-home-3-line fs-5"></i></a></li> 
                            <li class="breadcrumb-item" aria-current="page"><a href="{{route('backend.folders.main_folder_list')}}" class="link">All Department</a></li>
                            <li class="breadcrumb-item active" aria-current="page">{{$main_folder->name ?? ''}}</li>
                        </ol>
                    </nav>
                    <h1 class="mb-0 fw-bold">{{$main_folder->name ?? ''}}</h1>
                </div>
                @php
                    $permission_check = App\Models\backend\UserPermission::where('user_id', Auth::user()->id)->where('menu_id', 59)->exists();
                @endphp
                @if($permission_check || Auth::user()->role_type_id == 1)
                    <div class="col-lg-4 col-md-6 d-none d-md-flex align-items-center justify-content-end">
                        <button class="btn btn-info1 d-flex align-items-center ms-2" title="View Code" data-bs-toggle="modal"
                            data-bs-target="#view-code5-1-modal"><i class="ri-add-line me-1"></i>Create Folder</button>
                    </div>
                @endif
            </div>
        </div>
        <div class="container-fluid">
            <div class="ro_ss w-100"> 
                @if(count($sub_folder_list) == 0)
                    <h2>Empty</h2>
                @endif 
                @foreach ($sub_folder_list as $sub_folder)
                    <div class="w_20 g-2">
                        <div class="card-group my-1" id="folder_div">
                            <div class="card">
                                <div class="d-flex justify-content-center">
                                    <div class="d-flex align-items-center flex-column gap-3" >
                                        <span class=" btn-xl text-info btn-circle d-flex align-items-center our-folder">
                                            <span>
                                                <a href="{{ route('backend.folders.view_doc_list', [Crypt::encrypt($main_folder->id), Crypt::encrypt($sub_folder->id)]) }}">
                                                <i class="fa fa-folder" style="color:{{$sub_folder->status == 1 ? "#ffd60a":"lightgray"}} !important; font-size: 5rem;"></i></a>
                                            </span>
                                            @php
                                                $check_upload_permission = App\Models\backend\FileUploadPermission::where('main_folder_id', $main_folder->id)->where('sub_folder_id', $sub_folder->id)->where('user_id', Auth::user()->id)->exists();
                                                $permission_check_delete = App\Models\Backend\UserPermission::where('user_id', Auth::user()->id)->where('menu_id', 65)->exists();
                                            @endphp 
                                            @if($check_upload_permission || $permission_check_delete || Auth::user()->role_type_id != 7 )
                                                <div class="dropdown" style="margin-left: 10px; margin-top: -20px; ">
                                                    <a class=" btn-link" type="button" id="threeDotsMenu" data-bs-toggle="dropdown" aria-expanded="false" style="font-size: 16px;"><i class="fa fa-ellipsis-v"></i></a>
                                                    <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="threeDotsMenu">
                                                        @if(Auth::user()->role_type_id != 7)
                                                            <li>
                                                                <a class="dropdown-item" href="{{route('backend_folder_permission.assign.direct', [Crypt::encrypt($main_folder->id), Crypt::encrypt($sub_folder->id)])}}">Permissions</a>
                                                            </li>
                                                        @endif
                                                        @if($check_upload_permission || Auth::user()->role_type_id == 1)
                                                            <li><a class="dropdown-item" href="{{route('backend.document.direct_upload', [Crypt::encrypt($main_folder->id), Crypt::encrypt($sub_folder->id)])}}">Upload File</a></li>
                                                        @endif
                                                        @if($permission_check_delete || Auth::user()->role_type_id == 1)
                                                            <li><a class="dropdown-item" href="{{route('backend.folders.delete_sub_folder', [Crypt::encrypt($main_folder->id), Crypt::encrypt($sub_folder->id)])}}">Delete Folder</a></li>
                                                        @endif
                                                        @if( Auth::user()->role_type_id == 1)
                                                            <li><a class="dropdown-item" href="javascript:void(0)" id="status" data-id="{{$sub_folder->id}}" data-status="{{$sub_folder->status}}">{{$sub_folder->status == 1 ? "Disable":"Enable"}}</a></li>
                                                        @endif
                                                    </ul> 
                                                </div> 
                                            @endif
                                        </span> 
                                        @php
                                            $documents = App\Models\Backend\Document::with('getOwner')->where('main_folder_id', $main_folder->id)
                                            ->where('sub_folder_id', $sub_folder->id);
                                            if(Auth::user()->role_type_id == 2){
                                                $user_ids = App\Models\User::where('head_department_id', Auth::user()->id)->pluck('id')->toArray();
                                                $user_ids[] = Auth::user()->id;
                                                $documents = $documents->where(function ($query) use ($user_ids) {
                                                    $query->whereIn('owner_id', $user_ids)
                                                    ->orWhereJsonContains('assigned_users', Auth::user()->id);
                                                });
                                            }
                                            if(Auth::user()->role_type_id == 5){
                                                $user_ids = App\Models\User::where('manager_id', Auth::user()->id)->pluck('id')->toArray();
                                                $user_ids[] = Auth::user()->id;
                                                $documents = $documents->where(function ($query) use ($user_ids) {
                                                    $query->whereIn('owner_id', $user_ids)
                                                    ->orWhereJsonContains('assigned_users', Auth::user()->id);
                                                });
                                            }
                                            if(Auth::user()->role_type_id == 6){
                                                $user_ids = App\Models\User::where('team_leader_id', Auth::user()->id)->pluck('id')->toArray();
                                                $user_ids[] = Auth::user()->id;
                                                $documents = $documents->where(function ($query) use ($user_ids) {
                                                    $query->whereIn('owner_id', $user_ids)
                                                    ->orWhereJsonContains('assigned_users', Auth::user()->id);
                                                });
                                            }
                                            if(Auth::user()->role_type_id == 7){
                                                $documents = $documents->WhereJsonContains('assigned_users', Auth::user()->id)
                                                ->orWhere('owner_id', Auth::user()->id); 
                                            }
                                            $documents = $documents->get();
                                        @endphp 
                                        <a href="{{ route('backend.folders.view_doc_list', [Crypt::encrypt($main_folder->id), Crypt::encrypt($sub_folder->id)]) }}">
                                            <h6 class="text-muted mb-0 fw-bold">{{ $sub_folder->name }}  ({{count($documents)}})</h6>
                                        </a> 
                                    </div> 
                                </div>
                            </div>
                        </div> 
                    </div> 
                @endforeach 
            </div>
        </div>
        <div class="card w-100">
            <div class="d-flex border-bottom title-part-padding align-items-center">
                <div class="ms-auto flex-shrink-0">
                    <div id="view-code5-1-modal" class="modal fade" tabindex="-1" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header border-bottom">
                                    <h4 class="card-title">Create Folder</h4>
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body p-4">
                                    <div class="col-lg-12">
                                        <div class="card">
                                            <div class="card-body"> 
                                                <form method="POST" action="{{ route('backend.folders.store', [Crypt::encrypt($main_folder?->id)]) }}">
                                                    @csrf  
                                                    <div class="form-floating mb-3">
                                                        <input type="text" class="form-control" placeholder="Folder Name" required name="folder_name" maxlength="30" />
                                                        <label><i data-feather="folder" class="sun"></i>&nbsp;Folder Name</label>
                                                    </div>
                                                    <div class="d-md-flex align-items-center my-2">
                                                        <div class="mt-3 mt-md-0 ms-auto">
                                                            <button type="submit" class="btn btn-info font-weight-medium rounded-pill px-4">
                                                                <div class="d-flex align-items-center">
                                                                    <i data-feather="send" class="feather-sm fill-white me-2"></i>Create
                                                                </div>
                                                            </button>
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
                                        </div>  
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@section('javascript-section')
    <script>
        $(document).ready(function() {
            $('.select2 js-programmatic').select2();  
        }); 

        $(document).on("click", "#status", async function(){
            const id = $(this).data('id');
            const status = $(this).data('status') == 1 ? 0:1;
            const url = "{{route('backend.folders.update_sub_folder_status')}}";
            const csrf_token = $('meta[name="csrf-token"]').attr('content');
            Swal.fire({
                title: "Are you sure?",
                text: "You want to change status!",
                icon: "warning",
                showCancelButton: true,
                confirmButtonColor: "#3085d6",
                cancelButtonColor: "#d33",
                confirmButtonText: "Yes, change it!"
            }).then(async (result) => {
                if(result.isConfirmed){
                    const response = await fetch(url,{
                        method:'POST',
                        headers:{
                            'Content-Type':'application/json',
                            'X-CSRF-TOKEN': csrf_token
                        },
                        body:JSON.stringify({
                            'id':id,
                            'status':status
                        }),
                    });
                    const responseData = await response.json();
                    console.log(responseData);
                    if(response.ok){   
                        Swal.fire({
                            title: "Success!",
                            text: "Status has been updated.",
                            icon: "success"
                        }).then((result)=>{
                            window.location.reload();
                        });
                    }else{
                        Swal.fire({
                            title: "Success!",
                            text: "Status has been updated.",
                            icon: "success"
                        });
                    }
                }else if(result.isDismissed){  
                }
            }); 
        });
    </script>
    @if (Session::has('success'))
        <script>
            Swal.fire({
                title: "Success!",
                text: "{{ Session::get('success') }}",
                icon: "success",
                timer: 5000,
            });
        </script>
    @elseif(Session::has('update'))
        <script>
            Swal.fire({
                title: "Success!",
                text: "{{ Session::get('update') }}",
                icon: "success",
                timer: 5000,
            });
        </script>
    @elseif(Session::has('warning'))
        <script>
            Swal.fire({
                title: "Warning!",
                text: "{{ Session::get('warning') }}",
                icon: "warning",
                timer: 5000,
            });
        </script>
    @elseif(Session::has('error'))
        <script>
            Swal.fire({
                title: "Error!",
                text: "{{ Session::get('error') }}",
                icon: "error",
                timer: 5000,
            }); 
        </script>
     @elseif(Session::has('deleted'))
        <script>
            Swal.fire({
                title: "Success!",
                text: "{{ Session::get('deleted') }}",
                icon: "success",
                timer: 5000,
            }); 
        </script>
    @elseif(Session::has('in_used'))
        <script>
            Swal.fire({
                title: "Warning!",
                text: "{{ Session::get('in_used') }}",
                icon: "warning",
                timer: 5000,
            });
        </script>
    @elseif(Session::has('folder_already_exists'))
        <script>
            Swal.fire({
                title: "Warning!",
                text: "{{ Session::get('folder_already_exists') }}",
                icon: "warning",
                timer: 5000,
            });
        </script>
    @endif 
@endsection

@endsection