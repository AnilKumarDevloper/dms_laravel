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
                            <li class="breadcrumb-item active" aria-current="page">All Department</li>
                        </ol>
                    </nav>
                    <h1 class="mb-0 fw-bold">{{$main_folder->name ?? ''}}</h1>
                </div> 
            </div>
        </div>
        <div class="container-fluid">
            <div class="ro_ss w-100">  
            @foreach($main_folders_list as $main_folder)
                @if(Auth::user()->role_type_id != 1)
                {{-- @if(Auth::user()->role_type_id == 2)
                    @php 
                        if(!in_array(Auth::user()->department_type_id, $main_folder_assigned_permissions)) {
                            $main_folder_assigned_permissions[] = Auth::user()->department_type_id;
                        }
                     @endphp
                @endif  --}}
                    @if(in_array($main_folder->id, $main_folder_assigned_permissions))
                                    <div class="w_20 g-2">
                                        <div class="card-group my-1" id="folder_div"> 
                                            <div class="card">
                                                    <div class="d-flex justify-content-center"> 
                                                        <div class="d-flex align-items-center flex-column gap-3" >
                                                            <span class="btn btn-xl text-info btn-circle d-flex align-items-center our-folder">
                                                                <a href="{{route('backend.folders.index', [Crypt::encrypt($main_folder->id)])}}">
                                                                    <i class="fa fa-folder" style="color:#ffd60a !important; font-size: 5rem;"></i>
                                                                </a>
                                                            </span>
                                                            <a href="{{route('backend.folders.index', [Crypt::encrypt($main_folder->id)])}}">
                                                                <h6 class="text-muted mb-0 fw-bold">{{$main_folder->name}} ({{count($main_folder->getSubFolder)}})</h6>
                                                            </a>
                                                        </div>

                                                        <div class="dropdown" style="height: fit-content;" >
                                                            <button class="btn btn-link" type="button" id="threeDotsMenu" data-bs-toggle="dropdown" aria-expanded="false">
                                                                <i class="fa fa-ellipsis-v"></i>
                                                            </button>
                                                            <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="threeDotsMenu">
                                                            <li><a class="dropdown-item" href="{{route('backend.folders.index', [Crypt::encrypt($main_folder->id)])}}">Open</a></li> 
                                                            <!-- <li><a class="dropdown-item" href="">Permissions</a></li>  -->
                                                            @php
                                                                $permission_check_delete = App\Models\backend\UserPermission::where('user_id', Auth::user()->id)->where('menu_id', 65)->exists();
                                                                @endphp
                                                                @if($permission_check_delete)
                                                                <li><a class="dropdown-item" href="javascript:void(0)" id="delete_btn" data-id="{{$main_folder->id}}">Delete Folder</a></li>
                                                                @endif
                                                            </ul>
                                                        </div> 
                                                    </div>
                                                </div> 
                                        </div> 
                                    </div>
                                        @endif

                                    @else
                                            <div class="w_20 g-2">
                                                <div class="card-group my-1" id="folder_div"> 
                                                    <div class="card">
                                                        <div class="d-flex justify-content-center"> 
                                                            <div class="d-flex align-items-center flex-column gap-3" >
                                                                <span class="btn-xl text-info btn-circle d-flex align-items-center justify-content-center our-folder " style="width:100%" >
                                                                    <span>
                                                                        <a href="{{route('backend.folders.index', [Crypt::encrypt($main_folder->id)])}}">
                                                                            <i class="fa fa-folder" style="color:{{$main_folder->status == 1 ? "#ffd60a":"lightgray"}} !important; font-size: 5rem;"></i>
                                                                        </a>
                                                                    </span>

                                                                        <div class="dropdown" style="margin-left: 10px; margin-top: -20px; ">
                                                                            <a class=" btn-link" type="button" id="threeDotsMenu" data-bs-toggle="dropdown" aria-expanded="false" style="font-size: 16px;" >
                                                                                <i class="fa fa-ellipsis-v"></i>
                                                                            </a>
                                                                            <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="threeDotsMenu">
                                                                                <li><a class="dropdown-item" href="{{route('backend.folders.index', [Crypt::encrypt($main_folder->id)])}}">Open</a></li>
                                                                                <li><a class="dropdown-item" href="javascript:void(0)" id="delete_btn" data-id="{{$main_folder->id}}">Delete Folder</a></li>
                                                                                <li><a class="dropdown-item" href="javascript:void(0)" id="status" data-id="{{$main_folder->id}}" data-status="{{$main_folder->status}}">{{$main_folder->status == 1 ? "Disable":"Enable"}}</a></li>
                                                                            </ul>
                                                                        </div> 
                                                                </span>
                                                                <span>
                                                                    <a href="{{route('backend.folders.index', [Crypt::encrypt($main_folder->id)])}}">
                                                                        <h6 class="text-muted mb-0 fw-bold">{{$main_folder->name}} ({{count($main_folder->getSubFolder)}})</h6>
                                                                    </a>
                                                                </span>
                                                            </div> 
 
                                                        </div>
                                                    </div>

                                                </div> 
                                            </div> 
                                        @endif 
            @endforeach 
            </div>
        </div> 
@endsection
 
@section('javascript-section')
<script>
    $(document).on("click", "#delete_btn", async function(){
        let main_folder_id = $(this).data('id'); 
        let url = "{{route('backend.folders.delete_main_folder')}}";  
        Swal.fire({
            title: "Are you sure?",
            text: "You won't be able to revert this!",
            icon: "warning",
            showCancelButton: true,
            confirmButtonColor: "#3085d6",
            cancelButtonColor: "#d33",
            confirmButtonText: "Yes, delete it!"
        }).then(async (result) => {
            if (result.isConfirmed){    
            let response = await fetch(`${url}/?id=${main_folder_id}`);
            let responseData = await response.json(); 
                if(responseData.status == 'deleted'){
                    Swal.fire({
                        title: "Success!",
                        text: "Main Folder has been deleted successfully !",
                        icon: "success"
                    }).then(()=>{
                        window.location.reload();
                    });
                }else if(responseData.status == 'warning'){
                    Swal.fire({
                        title: "Warning!",
                        text: "Please Delete all sub folder first from this folder !",
                        icon: "warning"
                    });
                }else if(responseData.status == 'permission_denied'){
                    Swal.fire({
                        title: "Warning!",
                        text: "Permission Denied !",
                        icon: "warning"
                    });
                }
            }
        });                         
    });

    $(document).on("click", "#status", async function(){
        const id = $(this).data('id');
        const status = $(this).data('status') == 1 ? 0:1;
        const url = "{{route('backend.folders.update_main_folder_status')}}";
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
@endsection
