@extends('layouts/backend/main')
@section('main-section')
<div class="page-wrapper">
    <div class="page-titles">
        <div class="row">
            <div class="col-lg-8 col-md-6 col-12 align-self-center">
                <nav aria-label="breadcrumb">
                </nav>
                <h1 class="mb-0 fw-bold">Add Department</h1>
            </div>
        </div>
    </div>
    <div class="container-fluid">
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-body">
                        <form class="mt-4" method="POST" action="">
                            <input type="hidden" name="_token" value="Qr6tILrsBhlY0ldLUO6DXhi9e1y288W2ULnym1Qt" autocomplete="off">
                            <div class="row">
                                <div class="mb-3 col-md-6">
                                    <input type="text" class="form-control" placeholder="Department Name" name="department_name" required />
                                </div>

                                <div class="mb-3 col-md-6">
                                <select name="department" required class="select2 js-programmatic form-control"  style="width: 100%; height: 36px">
                                <option ></option>
                                <option value="3">Active</option>
                                <option value="4">Inactive</option>
                             </select>
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
    $(".js-programmatic").select2({
        placeholder: "Status",
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
