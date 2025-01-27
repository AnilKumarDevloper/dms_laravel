@extends('layouts/backend/main')
@section('main-section')

<div class="page-wrapper">
    <div class="page-titles">
        <div class="row">
            <div class="col-lg-8 col-md-6 col-12 align-self-center">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb mb-0 d-flex align-items-center">
                    <li class="breadcrumb-item"><a href="{{route('dashboard')}}" class="link"><i class="ri-home-3-line fs-5"></i></a></li> 
                    <li class="breadcrumb-item active" aria-current="page">Archived Document</li>
                    <!-- <li class="breadcrumb-item active" aria-current="page">{{$main_folder->name ?? ''}}</li> -->
                </ol>
            </nav>
                <h1 class="mb-0 fw-bold">Archived Document</h1>
            </div> 
        </div>
    </div>
    <div class="container-fluid">
        <div class="row">
            <div class="col-12">
                <div class="card">

                    <div class="card-body">
                        <!---  search section start ---->
                        <div class="d-flex justify-content-between mb-2">
                            <div class="border-bottom">
                                <h4>Archived Document</h4>
                            </div>
                            <div class="d-flex align-items-center gap-2 mb-2"
                                style="border: 1px solid #54667a; min-width:280px; border-radius:5px; max-width:500px;">
                                <input type="text" class="form-control" id="searchInput_achived" placeholder="Search here..." style="">
                                <span style="font-size:18px; padding: 0 15px;"><i class="ri-search-2-line"></i></span>
                            </div>
                        </div>
                        <!---  search section end ---->

                        <div class="table-responsive">
                            <table id="" class="table table-striped table-bordered text-nowrap">
                                <thead>
                                    <tr>
                                        <th>Title</th>    
                                        <th>Department</th>
                                        <th>Main Folder</th>
                                        <th>Sub Folder</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody id="archived_table">
                                    {{-- @foreach($documents as $document)
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
                                                     <li><a class="dropdown-item" href="{{route('backend.document.restore', [Crypt::encrypt($document->id)])}}">Restore</a></li> 
                                                     <li><a class="dropdown-item" id="delete_btn" data-id="{{$document->id}}" href="javascript:void(0)">Delete Permanent</a></li> 
                                                    <li><a class="dropdown-item" href="{{route('backend.document.download', [Crypt::encrypt($document->id)])}}">Download</a></li>
                                                </ul>
                                            </div>
                                        </td>
                                    </tr>  
                                    @endforeach --}}
                                </tbody>
                            </table>
                            <!-- {{$documents->links('pagination::bootstrap-5')}} -->
                            <!--- pagination start --->
                            <nav aria-label="Page navigation example">
                                <ul class="pagination" id="paginationbox">
                                    
                                </ul>
                            </nav>
                            <!--- pagination end --->
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
        let url = "{{route('backend.document.permanent_delete')}}";
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
                let response = await fetch(`${url}?id=${id}`);
                let responseData = await response.json(); 
                if(responseData.status == "deleted"){
                    $('#table_row_'+id).hide();
                   // location.reload();
                }else{
                    alert('Something Went Wrong');
                }
            }
        });
    }); 
</script>


@if(Session::has('success'))
    <script>
        Swal.fire({
            title: "Success!",
            text: "{{Session::get('success')}}",
            icon: "success"
        });
    </script>
@endif



<script>
    
  document.addEventListener('DOMContentLoaded', async function ()
    {
        const url = "{{route('backend.document.search_archived_document')}}";
        const archived_table = document.getElementById('archived_table');
        const searchInput_achived = document.getElementById('searchInput_achived');
        const paginationbox = document.getElementById('paginationbox');

        let currentPage = 1;
        const itemsPerPage = 8;
        let allDocuments = [];
        let filteredDocuments = [];

        try
        {
            const response = await fetch(url);
            if (!response.ok)
            {
                console.error(`HTTP Error: ${response.status}`);
                throw new Error("Response is not OK");
            }

            const responseData = await response.json();
            console.log(responseData)
            allDocuments = responseData.document_list;
            filteredDocuments = allDocuments; 

            // Function to render the rows in the table
            const renderTable = (data) =>
            {
                let archived_tr = "";
                data.forEach(element =>
                {
                    const document_title = element.document_title || "N/A";
                    const document_name = element.get_department_type.name || "N/A";
                    const mainfolder_name = element.get_main_folder.name || "N/A";
                    const sub_folder_name = element.get_sub_folder.name || "N/A";
                    const doc_path = element.doc_path || "N/A";
                    const download_url = "{{url(':doc_path')}}";
                    const new_download_url = download_url.replace(':doc_path', doc_path+'/'+element.doc_file);
                    const encrypt_Url = element.encrypted_id || "N/A";

                    const restore_url = "{{route('backend.document.restore', [':encrypt_id']) }}";
                    const new_restore_url = restore_url.replace(':encrypt_id', encrypt_Url);
                     
                    archived_tr += `
                    <tr id='table_row_${element.id}'>
                        <td>${document_title}</td>
                        <td>${document_name}</td>
                        <td>${mainfolder_name}</td>
                        <td>${sub_folder_name}</td>
                        <td>
                            <div class="dropdown dropstart">
                                <a href="#" class="link" id="dropdownMenuButton" data-bs-toggle="dropdown" aria-expanded="false">
                                    <i class="ri-more-fill"></i>
                                </a>
                                <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                    <li><a class="dropdown-item" href="${new_restore_url}">Restore</a></li>
                                    <li><a class="dropdown-item" id="delete_btn" data-id="${element.id}" href="#">Delete Permanent</a></li>
                                    <li><a class="dropdown-item" href="${new_download_url}" download >Download</a></li>
                                </ul>
                            </div>
                        </td>
                    </tr>
                `;
                });
        
                archived_table.innerHTML = archived_tr;
            };
            // Function to paginate the documents
            const paginateDocuments = (page, documents) =>
            {
                const startIndex = (page - 1) * itemsPerPage;
                const paginatedDocuments = documents.slice(startIndex, startIndex + itemsPerPage);
                renderTable(paginatedDocuments);
            };

            // Function to update pagination controls
            const updatePagination = (totalItems) =>
            {
                const totalPages = Math.ceil(totalItems / itemsPerPage);
                let paginationDiv = '';

                if (currentPage > 1)
                {
                    paginationDiv += `<li class="page-item"><a class="page-link" href="#" id="prevPage">Previous</a></li>`;
                }

                for (let i = 1; i <= totalPages; i++)
                {
                    paginationDiv += `<li class="page-item"><a class="page-link" href="#" class="pageNumber" data-page="${i}">${i}</a></li>`;
                }

                if (currentPage < totalPages)
                {
                    paginationDiv += `<li class="page-item"><a class="page-link" href="#" id="nextPage">Next</a></li>`;
                }

                paginationbox.innerHTML = paginationDiv;

                // Add event listeners to page number and navigation buttons
                document.querySelectorAll('.pageNumber').forEach(pageLink =>
                {
                    pageLink.addEventListener('click', function ()
                    {
                        currentPage = parseInt(pageLink.dataset.page);
                        paginateDocuments(currentPage, filteredDocuments);
                        updatePagination(filteredDocuments.length);
                    });
                });

                document.getElementById('prevPage')?.addEventListener('click', () =>
                {
                    if (currentPage > 1)
                    {
                        currentPage--;
                        paginateDocuments(currentPage, filteredDocuments);
                        updatePagination(filteredDocuments.length);
                    }
                });

                document.getElementById('nextPage')?.addEventListener('click', () =>
                {
                    const totalPages = Math.ceil(filteredDocuments.length / itemsPerPage);
                    if (currentPage < totalPages)
                    {
                        currentPage++;
                        paginateDocuments(currentPage, filteredDocuments);
                        updatePagination(filteredDocuments.length);
                    }
                });
            };
            updatePagination(filteredDocuments.length);
            paginateDocuments(currentPage, filteredDocuments);

            // Search functionality
            searchInput_achived.addEventListener('input', function ()
            {
                const searchValue = searchInput_achived.value.toLowerCase();
                filteredDocuments = allDocuments.filter(item =>
                    (item.document_title || '').toLowerCase().includes(searchValue) ||
                    (item.get_main_folder.name || '').toLowerCase().includes(searchValue)
                );

                currentPage = 1; // Reset to the first page after filtering
                paginateDocuments(currentPage, filteredDocuments);
                updatePagination(filteredDocuments.length);
            });

        } catch (error)
        {
            console.error('Error:', error);
        }
    });

</script>


@endsection

@endsection
