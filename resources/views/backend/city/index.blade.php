@extends('layouts/backend/main')
@section('main-section') 
<div class="page-wrapper">
    <div class="page-titles">
        <div class="row">
            <div class="col-lg-8 col-md-6 col-12 align-self-center">
            <nav aria-label="breadcrumb">
                        <ol class="breadcrumb mb-0 d-flex align-items-center">
                            <li class="breadcrumb-item"><a href="{{route('dashboard')}}" class="link"><i class="ri-home-3-line fs-5"></i></a></li> 
                            <li class="breadcrumb-item active" aria-current="page">City</li>
                         </ol>
                    </nav>
                <h1 class="mb-0 fw-bold">City</h1>
            </div>
             
        </div>
    </div>
    <div class="container-fluid">
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-body">
                        <!--- search box -->
                        <div class="d-flex justify-content-end mb-2">
                            <div class="d-flex align-items-center gap-2"
                                style="border: 1px solid #54667a; min-width:280px; border-radius:5px; max-width:500px;">
                                <input type="text" class="form-control" id="search_city" placeholder="Search city here...">
                                <span style="font-size:18px; padding: 0 15px;"><i class="ri-search-2-line"></i></span>
                            </div>
                        </div>
                        <!--- search box  end-->
                        <div class="table-responsive">
                            <table class="table table_city table-striped table-bordered text-nowrap">
                                <thead>
                                    <tr>
                                        <th>SN</th>
                                        <th>City Name</th>        
                                        <th>State Name</th> 
                                        <th>Status</th>       
                                        <th style="align-item: end;">Action</th>
                                    </tr>
                                </thead>
                                <tbody id="city_table" >
                                    <!-- @php $count = '1'; @endphp
                                    @foreach($cities as $city)
                                        <tr>
                                            <td>{{$count++}}</td>
                                            <td>{{$city->name ?? ''}}</td> 
                                            <td>{{$city->getState?->name ?? ''}}</td> 
                                            <td>
                                                <div class="form-check form-switch">
                                                    <input class="form-check-input" type="checkbox" id="status_check" style="width:40px" checked>
                                                </div>
                                            </td>
                                            <td style="align-item: end;">
                                            <a href="{{route('backend.city.edit', [Crypt::encrypt($city->id)])}}" class="editBtn">
                                                <svg height="1em" viewBox="0 0 512 512">
                                                    <path d="M410.3 231l11.3-11.3-33.9-33.9-62.1-62.1L291.7 89.8l-11.3 11.3-22.6 22.6L58.6 322.9c-10.4 10.4-18 23.3-22.2 37.4L1 480.7c-2.5 8.4-.2 17.5 6.1 23.7s15.3 8.5 23.7 6.1l120.3-35.4c14.1-4.2 27-11.8 37.4-22.2L387.7 253.7 410.3 231zM160 399.4l-9.1 22.7c-4 3.1-8.5 5.4-13.3 6.9L59.4 452l23-78.1c1.4-4.9 3.8-9.4 6.9-13.3l22.7-9.1v32c0 8.8 7.2 16 16 16h32zM362.7 18.7L348.3 33.2 325.7 55.8 314.3 67.1l33.9 33.9 62.1 62.1 33.9 33.9 11.3-11.3 22.6-22.6 14.5-14.5c25-25 25-65.5 0-90.5L453.3 18.7c-25-25-65.5-25-90.5 0zm-47.4 168l-144 144c-6.2 6.2-16.4 6.2-22.6 0s-6.2-16.4 0-22.6l144-144c6.2-6.2 16.4-6.2 22.6 0s6.2 16.4 0 22.6z"></path>
                                                </svg>
                                            </a>
                                            </td>
                                        </tr>
                                    @endforeach -->
                                </tbody>
                            </table> 
                            <!-- {{$cities->links("pagination::bootstrap-5")}} -->
                            <div class="d-flex justify-content-end">
                                <nav aria-label="...">
                                    <ul class="pagination" id="paginations">
                            
                                    </ul>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>  
    </div>
</div> 
@section('javascript-section')
    @if  (Session::has('updated'))
        <script>
            Swal.fire({
                title: "Success!",
                text: "{{ Session::get('updated') }}",
                icon: "success",
                timer: 5000,
            }); 
        </script> 
        @endif 

         <script>
    /// sweet alert function 
 
       $(document).on('change', '#status', async function(){
            const id = $(this).data('id');
            const url = "{{route('backend.city.update_status')}}";
            const is_active = $(this).prop('checked');
            const status = is_active ? 1:0;
            const csrf_token = $('meta[name="csrf-token"]').attr('content');
          
            Swal.fire({
               title: "Are you sure?",
               text: "You won't be able to revert this!",
               icon: "warning",
               showCancelButton: true,
               confirmButtonColor: "#3085d6",
               cancelButtonColor: "#d33",
               confirmButtonText: "Yes, delete it!"
           }).then(async (result) =>{
                if(result.isConfirmed){
                    const response = await fetch(url, {
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
                        });
                    }else{
                        alert('something went wrong.');
                    }
                }else if(result.isDismissed){
                    $(this).prop('checked', !is_active);
                }
             
           });
       });
</script>

 <script>
    document.addEventListener('DOMContentLoaded', async function () {
        const search_city = document.getElementById('search_city');
        const city_table = document.getElementById('city_table');
        const paginations = document.getElementById('paginations');
        const url = "{{route('backend.city.search')}}";
        const response = await fetch(url);

        try {
            if (!response.ok) {
                throw new Error('Response is not ok');
            }
            const responseData = await response.json();
            let currentPage = 1;
            const itemsPerPage = 30;
            let filteredData = responseData.city_list;  

        
            const city_rander = (data) => {
                let city_table_tr = "";
                data.forEach((element, index) => {
                    const city_name = element.name || "N/A";
                    const state_name = element.get_state?.name || "N/A";   
                    const encrypted_url = element.encrypted_id || "N/A";
                    const status = element.status || "N/A";
                    const edit = "{{route('backend.city.edit', [':encrypt_id'])}}";
                    const new_encrypted_url = edit.replace(':encrypt_id', encrypted_url);

                    city_table_tr += `<tr>
                            <td>${index + 1}</td>
                            <td>${city_name}</td>
                            <td>${state_name}</td>
                            <td>
                                <div class="form-check form-switch">
                                    <input class="form-check-input" type="checkbox" id="status" style="width:40px" data-id="${element.id}" ${status == 1 ? "checked" : ""}>
                                </div>
                            </td>
                            <td style="align-item: end;">
                                <a href="${new_encrypted_url}" class="editBtn" style="width:25px; height:25px">
                                    <svg style="height:12px" viewBox="0 0 512 512">
                                        <path d="M410.3 231l11.3-11.3-33.9-33.9-62.1-62.1L291.7 89.8l-11.3 11.3-22.6 22.6L58.6 322.9c-10.4 10.4-18 23.3-22.2 37.4L1 480.7c-2.5 8.4-.2 17.5 6.1 23.7s15.3 8.5 23.7 6.1l120.3-35.4c14.1-4.2 27-11.8 37.4-22.2L387.7 253.7 410.3 231zM160 399.4l-9.1 22.7c-4 3.1-8.5 5.4-13.3 6.9L59.4 452l23-78.1c1.4-4.9 3.8-9.4 6.9-13.3l22.7-9.1v32c0 8.8 7.2 16 16 16h32zM362.7 18.7L348.3 33.2 325.7 55.8 314.3 67.1l33.9 33.9 62.1 62.1 33.9 33.9 11.3-11.3 22.6-22.6 14.5-14.5c25-25 25-65.5 0-90.5L453.3 18.7c-25-25-65.5-25-90.5 0zm-47.4 168l-144 144c-6.2 6.2-16.4 6.2-22.6 0s-6.2-16.4 0-22.6l144-144c6.2-6.2 16.4-6.2 22.6 0s6.2 16.4 0 22.6z"></path>
                                    </svg>
                                </a>
                            </td>
                        </tr>`;
                });
                city_table.innerHTML = city_table_tr;
            };

            const updatePagination = (page) => {
                const totalPages = Math.ceil(filteredData.length / itemsPerPage);
                let paginations_page = `
                    <li class="page-item ${page === 1 ? 'disabled' : ''}">
                        <a class="page-link" href="#" onclick="changePage(${page - 1})">Previous</a>
                    </li>
                `;
                for (let i = 1; i <= totalPages; i++) {
                    paginations_page += `
                        <li class="page-item ${page === i ? 'active' : ''}">
                            <a class="page-link" href="#" onclick="changePage(${i})">${i}</a>
                        </li>
                    `;
                }
                paginations_page += `
                    <li class="page-item ${page === totalPages ? 'disabled' : ''}">
                        <a class="page-link" href="#" onclick="changePage(${page + 1})">Next</a>
                    </li>
                `;
                paginations.innerHTML = paginations_page;
            };

            const paginateData = (page) => {
                const start = (page - 1) * itemsPerPage;
                const end = page * itemsPerPage;
                const paginatedData = filteredData.slice(start, end);
                city_rander(paginatedData);
                updatePagination(page);
            };

            window.changePage = (page) => {
                if (page < 1 || page > Math.ceil(filteredData.length / itemsPerPage)) return;
                currentPage = page;
                paginateData(page);
            };

            // Handle search input
            search_city.addEventListener('input', function () {
                const search_city_value = search_city.value.toLowerCase();
                filteredData = responseData.city_list.filter(items => 
                    (items.name || "").toLowerCase().includes(search_city_value) ||
                    (items.get_state?.name || "").toLowerCase().includes(search_city_value)
                );
                currentPage = 1; 
                paginateData(currentPage);
            });

            paginateData(currentPage);
        } catch (error) {
            console.error('This is a network error', error);
            city_table.innerHTML = '<tr><td colspan="5">Unable to load data</td></tr>';
        }
    });
</script>

@endsection 
@endsection