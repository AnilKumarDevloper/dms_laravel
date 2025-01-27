@extends('layouts/backend/main')
@section('main-section')
    <div class="page-wrapper">
        <div class="container-fluid">
            <div class="row">
                <div class="col-12">
                <div class="page-titles">
            <div class="row">
                <div class="col-lg-8 col-md-6 col-12 align-self-center">

                <nav aria-label="breadcrumb">
                <ol class="breadcrumb mb-0 d-flex align-items-center">
                  <li class="breadcrumb-item"><a href="{{route('dashboard')}}" class="link"><i class="ri-home-3-line fs-5"></i></a></li>
                  <li class="breadcrumb-item" aria-current="page"><a href="{{route('backend.department.index')}}" class="link">All Department</a></li>
                  <li class="breadcrumb-item active" aria-current="page">Edit</li>
                </ol>
              </nav>
                    <h1 class="mb-0 fw-bold">Edit Department</h1>
                </div>
            </div>
        </div>
                    <div class="card">
                        
                        <div class="card-body">
                            <form action="{{route('backend.department.update',[$role_name->id])}}">
                                @csrf
                                <div class="row">
                                    <div class="col-md-4 mb-3">
                                        <label for="validationDefault02">Department Full Name</label>
                                        <input type="text" class="form-control" id="validationDefault02" name="department_full_name"
                                            placeholder="Department Name" value="{{$role_name->name}}" required/>
                                        @error('department_full_name')
                                        <p style="color:red;">{{$message}}</p>
                                        @enderror
                                    </div>
                                    <div class="col-md-4 mb-3">
                                        <label for="validationDefault02">Department Short Name</label>
                                        <input type="text" class="form-control" id="validationDefault02" name="department_short_name"
                                            placeholder="Short Name" value="{{$role_name->short_name}}" required/>
                                        @error('department_short_name')
                                        <p style="color:red;">{{$message}}</p>
                                        @enderror
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6 mb-3">
                                        <button class="btn btn-primary rounded-pill px-4 mt-3" type="submit">
                                            Submit
                                        </button>
                                        <a href="{{ route('backend.department.index') }}"
                                            class="btn btn-danger rounded-pill px-4 mt-3">Cancle</a>
                                    </div>
                                </div>
                            </form>

                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
@endsection
