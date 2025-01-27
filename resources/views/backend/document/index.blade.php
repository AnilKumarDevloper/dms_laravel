@extends('layouts/backend/main')
@section('main-section')

<div class="page-wrapper">
    <div class="page-titles">
        <div class="row">
            <div class="col-lg-8 col-md-6 col-12 align-self-center">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb mb-0 d-flex align-items-center">
                  <li class="breadcrumb-item">
                    <a href="{{route('dashboard')}}" class="link"><i class="ri-home-3-line fs-5"></i></a>
                  </li>
                  <li class="breadcrumb-item" active aria-current="page">All Document</li> 
                </ol>
            </nav>

                <h1 class="mb-0 fw-bold">All Document</h1>
            </div>
            <div class="col-lg-4 col-md-6 d-none d-md-flex align-items-center justify-content-end">
                 <a href="{{route('backend.document.create')}}">
                <button class="btn btn-info d-flex align-items-center ms-2" title="View Code" data-bs-toggle="modal" data-bs-target="#view-code5-1-modal">
                    <i class="ri-add-line me-1"></i>
                    Add New Document
                </button>
            </a>
            </div>
        </div>
    </div>
    <div class="container-fluid">
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="border-bottom title-part-padding">
                        <h4>All Document</h4>
                        <!-- <div class="row">
                            <div class="col-md-4 mb-3">
                                <label for="validationDefault01">Search By Name</label>
                                <input type="text" class="form-control" id="validationDefault01" placeholder="Name" required>
                            </div>
                            <div class="col-md-4 mb-3">
                                <label for="validationDefault02">Search By Category </label>
                                <input type="text" class="form-control" id="validationDefault02" placeholder="Category" required>
                            </div>
                            <div class="col-md-4 mb-3">
                                <label for="validationDefaultUsername">Search By Created Date</label>
                                <div class="input-group">
                                    <input type="date" class="form-control" id="validationDefaultUsername" placeholder="Created Date" aria-describedby="inputGroupPrepend2" required>
                                </div>
                            </div>
                        </div> -->
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table id="" class="table table-striped table-bordered text-nowrap">
                                <thead>
                                    <tr>
                                        <th>Title</th>    
                                        <th>Department</th>
                                        <th>Main Folder</th>
                                        <th>Sub Folder</th>
                                        <!-- <th>Start Time</th>
                                        <th>End Time</th> -->
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @foreach($documents as $document)
                                    <tr>
                                        <td><a href="{{route('backend.document.view', [Crypt::encrypt($document->doc_file)])}}">{{$document->document_title ?? 'No Title'}}</a></td> 
                                        <td>{{$document->getDepartmentType->name ?? ''}}</td> 
                                        <td>{{$document->getMainFolder->name ?? ''}}</td> 
                                        <td>{{$document->getSubFolder->name ?? ''}}</td> 
                                        <td>
                                            <div class="dropdown dropstart"> 
                                                <a href="#" class="link" id="dropdownMenuButton"
                                                    data-bs-toggle="dropdown" aria-expanded="false">
                                                    <i data-feather="more-horizontal" class="feather-sm"></i>
                                                </a>
                                                <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                                    <li><a class="dropdown-item" href="{{route('backend.document.edit', [Crypt::encrypt($document->id)])}}">Edit</a></li>
                                                    <!-- <li><a class="dropdown-item delete-link" href="#">Delete</a></li> -->
                                                    <li><a class="dropdown-item" href="{{route('backend.document.view', [Crypt::encrypt($document->doc_file)])}}">View</a></li>
                                                    <li><a class="dropdown-item" href="{{route('backend.document.comment', [Crypt::encrypt($document->id)])}}">Comment</a></li>
                                                    <li><a class="dropdown-item" href="{{route('backend.document.download', [Crypt::encrypt($document->id)])}}">Download</a></li>
                                                    <li><a class="dropdown-item" href="{{route('backend.document.upload_new_file', [Crypt::encrypt($document->id)])}}" >Upload New Version File</a></li>
                                                    <li><a class="dropdown-item" id="delete_btn" data-id="{{$document->id}}" href="javascript:void(0)">Delete</a></li>
                                                </ul>
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
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script>
    $(document).on("click", "#delete_btn", async function(){
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
            if (result.isConfirmed) { 
                let response = await fetch (`${url}?id=${id}`); 
                let responseData = await response.json();
                if(responseData.status == "deleted"){ 
                    location.reload();
                } 
            }
        });   
    });   
</script>
@endsection

@endsection
