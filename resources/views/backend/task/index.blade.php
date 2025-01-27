@extends('layouts/backend/main')
@section('main-section')

<div class="page-wrapper">
    <div class="page-titles">
        <div class="row">
            <div class="col-lg-8 col-md-6 col-12 align-self-center">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb mb-0 d-flex align-items-center">
                  <li class="breadcrumb-item"><a href="{{route('dashboard')}}" class="link"><i class="ri-home-3-line fs-5"></i></a></li> 
                  <li class="breadcrumb-item active" aria-current="page">Task</li> 
                </ol>
              </nav>
                <h1 class="mb-0 fw-bold">Task</h1>
            </div> 
            <div class="col-lg-4 col-md-6 d-none d-md-flex align-items-center justify-content-end">
                 <a href="{{route('admin.task.create_new_task')}}">
                <button class="btn btn-info d-flex align-items-center ms-2">
                    <i class="ri-add-line me-1"></i>
                    New Task
                </button>
            </a>
            </div>
        </div>


    </div>
    <div class="container-fluid"> 
        <div class="row"> 
            @if(Auth::user()->role_type_id != 1)
            <form method="GET" action="{{route('admin.task.index')}}" class="d-flex">
            <div class="col-md-6">
            <select name="task_type" required class="js-programmatic form-control"  style="width: 100%; height: 36px">
                    <option value=" ">All</option>  
                    <option value="1" {{isset($_GET['task_type']) && $_GET['task_type'] == 1 ? 'selected' : ''}}>Assigned To Me</option>  
                    <option value="2" {{isset($_GET['task_type']) && $_GET['task_type'] == 2 ? 'selected' : ''}}>Assigned By Me</option>  
                    </select>
            </div>
            <div class="col-md-6">
                <input class="btn btn-primary" type="submit" value="Apply">
            </div>
            </form>
            @endif
            @if(count($tasks) > 0)
                <div class="col-12">

                    <div class="card">
                        <!---search box --->
                        <div class="d-flex justify-content-end">
                                <div class="d-flex align-items-center gap-2 mb-2" style="border: 1px solid #54667a; min-width:280px; border-radius:5px; max-width:500px;">
                                    <input type="text" class="form-control" id="searchInput" placeholder="Search here..." style="">
                                     <span style="font-size:18px; padding: 0 15px;"><i class="ri-search-2-line"></i></span>
                                 </div>
                        </div>
                        <!---search box end --->
                        <div class="border-bottom title-part-padding">
                            <h4>All Task</h4>
                        </div> 
                        <div class="card-body"> 
                            <div class="table-responsive"> 
                                <table id="" class="table table-striped table-bordered text-nowrap">
                                    <thead>
                                        <tr>
                                            <th>Title</th>   
                                            <th>Name</th> 
                                            <th>Type</th>    
                                            <th>Assign Date</th>
                                            <th>Start Date</th>
                                            <th>End Date</th> 
                                             <th>Status</th>
                                            <th>Assign By</th> 
                                            <th>Assign To</th> 
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody id="row_tr">
                                        <!-- @if(count($tasks) > 0) 
                                        @foreach($tasks as $task)
                                            <tr>
                                                <td><a href="{{route('admin.task.view_doc', [Crypt::encrypt($task->id)])}}">{{$task->getDocument?->document_title ?? 'No Title'}}</a></td> 
                                                <td>{{ strtoupper(pathinfo($task->document_name, PATHINFO_EXTENSION)) }}</td>
                                                <td>{{Carbon\Carbon::parse($task->assign_date)->format('d M, Y h:i A')}}</td>
                                                <td>
                                                @if($task->start_date != NULL)
                                                {{Carbon\Carbon::parse($task->start_date)->format('d M, Y')}}
                                                @else
                                                -
                                                @endif
                                            </td>
                                                <td>
                                                @if($task->end_date != NULL)
                                                {{Carbon\Carbon::parse($task->end_date)->format('d M, Y')}}
                                                @else
                                                -
                                                @endif
                                                </td> 
                                                <td>{{strtoupper($task->current_status)}}</td>
                                                <td>{{$task->getAssignedBy?->name}}</td>
                                                <td>{{$task->getAssignedTo?->name}}</td>
                                                <td>
                                                    <div class="dropown dropstart d-flex justify-content-around" style="cursor: pointer;">
                                                        <span><a href="{{route('admin.task.view', [Crypt::encrypt($task->id)])}}"><i class="far fa-eye" class="feather-sm"></i></a></span>
                                                        <span><a href="{{route('admin.task.edit', [Crypt::encrypt($task->id)])}}"><i class="fas fa-pencil-alt"></i></a></span>      
                                                    </div>
                                                </td>
                                            </tr>  
                                            @endforeach
                                            @endif -->

                                            <!-- <tr>
                                                <td><a href="">kjdiopfj</a></td>
                                                <td>jjdjb</td>
                                                <td>ldgg</td>
                                                <td>gh</td>
                                                <td>fggre</td>
                                                <td>klsf ms</td>
                                                <td>dsgsg</td>
                                                <td>arvind</td>
                                                <td>
                                                    <div class="dropown dropstart d-flex justify-content-around" style="cursor: pointer;">
                                                        <span><a href=""><i class="far fa-eye"
                                                                    class="feather-sm"></i></a></span>
                                                        <span><a href=""><i class="fas fa-pencil-alt"></i></a></span>
                                                    </div>
                                                </td>
                                            </tr> -->

                                    </tbody>
                                </table>
                                <nav aria-label="...">
                                    <ul class="pagination" id="paginations">
                                        <!-- <li class="page-item disabled">
                                            <a class="page-link" href="#" tabindex="-1" aria-disabled="true">Previous</a>
                                        </li>
                                        <li class="page-item active"><a class="page-link" href="#">1</a></li>
                                        <li class="page-item" aria-current="page">
                                            <a class="page-link" href="#">2</a>
                                        </li>
                                        <li class="page-item"><a class="page-link" href="#">3</a></li>
                                        <li class="page-item">
                                            <a class="page-link" href="#">Next</a>
                                        </li> -->
                                    </ul>
                                </nav>
                                <!-- {{$tasks->links('pagination::bootstrap-5')}}  -->
                            </div>
                        </div>
                    </div>
                </div>
            @else
            <h3>No Task Available</h3>
            @endif
        </div>
         
    </div>
</div>

@section('javascript-section') 
<script>
    @if(Session::has('updated'))
        Swal.fire({
            title: "Success!",
            text: "{{Session::get('updated')}}",
            icon: "success"
        });
    @endif
</script>
<script>
  
 document.addEventListener("DOMContentLoaded", async function ()
    {
        const searchInput = document.getElementById('searchInput');
        const row_tr = document.getElementById('row_tr');
        const paginations = document.getElementById('paginations');
        const url = "{{route('backend.department.get_all_task_list')}}";
        const itemsPerPage = 8;
        let currentPage = 1; // Default page is 1
        let filteredData = []; // Stores filtered data after search
        try{
            const response = await fetch(url);
            if(!response.ok){
                throw new Error('Failed to fetch data');
            }
            const responseData = await response.json();
            console.log(responseData)
            function renderRows(data){
                row_tr.innerHTML = ''; // Clear previous rows
                if (data.length === 0){
                    row_tr.innerHTML = `
                    <tr>
                        <td colspan="10">
                            <div class="d-flex justify-content-center">
                                <div class="spinner-border" role="status">
                                    <span class="sr-only">Loading...</span>
                                </div>
                            </div>
                        </td>
                    </tr>`;
                    setTimeout(function (){
                        row_tr.innerHTML = '<tr><td colspan="10" class="text-danger text-center"><b>No matching tasks found.</b></td></tr>';
                    }, 1000);
                    return;
                }
                const start = (currentPage - 1) * itemsPerPage;
                const end = start + itemsPerPage;
                const pageData = data.slice(start, end); // Get the data for the current page
                let rowsHTML = '';
                pageData.forEach((tr_element, index) =>{
                    const title = tr_element.title || tr_element.get_document.document_title;
                    const name = tr_element.get_assigned_to?.name || 'N/A';
                    const document_type = tr_element.document_name.split('.').pop() || 'N/A';
                    const assign_date = tr_element.assign_date || 'N/A';
                    const start_date = tr_element.start_date || 'N/A';
                    const end_date = new Date(tr_element.end_date);
                    const currentDate = new Date(); 
                    currentDate.setHours(0, 0, 0, 0);
                    const status = tr_element.current_status || 'N/A';
                    const assigned_by = tr_element.get_assigned_by.name || 'N/A';
                    const assigned_to = tr_element.get_assigned_to.name || 'N/A';
                    
                    const ducument_url = tr_element.ducument_url || 'N/A';
                    const view_url = "{{route('admin.task.view', [':encrypt_id'])}}";
                    const new_view_url =view_url.replace(':encrypt_id', tr_element.encrypted_id);
                    const edit_url = "{{route('admin.task.edit', [':encrypt_id'])}}";
                    const new_edit_url = edit_url.replace(':encrypt_id', tr_element.encrypted_id);
                    const doc_view_url = "{{route('admin.task.view_doc', [':encrypt_id'])}}";;
                    const new_doc_view_url = doc_view_url.replace(':encrypt_id', tr_element.encrypted_id);
                    rowsHTML += `
                    <tr>`;
                    if(end_date < currentDate){
                        rowsHTML +=` <td>${title || 'No Title'}</td>`;
                    }else{
                        rowsHTML +=` <td><a href="${new_doc_view_url}">${title || 'No Title'}</a></td>`;
                    } 
                    rowsHTML +=` 
                        <td>${name}</td>
                        <td>${document_type.toUpperCase()}</td>
                        <td>${assign_date}</td>
                        <td>${start_date}</td>
                        <td>${tr_element.end_date || 'N/A'}</td>
                        <td>${status}</td>
                        <td>${assigned_by}</td>
                        <td>${assigned_to}</td>
                        <td>
                            <div class="dropdown dropstart d-flex justify-content-around" style="cursor: pointer;">
                                <span><a href="${new_view_url}"><i class="far fa-eye" class="feather-sm"></i></a></span>
                                <span><a href="${new_edit_url}"><i class="fas fa-pencil-alt"></i></a></span>
                            </div>
                        </td>
                    </tr>`;
                });
                row_tr.innerHTML = rowsHTML;
            }
            // Function to render pagination controls
            function renderPagination(data){
                paginations.innerHTML = ''; // Clear previous pagination
                const totalPages = Math.ceil(data.length / itemsPerPage);
                if (totalPages <= 1) return; // No pagination needed if there's only one page
                // Previous button
                const prevDisabled = currentPage === 1 ? 'disabled' : '';
                paginations.innerHTML += `
                <li class="page-item ${prevDisabled}">
                    <a class="page-link" href="#" aria-disabled="true" onclick="changePage(${currentPage - 1})">Previous</a>
                </li>`;
                // Pagination buttons
                for (let i = 1; i <= totalPages; i++){
                    const active = currentPage === i ? 'active' : '';
                    paginations.innerHTML += `
                    <li class="page-item ${active}">
                        <a class="page-link" href="#" onclick="changePage(${i})">${i}</a>
                    </li>`;
                }
                // Next button
                const nextDisabled = currentPage === totalPages ? 'disabled' : '';
                paginations.innerHTML += `
                <li class="page-item ${nextDisabled}">
                    <a class="page-link" href="#" onclick="changePage(${currentPage + 1})">Next</a>
                </li>`;
            }
            // Change page function
            window.changePage = (page) =>{
                const totalPages = Math.ceil(filteredData.length / itemsPerPage);
                if (page < 1 || page > totalPages) return; 
                currentPage = page;
                renderRows(filteredData);  
                renderPagination(filteredData);
            };
            // Search function with pagination update
            searchInput.addEventListener('input', function (){
                const searchInput_value = searchInput.value.toLowerCase();
                filteredData = responseData.data.filter(findData =>{
                    return (findData.get_assigned_to?.name || '').toLowerCase().includes(searchInput_value) ||
                        (findData.title || '').toLowerCase().includes(searchInput_value) ||
                        (findData.document_name || '').toLowerCase().includes(searchInput_value);
                });
                currentPage = 1; // Reset to page 1 on search
                renderRows(filteredData);
                renderPagination(filteredData); 
            });
            filteredData = responseData.data;
            renderRows(filteredData);
            renderPagination(filteredData);
        }catch(error){
            console.error('Server side error', error);
        }
    });
</script>


@endsection
@endsection
