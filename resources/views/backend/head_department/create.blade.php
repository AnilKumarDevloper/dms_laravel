@extends('layouts/backend/main')
@section('main-section')
    <div class="page-wrapper">
        <div class="page-titles">
            <div class="row">
                <div class="col-lg-8 col-md-6 col-12 align-self-center">
                <nav aria-label="breadcrumb">
                        <ol class="breadcrumb mb-0 d-flex align-items-center">
                            <li class="breadcrumb-item"><a href="{{route('dashboard')}}" class="link"><i class="ri-home-3-line fs-5"></i></a></li> 
                            <li class="breadcrumb-item active" aria-current="page"><a href="{{route('backend.head_department.index')}}" class="link">Head Department</a></li>
                            <li class="breadcrumb-item active" aria-current="page">Create</li>
                        </ol>
                    </nav>
                    <h1 class="mb-0 fw-bold">Add Department Head</h1>
                </div>
            </div>
        </div>
        <div class="container-fluid">
            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-body">
                            <form class="mt-4" method="POST" action="{{route('backend.head_department.store')}}">
                                @csrf
                                <div class="row">
                                    <div class="mb-3 col-md-6">
                                        <label>User Name</label>
                                        <input type="text" class="form-control" placeholder="User Name" name="name" required value="{{old('name')}}"/>
                                        @error('name')
                                        <p style="color:red;">{{$message}}</p>
                                        @enderror
                                    </div>
                                    <div class="mb-3 col-md-6">
                                    <label>User Email</label>
                                        <input type="email" class="form-control" placeholder="User Email" name="email" required value="{{old('email')}}"/>
                                        @error('email')
                                        <p style="color:red;">{{$message}}</p>
                                        @enderror
                                    </div>
                                    <div class="mb-3 col-md-6">
                                    <label>User Phone number</label>
                                        <input type="tel" class="form-control" id="desig" placeholder="User Phone" name="phone" required {{old('phone')}} maxlength="10"/>
                                        @error('phone')
                                        <p style="color:red;">{{$message}}</p>
                                        @enderror
                                    </div>

                                    <div class="mb-3 col-md-6">
                                    <label>Select Department</label>
                                    <select name="department" required class="select2 js-programmatic form-control"  style="width: 100%; height: 36px">
                                    <option value=""></option>
                                    @foreach ($head_departments as $department)
                                    <option value="{{$department->id}}">{{$department->name ?? ''}}</option>
                                    @endforeach
                                 </select>
                                 @error('department')
                                    <p style="color:red;">{{$message}}</p>
                                @enderror
                                    </div>

<!--                                     
                                    <div class="mb-3 col-md-6">
                                    <label>User Password</label>
                                        <input type="text" class="form-control" placeholder="Password" name="password" required />
                                    </div>
                                    @error('password')
                                    <p style="color:red">{{$message}}</p>
                                    @enderror
                                    <div class="mb-3 col-md-6">
                                    <label>Confirm Password</label> 
                                        <input type="text" class="form-control" placeholder="Confirm Password" name="password_confirmation" required />
                                    </div>
                                    @error('confirm_password')
                                    <p style="color:red">{{$message}}</p>
                                    @enderror -->


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
    $(".js-programmatic").select2({
        placeholder: "Select Department",
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
