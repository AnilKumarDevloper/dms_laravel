@extends('layouts/backend/main')
@section('main-section')
    <div class="page-wrapper">
        <div class="page-titles">
            <div class="row">
                <div class="col-lg-8 col-md-6 col-12 align-self-center">
                <nav aria-label="breadcrumb">
                        <ol class="breadcrumb mb-0 d-flex align-items-center">
                            <li class="breadcrumb-item"><a href="{{route('dashboard')}}" class="link"><i class="ri-home-3-line fs-5"></i></a></li> 
                            <li class="breadcrumb-item active" aria-current="page"><a href="{{route('backend.unit.index')}}" class="link">Units</a></li>
                            <li class="breadcrumb-item active" aria-current="page">Create</li>
                        </ol>
                    </nav>
                    <h1 class="mb-0 fw-bold">Add Unit</h1>
                </div>
            </div>
        </div>
        <div class="container-fluid">
            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-body">
                            <form class="mt-4" method="POST" action="{{ route('backend.unit.store') }}" id="add_unit_form">
                                @csrf
                                <div class="row">
                                    <div class="mb-3 col-md-6">
                                        <lable>Name</lable>
                                        <input type="text" class="form-control" placeholder="Name"
                                            name="name" id="name" value="{{old('name')}}" oninput="capitalizeEachWord(this); allowOnlyLetters(event);"   maxlength="30"/>
                                            <p style="color:red" id="name_error"></p> 
                                            @error('name')
                                             <p style="color:red">{{ $message }}</p>
                                            @enderror
                                    </div>

                                    <div class="mb-3 col-md-6">
                                        <lable>State</lable> 
                                        <select id="state" placeholder="State" style="width:100%;"
                                            name="state" id="state" value="{{old('state')}}" class="select2 form-control" onchange="getCity();">
                                            <option value="">--Select State--</option>
                                            @foreach($states as $state)
                                                <option value="{{$state->id}}">{{$state->name ?? ''}}</option>
                                            @endforeach
                                            </select>
                                            <p style="color:red" id="state_error"></p>  
                                            @error('state')
                                             <p style="color:red">{{ $message }}</p>
                                            @enderror
                                    </div>

                                    <div class="mb-3 col-md-6">
                                        <lable>City</lable> 
                                        <select id="city" placeholder="City" style="width:100%;"
                                            name="city" id="city" value="{{old('city')}}" class="select2 form-control">
                                            <option value="">--Select City--</option>  
                                            </select>
                                            <p style="color:red" id="city_error"></p>  
                                            @error('city')
                                             <p style="color:red">{{ $message }}</p>
                                            @enderror
                                    </div>
                                     
                                    <div class="mb-3 col-md-6">
                                    <lable>Address</lable> 
                                        <input type="text" class="form-control" id="address" placeholder="Address"
                                            name="address" id="address" value="{{old('address')}}"/>
                                            <p style="color:red" id="address_error"></p>  
                                            @error('address')
                                             <p style="color:red">{{ $message }}</p>
                                            @enderror
                                    </div>  
                                    <div class="mb-3">
                                        <button class="btn btn-primary rounded-pill px-4 mt-3" id="submit_btn">
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
        async function getCity(){
            $("#city").empty();
            const state_id = $("#state").val();
            const url = "{{route('backend.get_city')}}";
            let response = await fetch(`${url}?state_id=${state_id}`);
            let responseData = await response.json(); 
            $("#city").append(`<option value="">--Select City--</option>`)
            if(responseData.status == "success"){
                responseData.cities.forEach(function(city){
                    $("#city").append(`<option value="${city.name}">${city.name}</option>`)
                });
            }
        }

       $(document).on("click", "#submit_btn", async function(e){
            e.preventDefault(); 
            let name = $("#name").val();
            let state = $("#state").val();
            let city = $("#city").val();
            let address = $("#address").val();
            let error_flag = false;
            $('#name_error').text('');   
            $("#state_error").text('');
            $("#city_error").text('');
            $("#address_error").text(''); 
            if(name == ''){
                $("#name_error").text('Name is required.');
                error_flag = true;
            }
            if(state == ''){
                $("#state_error").text("State is required.");
                error_flag = true;
            }
            if(city == ''){
                $("#city_error").text("City is required.");
                error_flag = true;
            }
            if(address == ''){
                $("#address_error").text("Address is required.");
                error_flag = true;
            }  
            if(error_flag == true){
                return false;
            }else{
                let url = "{{route('api.check_unit_existence')}}";
                let response = await fetch(`${url}?name=${name}&city=${city}`);
                let responseData = await response.json();
                console.log(responseData);
                if(responseData.status == "unit_already_exist"){
                    $("#name_error").text('Unit is already exist.');
                    return false;
                }else if(responseData.status == "success"){
                    $("#add_unit_form").submit();
                }
            }
       });
    </script> 
    @if(Session::has('already_exist'))
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
