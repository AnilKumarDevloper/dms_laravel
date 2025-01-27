@extends('layouts/backend/main')
@section('main-section')
    <div class="page-wrapper">
        <div class="page-titles">
            <div class="row">
                <div class="col-lg-8 col-md-6 col-12 align-self-center">
                <nav aria-label="breadcrumb">
                        <ol class="breadcrumb mb-0 d-flex align-items-center">
                            <li class="breadcrumb-item"><a href="{{route('dashboard')}}" class="link"><i class="ri-home-3-line fs-5"></i></a></li> 
                            <li class="breadcrumb-item active" aria-current="page"><a href="{{route('backend.hotel.index')}}" class="link">Units</a></li>
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
                            <form class="mt-4" method="POST" action="{{ route('backend.hotel.store') }}">
                                @csrf
                                <div class="row">
                                    <div class="mb-3 col-md-6">
                                        <input type="text" class="form-control" placeholder="Name"
                                            name="name" value="{{old('name')}}"/>
                                            @error('name')
                                             <p style="color:red">{{ $message }}</p>
                                            @enderror
                                    </div>
                                      
                                    <div class="mb-3 col-md-6">
                                        <input type="tel" class="form-control" id="phone" placeholder="Phone"
                                            name="phone" value="{{old('phone')}}" maxlength="10"/>
                                            @error('phone')
                                             <p style="color:red">{{ $message }}</p>
                                            @enderror
                                    </div>

                                    <div class="mb-3 col-md-6">
                                        <input type="email" class="form-control" id="email" placeholder="Email"
                                            name="email" value="{{old('email')}}"/>
                                            @error('email')
                                             <p style="color:red">{{ $message }}</p>
                                            @enderror
                                    </div>
                                    <div class="mb-3 col-md-6">
                                        <input type="text" class="form-control" id="hotel_location" placeholder="Hotel Location"
                                            name="hotel_location" value="{{old('hotel_location')}}"/>
                                            @error('hotel_location')
                                             <p style="color:red">{{ $message }}</p>
                                            @enderror
                                    </div>
                                    <div class="mb-3 col-md-6">
                                        <select name="head_department" required
                                            class="select2 js-programmatic-deparment form-control"
                                            style="width: 100%; height: 36px">
                                            <option value=""></option>
                                            @if (count($head_departments) > 0)
                                                @foreach ($head_departments as $head_department)
                                                    <option value="{{ $head_department->id ?? '' }}" {{count($head_departments) == 1 ? 'selected':''}}>
                                                        {{$head_department->name}} - {{ $head_department->getDepartmentType->name }}</option>
                                                @endforeach
                                            @endif
                                        </select>
                                        @error('head_department')
                                        <p style="color:red">{{ $message }}</p>
                                        @enderror
                                    </div>

                                    <!-- <div class="mb-3 col-md-6">
                                        <input type="text" class="form-control" placeholder="Password" name="password"
                                             /> 
                                            @error('password')
                                            <p style="color:red">{{ $message }}</p>
                                            @enderror
                                        </div> -->
                                    <!-- <div class="mb-3 col-md-6">
                                        <input type="text" class="form-control" placeholder="Confirm Password"
                                            name="password_confirmation" />
                                            @error('password_confirmation')
                                            <p style="color:red">{{ $message }}</p>
                                            @enderror
                                    </div> -->
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
        $(".js-programmatic-deparment").select2({
            placeholder: "Select an deparment",
        });
    </script>
@endsection
@endsection
