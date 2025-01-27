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
                  <li class="breadcrumb-item" aria-current="page"><a href="{{route('backend.folders.index', [$main_folde_id])}}" class="link">{{$main_folder->name}}</a></li>
                  <li class="breadcrumb-item active" aria-current="page">{{$sub_folder->name}}</li>
 
                </ol>
              </nav>
                <h1 class="mb-0 fw-bold">{{$main_folder->name}} > {{$sub_folder->name}}</h1>
            </div>

            @php
               $check_upload_permission = App\Models\backend\FileUploadPermission::
               where('main_folder_id', $decrypt_main_folder_id)
               ->where('sub_folder_id', $decrypt_sub_folder_id)
               ->where('user_id', Auth::user()->id)->exists();
            @endphp

            @if($check_upload_permission || Auth::user()->role_type_id == 1 || (Crypt::decrypt($main_folde_id) == Auth::user()->department_type_id))
            <div class="col-lg-4 col-md-6 d-none d-md-flex align-items-center justify-content-end">
                 <a href="{{route('backend.document.direct_upload', [$main_folde_id, $sub_folder_id])}}">
                <button class="btn btn-info d-flex align-items-center ms-2" title="View Code" data-bs-toggle="modal" data-bs-target="#view-code5-1-modal">
                    <i class="ri-add-line me-1"></i>
                    Upload New
                </button>
            </a>
            </div>
            @endif
        </div>
    </div>
    <div class="container-fluid">
        <div class="row">
            <div class="col-12">    
                <div class="card">
                    <div class="border-bottom title-part-padding">
                        <h4>All Document</h4> 
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table id="" class="table table-striped table-bordered text-nowrap">
                                <thead>
                                    <tr>
                                        <th>Title</th>    
                                        <th>File Type</th>    
                                        <th>Department</th>
                                        <th>Main Folder</th>
                                        <th>Sub Folder</th>
                                        <th>Uploaded By</th>
                                        <th>Created at</th>
                                        <!-- <th>Start Time</th>
                                        <th>End Time</th> -->
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody> 
                                    @foreach($documents as $document) 
                                        <tr>
                                            <td><a href="{{route('backend.document.view', [Crypt::encrypt($document->doc_file)])}}">{{$document->document_title ?? 'No Title'}}</a></td> 
                                            <td>{{ strtoupper(pathinfo($document->doc_file, PATHINFO_EXTENSION)) }}</td> 
                                            <td>{{$document->getDepartmentType->name ?? ''}}</td>
                                            <td>{{$document->getMainFolder->name ?? ''}}</td>
                                            <td>{{$document->getSubFolder->name ?? ''}}</td>
                                            <td>{{$document->getOwner?->name}}</td>
                                            <td>{{Carbon\Carbon::parse($document->created_at)->format('d-m-Y h:i A')}}</td> 
                                            <td>
                                                <div class="dropown dropstart d-flex justify-content-around" style="cursor: pointer;">
                                                    @php
                                                     $permission_check_read = App\Models\backend\DocumentPermission::where('user_id', Auth::user()->id)
                                                     ->where('read', 1)->where('document_id', $document->id)->exists();
                                                     $permission_check_write = App\Models\Backend\DocumentPermission::where('user_id', Auth::user()->id)
                                                     ->where('write', 1)->where('document_id', $document->id)->exists();

                                                     if(Auth::user()->role_type_id == 2){
                                                        $user_ids = App\Models\User::where('head_department_id', Auth::user()->id)->pluck('id')->toArray(); 
                                                    }
                                                    if(Auth::user()->role_type_id == 5){
                                                        $user_ids = App\Models\User::where('manager_id', Auth::user()->id)->pluck('id')->toArray(); 
                                                    }
                                                    if(Auth::user()->role_type_id == 6){
                                                        $user_ids = App\Models\User::where('team_leader_id', Auth::user()->id)->pluck('id')->toArray(); 
                                                    }  
                                                    $user_ids[] = Auth::user()->id;
                                                    @endphp

                                                    @if(Auth::user()->role_type_id == 1 || $permission_check_read || in_array($document->owner_id, $user_ids))
                                                    <span>
                                                        <a href="{{route('backend.document.view', [Crypt::encrypt($document->doc_file)])}}" title="View Document">
                                                            <i class="far fa-eye" class="feather-sm"></i>
                                                        </a>
                                                    </span> 
                                                    @endif

                                                    @if(Auth::user()->role_type_id == 1 || $permission_check_write || in_array($document->owner_id, $user_ids))
                                                    <span>
                                                        <a href="{{route('backend.document.edit', [Crypt::encrypt($document->id)])}}" title="Edit">
                                                            <i class="fas fa-pencil-alt"></i>
                                                        </a>
                                                    </span>
                                                    @endif
                                                    <!-- <span>
                                                        <a href="{{route('backend.document.comment', [Crypt::encrypt($document->id)])}}">
                                                            <i class="far fa-comment"></i>
                                                        </a>
                                                    </span> -->
                                                    @if($document->assigned_users != null)
                                                    @if(Auth::user()->role_type_id == 1 || in_array($document->owner_id, $user_ids))
                                                    <span>
                                                        <a href="{{route('backend.document.document_access', [Crypt::encrypt($document->id)])}}" title="Document Read Write Access">
                                                        <i class="fa fa-lock" aria-hidden="true"></i>
                                                        </a>
                                                    </span>
                                                    @endif
                                                    @endif
 
                                                    @if(Auth::user()->role_type_id == 1 || $permission_check_write || in_array($document->owner_id, $user_ids))
                                                    <span>
                                                        <a href="{{route('backend.create_publicly_shared_url', [Crypt::encrypt($document->id)])}}" title="Share Document">
                                                            <i class="fa fa-share-alt" aria-hidden="true"></i>
                                                        </a>
                                                    </span> 
                                                    @endif

                                                    @if(Auth::user()->role_type_id == 1 || in_array($document->owner_id, $user_ids))
                                                    <span>
                                                        <a href="{{route('backend.document.upload_new_file', [Crypt::encrypt($document->id)])}}" title="Upload New File">
                                                        <i class="fa fa-upload" aria-hidden="true"></i>
                                                        </a>
                                                    </span>
                                                    @endif
                                                    <!-- <span>
                                                        <a href="">
                                                        <i class="fa fa-bell" aria-hidden="true"></i>
                                                        </a>
                                                    </span> -->

                                                    @if(Auth::user()->role_type_id == 1 || $permission_check_write || in_array($document->owner_id, $user_ids))
                                                    <span>
                                                        <a href="{{route('admin.task.create', [Crypt::encrypt($document->id)])}}" title="Assign Task">
                                                        <i class="fa fa-tasks" aria-hidden="true"></i>
                                                        </a>
                                                    </span>
                                                    @endif

                                                    @if(Auth::user()->role_type_id == 1 || in_array($document->owner_id, $user_ids))
                                                    <span>
                                                        <a href="javascript:void(0)" data-id="{{Crypt::encrypt($document->id)}}" id="trash_btn" title="Delete">
                                                        <i class="fa fa-trash" aria-hidden="true"></i>
                                                        </a>
                                                    </span>
                                                    @endif
                                                    {{-- {{route('backend.document.delete', [Crypt::encrypt($document->id)])}} --}}
                                                    <!-- <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">    
                                                        <li><a class="dropdown-item" href="">View</a></li>
                                                        <li><a class="dropdown-item" href="">Comment</a></li>
                                                        <li><a class="dropdown-item" href="#">Download</a></li>
                                                    </ul> -->
                                                </div>
                                            </td>
                                        </tr>  
                                        
                                    @endforeach
                                </tbody>
                            </table>
                            {{$documents->links('pagination::bootstrap-5')}} 
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@section('javascript-section')
<script>
    $(document).on("click", "#trash_btn", async function(){
        let id = $(this).data('id'); 
        let url = "{{route('backend.document.delete')}}";  
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
        let response = await fetch(`${url}/?id=${id}`);
        let responseData = await response.json(); 
        console.log(responseData);
        if(responseData.status == 'deleted'){
            Swal.fire({
            title: "Success!",
            text: "Document has been deleted !",
            icon: "success"
            }).then(()=>{
                window.location.reload();
            });
        }else if(responseData.status == 'something_went_wrong'){
            Swal.fire({
            title: "Error!",
            text: "Something Went Wrong !",
            icon: "error"
            });
        }else if(responseData.status == 'permission_denied'){
            Swal.fire({
            title: "Warning!",
            text: "Permission Denied !",
            icon: "warning"
            }); 
        }else if(responseData.status == 'folder_not_available'){
            Swal.fire({
            title: "Warning!",
            text: "Folder Not Available!",
            icon: "warning"
            });
        } 
        }
        });                         
    });
</script>
@endsection
@endsection
