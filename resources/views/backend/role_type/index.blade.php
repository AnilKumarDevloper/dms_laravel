@extends('layouts/backend/main')
@section('main-section') 
<div class="page-wrapper">
    <div class="page-titles">
        <div class="row">
            <div class="col-lg-8 col-md-6 col-12 align-self-center">
            <nav aria-label="breadcrumb">
                        <ol class="breadcrumb mb-0 d-flex align-items-center">
                            <li class="breadcrumb-item"><a href="{{route('dashboard')}}" class="link"><i class="ri-home-3-line fs-5"></i></a></li> 
                            <li class="breadcrumb-item active" aria-current="page">Role</li>
                         </ol>
                    </nav>
                <h1 class="mb-0 fw-bold">Role</h1>
            </div> 
        </div>
    </div>
    <div class="container-fluid">
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-body">
                        <div class="table-responsive">
                            <table id=" " class="table table-striped table-bordered text-nowrap">
                                <thead>
                                    <tr>
                                        <th>SN</th>
                                        <th>Role Name</th>           
                                        <th>Status</th>
                                        <th style="align-item: end;">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @php $count = '1'; @endphp
                                    @foreach($role_types as $role)
                                    <tr>
                                        <td>{{$count++}}</td>
                                        <td>{{$role->name ?? ''}}</td>  
                                        <td>
                                            <div class="form-check form-switch">
                                                <input class="form-check-input" type="checkbox" id="status" style="width:40px" data-id="{{$role->id}}" {{$role->status == 1 ? 'checked':''}}>
                                            </div>
                                        </td>  
                                        <td style="align-item: end;">
                                        <a href="{{route('backend.role_type.edit', [Crypt::encrypt($role->id)])}}" class="editBtn">
                                            <svg height="1em" viewBox="0 0 512 512">
                                                <path d="M410.3 231l11.3-11.3-33.9-33.9-62.1-62.1L291.7 89.8l-11.3 11.3-22.6 22.6L58.6 322.9c-10.4 10.4-18 23.3-22.2 37.4L1 480.7c-2.5 8.4-.2 17.5 6.1 23.7s15.3 8.5 23.7 6.1l120.3-35.4c14.1-4.2 27-11.8 37.4-22.2L387.7 253.7 410.3 231zM160 399.4l-9.1 22.7c-4 3.1-8.5 5.4-13.3 6.9L59.4 452l23-78.1c1.4-4.9 3.8-9.4 6.9-13.3l22.7-9.1v32c0 8.8 7.2 16 16 16h32zM362.7 18.7L348.3 33.2 325.7 55.8 314.3 67.1l33.9 33.9 62.1 62.1 33.9 33.9 11.3-11.3 22.6-22.6 14.5-14.5c25-25 25-65.5 0-90.5L453.3 18.7c-25-25-65.5-25-90.5 0zm-47.4 168l-144 144c-6.2 6.2-16.4 6.2-22.6 0s-6.2-16.4 0-22.6l144-144c6.2-6.2 16.4-6.2 22.6 0s6.2 16.4 0 22.6z"></path>
                                            </svg>
                                        </a>
                                        </td>
                                    </tr>
                                    @endforeach
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
        $(document).on("change", "#status", function(){
            const id = $(this).data('id');
            const csrf_token = $('meta[name="csrf-token"]').attr('content');
            const url = "{{route('backend.role_type.update_status')}}";
            const is_active = $(this).prop('checked');
            const status = is_active ? 1:0;
            Swal.fire({
                title: "Are you sure?",
                text: "You want to change status.",
                icon: "warning",
                showCancelButton: true,
                confirmButtonColor: "#3085d6",
                cancelButtonColor: "#d33",
                confirmButtonText: "Yes, change it!"
            }).then(async (result) => {
                if (result.isConfirmed) {
                    let response = await fetch(url, {
                        method:'POST',
                        headers:{
                            'Content-Type':'application/json',
                            'X-CSRF-TOKEN':csrf_token
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
                        Swal.fire({
                            title: "Error!",
                            text: "Something went wrong.",
                            icon: "error"
                        }); 
                    }
                }else if(result.isDismissed){
                    $(this).prop('checked', !is_active);
                }
            }); 
        });
    </script>
@endsection 
@endsection