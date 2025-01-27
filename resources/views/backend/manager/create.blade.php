@extends('layouts/backend/main')
@section('main-section')
    <div class="page-wrapper">
        <div class="page-titles">
            <div class="row">
                <div class="col-lg-8 col-md-6 col-12 align-self-center">
                <nav aria-label="breadcrumb">
                <ol class="breadcrumb mb-0 d-flex align-items-center">
                    <li class="breadcrumb-item"><a href="{{route('dashboard')}}" class="link"><i class="ri-home-3-line fs-5"></i></a></li> 
                    <li class="breadcrumb-item active" aria-current="page"><a href="{{route('backend.manager.index')}}" class="link">Manager</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Create</li>
                </ol>
            </nav>
                    <h1 class="mb-0 fw-bold">Add Manager</h1>
                </div>
            </div>
        </div>
        <div class="container-fluid">
            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-body">
                            <form class="mt-4" method="POST" action="{{ route('backend.manager.store') }}">
                                @csrf
                                <div class="row">
                                    <div class="mb-3 col-md-6">
                                        <lable>Name</lable>
                                        <input type="text" class="form-control" placeholder="Name" name="name" id="name"
                                             value="{{ old('name') }}" required/>
                                            @error('name')
                                            <p style="color:red;">{{$message}}</p>
                                            @enderror
                                    </div>

                                    <div class="mb-3 col-md-6">
                                    <lable>Email</lable>
                                        <input type="email" class="form-control" placeholder="Email" name="email"
                                             value="{{ old('email') }}" required/>
                                            @error('email')
                                            <p style="color:red;">{{$message}}</p>
                                            @enderror
                                    </div>

                                    <div class="mb-3 col-md-6">
                                    <lable>Phone</lable>
                                        <input type="number" class="form-control" id="desig" placeholder="Phone"
                                            name="phone"  value="{{ old('phone') }}" required/>
                                            @error('phone')
                                            <p style="color:red;">{{$message}}</p>
                                            @enderror
                                    </div> 

                                    <!-- <div class="mb-3 col-md-6">
                                    <lable>Head Department</lable>
                                        <select name="head_department"  class="select2 hotel form-control"
                                            style="width: 100%;" id="head_department" required>
                                            <option value="">--Select--</option>
                                            @foreach($heade_departments as $head_department)
                                            <option value="{{$head_department->id}}">{{$head_department->name}} - {{$head_department->getDepartmentType->name}}</option>
                                            @endforeach
                                        </select>
                                        @error('head_department')
                                            <p style="color:red;">{{$message}}</p>
                                            @enderror
                                    </div> -->

                                    <div class="mb-3 col-md-6">
                                    <lable>Hotel</lable>
                                        <select name="hotel"  class="select2 hotel form-control"
                                            style="width: 100%;" id="hotel" required> 
                                        </select>
                                        @error('hotel')
                                            <p style="color:red;">{{$message}}</p>
                                            @enderror
                                    </div>

                                    <div class="mb-3 col-md-6">
                                    <lable>Hotel Department</lable>
                                        <select name="hotel_department"  class="select2 hotel form-control"
                                            style="width: 100%;" id="hotel_department"> 
                                        </select required>
                                        @error('hotel_department')
                                            <p style="color:red;">{{$message}}</p>
                                            @enderror
                                    </div>
                                    
                                    <div class="mb-3 col-md-6">
                                    <lable>Password</lable>
                                        <input type="text" class="form-control" placeholder="Password" name="password" required/>
                                        @error('password')
                                        <p style="color:red">{{ $message }}</p>
                                    @enderror
                                    </div>
                                   
                                    <div class="mb-3 col-md-6">
                                    <lable>Confirm Password</lable>
                                        <input type="text" class="form-control" placeholder="Confirm Password"
                                            name="password_confirmation" required/>
                                            @error('password_confirmation')
                                        <p style="color:red">{{ $message }}</p>
                                    @enderror
                                        </div>
                                    
                                    <div class="mb-3">
                                        <button class="btn btn-primary rounded-pill px-4 mt-3" type="submit">
                                            <i data-feather="send" class="feather-sm ms-2 fill-white"></i>
                                            Submit
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
         $(document).on("change", "#head_department", async function(){
            let url = "{{route('backend.manager.get_hotel_list')}}";
            let head_department_id = $(this).val();
            let response = await fetch(`${url}/?head_department_id=${head_department_id}`);
            let resposeData = await response.json(); 
            let append_to_html = '<option value="">--Select Hotel--</option>'; 
            if(resposeData.status == "success"){  
                resposeData.hotel_list.forEach(element => { 
                    append_to_html += `<option value="${element.id}">${element.name}</option>`;
                }); 
                $("#hotel").html(append_to_html); 
           }
         });
    </script>

    <script>
        $(document).on("change", "#hotel", async function(){
            let url = "{{route('backend.manager.get_hotel_department_list')}}";
            let hotel_id = $(this).val();
            let response = await fetch(`${url}/?hotel_id=${hotel_id}`);
            let resposeData = await response.json();
            let append_to_html = '<option value="">--Select Hotel--</option>'; 
            if(resposeData.status == "success"){  
                resposeData.hotel_department_list.forEach(element => { 
                    append_to_html += `<option value="${element.id}">${element.name}</option>`;
                }); 
                $("#hotel_department").html(append_to_html); 
           } 
        });
    </script>

    <script>
    
    </script>


    <script> 
        $(".hotel").select2({
            placeholder: "Select Hotel",
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
