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
                        <li class="breadcrumb-item active" aria-current="page">All Department</li>
                    </ol>
                </nav>
                <h1 class="mb-0 fw-bold">All Departments</h1>
               
            </div>
            @if(Auth::user()->role_type_id == 1)
            <div class="col-lg-4 col-md-6 d-none d-md-flex align-items-center justify-content-end">
                <button class="btn btn-info d-flex align-items-center ms-2" title="View Code" data-bs-toggle="modal" data-bs-target="#view-code5-1-modal"><i class="ri-add-line me-1"></i>Add Department</button>
            </div>
            @endif
        </div>
    </div>
    <div class="container-fluid">
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-body">
                        <div class="d-flex align-items-center gap-2 mb-2" style="border: 1px solid #54667a; min-width:280px; border-radius:5px; max-width:500px;">
                            <input type="text" class="form-control" id="searchTableData" placeholder="Search here..." style="">
                            <span style="font-size:18px; padding: 0 15px;"><i class="ri-search-2-line"></i></span>
                        </div>
                        <div class="table-responsive">
                            <table id="" class="table table-striped table-bordered text-nowrap">
                                <thead>
                                    <tr> 
                                        <th>SN</th>
                                        <th>Department Full Name</th> 
                                        <th>Department Short Name</th> 
                                        <th>Status</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                            <tbody id="add_tr">

                            </tbody>
                        </table>
                        </div>
                        <nav aria-label="...">
                            <ul class="pagination" id="pagination">
                                <!-- Pagination buttons will be added dynamically -->
                            </ul>
                        </nav>
                    </div>
                </div>
            </div>
        </div> 
        <div class="card w-100">
            <div class="d-flexborder-bottomtitle-part-paddingalign-items-center">
                <div class="ms-auto flex-shrink-0">
                    <div id="view-code5-1-modal" class="modal fade" tabindex="-1" aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header border-bottom">
                                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                </div>
                                <div class="modal-body p-4">
                                    <div class="col-lg-12">
                                        <div class="card">
                                            <div class="card-body">
                                                <h4 class="card-title">Create Department</h4>
                                                <form method="POST" action="{{ route('backend.department.store') }}" enctype="multipart/form-data">
                                                    @csrf
                                                    <div class="form-floating mb-3">
                                                        <input type="text" class="form-control" name="department_full_name" required oninput="capitalizeEachWord(this); allowOnlyLetters(event);"/>
                                                        <label><i data-feather="user" class="sun"></i>&nbsp;Full Name</label>
                                                        @error('department_full_name')
                                                            <p style="color:red;">{{$message}}</p>
                                                        @enderror
                                                    </div>
                                                    <div class="form-floating mb-3">
                                                        <input type="text" class="form-control" name="department_short_name" required oninput="capitalizeEachWord(this); allowOnlyLetters(event);"  />
                                                        <label><i data-feather="user" class="sun"></i>&nbsp;Short Name</label>
                                                        @error('department_short_name')
                                                            <p style="color:red;">{{$message}}</p>
                                                        @enderror
                                                    </div>
                                                    <div class="d-md-flex align-items-center">
                                                        <div class="mt-3 mt-md-0 ms-auto">
                                                            <button type="submit" class="btn  btn-info font-weight-medium rounded-pillc px-4">
                                                                <div class="d-flex align-items-center"><i data-feather="send" class="feather-sm fill-white me-2"></i>Submit</div>
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
</div>
@section('javascript-section')
<script>
   document.addEventListener('DOMContentLoaded', async function (){
        const url = "{{route('backend.department.get_all_department_list')}}";
        const response = await fetch(url);
        try{
            if (response.ok){
                const responseData = await response.json();
                let data = responseData.data;  // Original data
                let filteredData = [...data];  // Initially, filteredData is the same as data
                const add_tr = document.getElementById('add_tr');
                const searchInput = document.getElementById('searchTableData');
                const pagination = document.getElementById('pagination');
                const rowsPerPage = 10;
                let currentPage = 1;
                // Render the table with filtered data for pagination
                function renderTable(rows){
                    add_tr.innerHTML = '';
                    rows.forEach((tr_element, index) =>{
                        add_tr.innerHTML += `
                        <tr>
                            <td>${index + 1}</td>
                            <td>${tr_element.name || 'N/A'}</td>
                            <td>${tr_element.short_name || 'N/A'}</td>
                            <td>
                                <div class="form-check form-switch">
                                    <input class="form-check-input" type="checkbox" id="status" style="width:40px" data-id="${tr_element.id}" ${tr_element.status == 1 ? "checked":""}>
                                </div>
                             </td>
                            <td>
                                <div class="button-container">
                                    <a href="">
                                        <button class="editBtn">
                                            <svg height="1em" viewBox="0 0 512 512">
                                                <path d="M410.3 231l11.3-11.3-33.9-33.9-62.1-62.1L291.7 89.8l-11.3 11.3-22.6 22.6L58.6 322.9c-10.4 10.4-18 23.3-22.2 37.4L1 480.7c-2.5 8.4-.2 17.5 6.1 23.7s15.3 8.5 23.7 6.1l120.3-35.4c14.1-4.2 27-11.8 37.4-22.2L387.7 253.7 410.3 231zM160 399.4l-9.1 22.7c-4 3.1-8.5 5.4-13.3 6.9L59.4 452l23-78.1c1.4-4.9 3.8-9.4 6.9-13.3l22.7-9.1v32c0 8.8 7.2 16 16 16h32zM362.7 18.7L348.3 33.2 325.7 55.8 314.3 67.1l33.9 33.9 62.1 62.1 33.9 33.9 11.3-11.3 22.6-22.6 14.5-14.5c25-25 25-65.5 0-90.5L453.3 18.7c-25-25-65.5-25-90.5 0zm-47.4 168l-144 144c-6.2 6.2-16.4 6.2-22.6 0s-6.2-16.4 0-22.6l144-144c6.2-6.2 16.4-6.2 22.6 0s6.2 16.4 0 22.6z"></path>
                                            </svg>
                                        </button>
                                    </a>
                                    <a href="javascript:void(0)">
                                        <button class="button" id="delete_btn" data-id="">
                                            <i class="ri-delete-bin-line" style="color:#fff;"></i>
                                        </button>
                                    </a>
                                </div>
                            </td>
                        </tr>`;
                    });
                }
                // Function to create pagination
                function renderPagination(filteredData){
                    pagination.innerHTML = '';
                    const totalPages = Math.ceil(filteredData.length / rowsPerPage);
                    console.log(totalPages);
                    for (let i = 1; i <= totalPages; i++){
                        pagination.innerHTML += `
                        <li class="page-item ${i === currentPage ? 'active' : ''}">
                            <a class="page-link" href="javascript:void(0)" data-page="${i}">${i}</a>
                        </li>`;
                    }
                }
                // Show data for the current page
                function showPage(pageData){
                    renderTable(pageData);
                }
                // Function to paginate data
                function paginateData(page){
                    currentPage = page;
                    const startIndex = (currentPage - 1) * rowsPerPage;
                    const paginatedData = filteredData.slice(startIndex, startIndex + rowsPerPage);
                    showPage(paginatedData);
                    renderPagination(filteredData);
                }
                // Initial render
                paginateData(currentPage);
                // Handle search input
                searchInput.addEventListener('input', function (){
                    const searchValue = searchInput.value.toLowerCase();
                    filteredData = data.filter(item =>{
                        // Safe check for 'name' and 'short_name' being null or undefined
                        const name = item.name ? item.name.toLowerCase() : '';
                        const shortName = item.short_name ? item.short_name.toLowerCase() : '';
                        return name.includes(searchValue) || shortName.includes(searchValue);
                    });
                    currentPage = 1;  // Reset to first page after search
                    paginateData(currentPage);
                });
                // Handle page click for pagination
                pagination.addEventListener('click', function (event){
                    if (event.target.tagName.toLowerCase() === 'a'){
                        const page = parseInt(event.target.dataset.page);
                        paginateData(page);
                    }
                });
            }else{
                console.error('Failed to fetch: ', response.status, response.statusText);
            }
        }catch (error){
            console.error('An error occurred: ', error);
        }
    });
</script>


<script>
    $(document).on("click", "#delete_btn", async function(){
        let id = $(this).data('id');
        let url = "{{route('backend.department.delete')}}";
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
                let response = await fetch(`${url}?id=${id}`);
                let responseData = await response.json();
                if(responseData.status == "already_in_use"){
                    Swal.fire({
                        title: "Warning!",
                        text: responseData.message,
                        icon: "warning"
                    });
                }else if(responseData.status == 'success'){
                    location.reload();
                }else{
                    alert("Something went wrong!");
                }
            }
        });
    });
 
    $(document).on("change", "#status", async function(){
        const id = $(this).data('id');
        const csrf_token = $('meta[name="csrf-token"]').attr('content');
        const url = "{{route('backend.department.update_status')}}";
        const is_active = $(this).prop('checked');
        const status = is_active ? 1:0;
        const status_text = is_active ? 'Active':'Inactive';  
        Swal.fire({
            title: "Are you sure?",
            text: "You want to change status!",
            icon: "warning",
            showCancelButton: true,
            confirmButtonColor: "#3085d6",
            cancelButtonColor: "#d33",
            confirmButtonText: "Yes, delete it!"
        }).then(async (result) => {
            if (result.isConfirmed){
                const response = await fetch(url, {
                    method:'POST',
                    headers:{
                        'Content-Type':'application/json',
                        'X-CSRF-TOKEN':csrf_token
                    },
                    body:JSON.stringify({
                        'status':status,
                        'id':id
                    }),
                });
                if(response.ok){
                    Swal.fire({
                        title: "Success!",
                        text: "Status has been updated.",
                        icon: "success"
                    });
                } 
            }else if(result.isDismissed){
                $(this).prop('checked', !is_active);
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
    @elseif(Session::has('already_in_use'))
        <script>
            Swal.fire({
                title: "Warning!",
                text: "{{ Session::get('already_in_use') }}",
                icon: "warning"
            });
        </script>
    @elseif(Session::has('main_folder_already_in_use'))
        <script>
            Swal.fire({
                title: "Warning!",
                text: "{{ Session::get('main_folder_already_in_use') }}",
                icon: "warning"
            });
        </script>
    @elseif(Session::has('already_exist'))
        <script>
            Swal.fire({
                title: "Warning!",
                text: "{{ Session::get('already_exist') }}",
                icon: "warning"
            });
        </script>
    @endif
@endsection
@endsection