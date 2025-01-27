@extends('layouts/backend/main')
@section('main-section')
    <div class="page-wrapper">
        <div class="page-titles">
            <div class="row">
                <div class="col-lg-8 col-md-6 col-12 align-self-center">
                <nav aria-label="breadcrumb">
                <ol class="breadcrumb mb-0 d-flex align-items-center">
                    <li class="breadcrumb-item"><a href="{{route('dashboard')}}" class="link"><i class="ri-home-3-line fs-5"></i></a></li> 
                    <li class="breadcrumb-item active" aria-current="page"><a href="{{route('backend.hotel_department.index')}}" class="link">Hotel Department</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Edit</li>
                </ol>
            </nav>
                    <h1 class="mb-0 fw-bold">Edit Hotel Department</h1>
                </div>
            </div>
        </div>
        <div class="container-fluid">
            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-body">
                            <form class="mt-4" method="POST" action="{{ route('backend.hotel_department.update', [Crypt::encrypt($hotel_department->id)]) }}">
                                @csrf
                                <div class="row">
                                    <div class="mb-3 col-md-6">
                                        <lable for="name">Name</lable>
                                        <input type="text" class="form-control" placeholder="Name" name="name"
                                            required value="{{$hotel_department->name ?? ''}}" id="name" required/>
                                            @error('name')
                                            <p style="color:red;">{{$message}}</p>
                                            @enderror
                                    </div>
                                     
                                    <div class="mb-3 col-md-6">
                                    <lable for="phone">Phone</lable>
                                        <input type="number" class="form-control" id="desig" placeholder="Phone"
                                            name="phone"required value="{{$hotel_department->phone ?? ''}}" id="phone" required/>
                                            @error('phone')
                                            <p style="color:red;">{{$message}}</p>
                                            @enderror
                                    </div>

                                    <div class="mb-3 col-md-6">
                                    <lable>Email</lable>
                                        <input type="text" class="form-control" id="email" placeholder="Email" value="{{$hotel_department->email}}"
                                            name="email" required />
                                            @error('email')
                                            <p style="color:red;">{{$message}}</p>
                                            @enderror
                                    </div>
                                    
                                    <div class="mb-3 col-md-6">
                                    <lable for="head_department">Head Department</lable>
                                        <select name="head_department" required class="select2 js-programmatic form-control"
                                            style="width: 100%;" id="head_department" required> 
                                            <option value="">--Select--</option>
                                            @if(count($head_departments) > 0)
                                                @foreach($head_departments as $h_department)
                                                    <option value="{{$h_department->id}}" {{$hotel_department->getUserHierarchie->head_department_id == $h_department->id ? 'selected':''}}>{{$h_department->getDepartmentType->name}}</option>
                                                @endforeach
                                            @endif 
                                        </select>
                                        @error('head_department')
                                            <p style="color:red;">{{$message}}</p>
                                            @enderror
                                    </div>

                                    <div class="mb-3 col-md-6">
                                    <lable for="hotel_list">Hotel</lable>
                                        <select name="hotel" required class="select2 hotel form-control"
                                            style="width: 100%;" id="hotel_list" required>
                                            <option value="">--Select--</option>
                                            @if(count($hotels) > 0)
                                                @foreach($hotels as $hotel)
                                                    <option value="{{$hotel->id}}" {{$hotel_department->getUserHierarchie->hotel_id == $hotel->id ? 'selected':''}}>{{$hotel->name ?? ''}}</option>
                                                @endforeach
                                            @endif 
                                        </select>
                                        @error('hotel')
                                            <p style="color:red;">{{$message}}</p>
                                            @enderror
                                    </div>
                                    <div class="mb-3 col-md-6">
                                    <lable>Enter password if you want to change</lable>
                                        <input type="text" class="form-control" id="New_pasword" placeholder="New Password"  name="new_pasword"/>
                                    </div>
 
                                    <div class="mb-3">
                                        <button class="btn btn-primary rounded-pill px-4 mt-3" type="submit">
                                            <i data-feather="send" class="feather-sm ms-2 fill-white"></i>
                                            Update
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
@section('javascript-section')
    <script>
        $(".js-programmatic").select2({
            placeholder: "Select Head Department",
        });
        $(".hotel").select2({
            placeholder: "Select Hotel",
        });

    </script>
    
    <script>
         $(document).on("change", "#head_department", async function(){
            let url = "{{route('backend.hotel_department.get_hotel_list')}}";
            let head_department = $(this).val(); 
            let response = await fetch(`${url}/?head_department=${head_department}`);
                let responseData = await response.json(); 
                console.log(responseData);  
                let append_to_html = '<option value="">--Select Hotel--</option>'; 
                if (Array.isArray(responseData.hotel_list) && responseData.hotel_list.length > 0) { 
                    responseData.hotel_list.forEach(hotel => {
                        append_to_html += `<option value="${hotel.id}">${hotel.name}</option>`;
                    });
                } else { 
                }
                $("#hotel_list").html(append_to_html); 
         });
     </script>


    @if (Session::has('success'))
        <script>
            Swal.fire({
                title: "Success!",
                text: "{{ Session::get('success') }}",
                icon: "success",
                timer: 5000,
                willClose: () => {
                    window.location.href = "{{ route('backend.employee.index') }}";
                }
            });
        </script>
    @endif
@endsection
@endsection
