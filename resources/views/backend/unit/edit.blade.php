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
                            <li class="breadcrumb-item active" aria-current="page">Edit</li>
                        </ol>
                    </nav>
                    <h1 class="mb-0 fw-bold">Edit Unit</h1>
                </div>
            </div>
        </div>
        <div class="container-fluid">
            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-body">
                            <form class="mt-4" method="POST" action="{{route('backend.unit.update', [$unit->id])}}">
                                @csrf
                                <div class="row">
                                    <div class="mb-3 col-md-6">
                                        <lable>Name</lable>
                                        <input type="text" class="form-control" placeholder="Name" value="{{$unit->name}}" name="name" oninput="capitalizeEachWord(this); allowOnlyLetters(event);" maxlength="30" />
                                            @error('name')
                                             <p style="color:red">{{ $message }}</p>
                                            @enderror   
                                    </div>

                                    <div class="mb-3 col-md-6">
                                        <lable>State</lable> 
                                        <select id="state" placeholder="State" style="width:100%;"
                                            name="state" value="{{old('state')}}" class="select2 form-control" onchange="getCity();" required>
                                            <option value="">--Select State--</option>
                                            @foreach($states as $state)
                                                <option value="{{$state->id}}" {{$state->name == $unit->state ? "selected":""}}>{{$state->name ?? ''}}</option>
                                            @endforeach
                                            </select>
                                            @error('state')
                                             <p style="color:red">{{ $message }}</p>
                                            @enderror
                                    </div>

                                    <div class="mb-3 col-md-6">
                                        <lable>City</lable> 
                                        <select id="city" placeholder="City" style="width:100%;"
                                            name="city" value="{{old('city')}}" class="select2 form-control" required>
                                            <option value="">--Select City--</option>  
                                            @foreach($cities as $city)
                                            <option value="{{$city->name}}" {{$city->name == $unit->city ? "selected":""}}>{{$city->name ?? ''}}</option>
                                            @endforeach
                                            </select>
                                            @error('city')
                                             <p style="color:red">{{ $message }}</p>
                                            @enderror
                                    </div>
                                     
                                    <div class="mb-3 col-md-6">
                                    <lable>Address</lable> 
                                        <input type="text" class="form-control" id="address" placeholder="Address"
                                            name="address" value="{{$unit->location ?? ''}}" required/>
                                            @error('address')
                                             <p style="color:red">{{ $message }}</p>
                                            @enderror
                                    </div>  
                                       
                                    <!-- <div class="mb-3 col-md-6">
                                    <lable>Location</lable>
                                        <input type="text" class="form-control" id="location" placeholder="Location" value="{{$unit->location}}" name="location" />
                                            @error('location')
                                             <p style="color:red">{{ $message }}</p>
                                            @enderror
                                    </div> -->
 
                                    <div class="mb-3">
                                        <button class="btn btn-primary rounded-pill px-4 mt-3" type="submit"><i data-feather="send" class="feather-sm ms-2 fill-white"></i>Update</button>
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
