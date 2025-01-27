@extends('layouts/backend/main')
@section('main-section')

<div class="page-wrapper">
    <div class="page-titles">
        <div class="row">
            <div class="col-lg-8 col-md-6 col-12 align-self-center">
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
                        <div class="row">
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
                        </div>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table id="" class="table table-striped table-bordered text-nowrap">
                                <thead>
                                    <tr>
                                        <th>Name</th>
                                        <th>Main Category</th>
                                        <th>Sub Category</th>
                                        <th>Start Date</th>
                                        <th>End Date</th>
                                        <th>Start Time</th>
                                        <th>End Time</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>Tiger Nixon</td>
                                        <td>System Architect</td>
                                        <td>61</td>
                                        <td>2011/07/25</td>
                                        <td>2024/07/25</td>
                                        <td>11:20 AM</td>
                                        <td>5:30 PM</td>
                                        <td>
                                            <div class="dropdown dropstart">
                                                <a href="#" class="link" id="dropdownMenuButton"
                                                    data-bs-toggle="dropdown" aria-expanded="false">
                                                    <i data-feather="more-horizontal" class="feather-sm"></i>
                                                </a>
                                                <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                                    <li><a class="dropdown-item" href="{{route('backend.document.edit')}}">Edit</a></li>
                                                    <li><a class="dropdown-item delete-link" href="#">Delete</a></li>
                                                    <li><a class="dropdown-item" href="{{route('backend.document.view')}}   ">View</a></li>
                                                    <li><a class="dropdown-item" href="{{route('backend.document.comment')}}">Comment</a></li>
                                                    <li><a class="dropdown-item" href="#">Download</a></li>
                                                </ul>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Garrett Winters</td>
                                        <td>Accountant</td>
                                        <td>63</td>
                                        <td>2011/07/25</td>
                                        <td>2024/07/25</td>
                                        <td>11:20 AM</td>
                                        <td>5:30 PM</td>
                                        <td>
                                            <div class="dropdown dropstart">
                                                <a href="#" class="link" id="dropdownMenuButton"
                                                    data-bs-toggle="dropdown" aria-expanded="false">
                                                    <i data-feather="more-horizontal" class="feather-sm"></i>
                                                </a>
                                                <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                                    <li><a class="dropdown-item" href="{{route('backend.document.edit')}}">Edit</a></li>
                                                    <li><a class="dropdown-item delete-link" href="#">Delete</a></li>
                                                    <li><a class="dropdown-item" href="{{route('backend.document.view')}}">View</a></li>
                                                    <li><a class="dropdown-item" href="{{route('backend.document.comment')}}">Comment</a></li>
                                                    <li><a class="dropdown-item" href="#">Download</a></li>
                                                </ul>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Ashton Cox</td>
                                        <td>Junior Technical Author</td>
                                        <td>66</td>
                                        <td>2011/07/25</td>
                                        <td>2024/07/25</td>
                                        <td>11:20 AM</td>
                                        <td>5:30 PM</td>
                                        <td>
                                            <div class="dropdown dropstart">
                                                <a href="#" class="link" id="dropdownMenuButton"
                                                    data-bs-toggle="dropdown" aria-expanded="false">
                                                    <i data-feather="more-horizontal" class="feather-sm"></i>
                                                </a>
                                                <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                                    <li><a class="dropdown-item" href="{{route('backend.document.edit')}}">Edit</a></li>
                                                    <li><a class="dropdown-item delete-link" href="#">Delete</a></li>
                                                    <li><a class="dropdown-item" href="{{route('backend.document.view')}}">View</a></li>
                                                    <li><a class="dropdown-item" href="{{route('backend.document.comment')}}">Comment</a></li>
                                                    <li><a class="dropdown-item" href="#">Download</a></li>
                                                </ul>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Cedric Kelly</td>
                                        <td>Senior Javascript Developer</td>
                                        <td>22</td>
                                        <td>2011/07/25</td>
                                        <td>2024/07/25</td>
                                        <td>11:20 AM</td>
                                        <td>5:30 PM</td>
                                        <td>
                                            <div class="dropdown dropstart">
                                                <a href="#" class="link" id="dropdownMenuButton"
                                                    data-bs-toggle="dropdown" aria-expanded="false">
                                                    <i data-feather="more-horizontal" class="feather-sm"></i>
                                                </a>
                                                <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                                    <li><a class="dropdown-item" href="{{route('backend.document.edit')}}">Edit</a></li>
                                                    <li><a class="dropdown-item delete-link" href="#">Delete</a></li>
                                                    <li><a class="dropdown-item" href="{{route('backend.document.view')}}">View</a></li>
                                                    <li><a class="dropdown-item" href="{{route('backend.document.comment')}}">Comment</a></li>
                                                    <li><a class="dropdown-item" href="#">Download</a></li>
                                                </ul>
                                            </div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>Airi Satou</td>
                                        <td>Accountant</td>
                                        <td>33</td>
                                        <td>2011/07/25</td>
                                        <td>2024/07/25</td>
                                        <td>11:20 AM</td>
                                        <td>5:30 PM</td>
                                        <td>
                                            <div class="dropdown dropstart">
                                                <a href="#" class="link" id="dropdownMenuButton"
                                                    data-bs-toggle="dropdown" aria-expanded="false">
                                                    <i data-feather="more-horizontal" class="feather-sm"></i>
                                                </a>
                                                <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                                    <li><a class="dropdown-item" href="{{route('backend.document.edit')}}">Edit</a></li>
                                                    <li><a class="dropdown-item delete-link" href="#">Delete</a></li>
                                                    <li><a class="dropdown-item" href="{{route('backend.document.view')}}">View</a></li>
                                                    <li><a class="dropdown-item" href="{{route('backend.document.comment')}}">Comment</a></li>
                                                    <li><a class="dropdown-item" href="#">Download</a></li>
                                                </ul>
                                            </div>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
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
    document.querySelectorAll('.delete-link').forEach(link => {
        link.addEventListener('click', function (event) {
            event.preventDefault(); // Prevent the default link behavior

            Swal.fire({
                title: "Are you sure?",
                text: "You won't be able to revert this!",
                icon: "warning",
                showCancelButton: true,
                confirmButtonColor: "#3085d6",
                cancelButtonColor: "#d33",
                confirmButtonText: "Yes, delete it!"
            }).then((result) => {
                if (result.isConfirmed) {
                    // If confirmed, proceed with the deletion
                    Swal.fire({
                        title: "Deleted!",
                        text: "Your file has been deleted.",
                        icon: "success"
                    });
                    // Add your deletion logic here
                    // For example, you can submit a form or make an AJAX request to delete the item
                }
            });
        });
    });
</script>
@endsection

@endsection
