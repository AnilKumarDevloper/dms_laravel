@extends('layouts/backend/main')
@section('main-section')
    <div class="page-wrapper">
        <div class="page-titles">
            <div class="row">
                <div class="col-lg-8 col-md-6 col-12 align-self-center">
                    <nav aria-label="breadcrumb">
                    </nav>
                    <h1 class="mb-0 fw-bold">Add Entry</h1>
                </div>
            </div>
        </div>
        <div class="container-fluid">
            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-body">
                            <form class="mt-4" method="POST" action="{{ route('backend.database_entry.create') }}">
                                @csrf
                                <div class="row">
                                    <div class="mb-3 col-md-6">
                                        <input type="text" class="form-control" placeholder="Name" name="name" />
                                    </div>
                                    <div class="mb-3 col-md-6">
                                        <input type="text" class="form-control" placeholder="display_name"
                                            name="display_name" />
                                    </div>
                                    <div class="mb-3 col-md-6">
                                        <input type="text" class="form-control" placeholder="description"
                                            name="description" />
                                    </div>
                                    <div class="mb-3 col-md-6">
                                        <input type="text" class="form-control" placeholder="url" name="url" />
                                    </div>
                                    <div class="mb-3 col-md-6">
                                        <input type="text" class="form-control" placeholder="permission_name"
                                            name="permission_name" />
                                    </div>
                                    <div class="mb-3 col-md-6">
                                        <input type="text" class="form-control" placeholder="route_name"
                                            name="route_name" />
                                    </div>
                                    <div class="mb-3 col-md-6">
                                        <input type="text" class="form-control" placeholder="order" name="order" />
                                    </div>
                                    <div class="mb-3 col-md-6">
                                        <input type="text" class="form-control" placeholder="parent_menu_id"
                                            name="parent_menu_id" />
                                    </div>
                                    <div class="mb-3">
                                        <button
                                            class=" btn rounded-pill px-4 btn-light-success text-success font-weight-medium waves-effect waves-light "
                                            type="submit">
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
    @if (Session::has('success'))
        <script>
            Swal.fire({
                title: "Success!",
                text: "{{ Session::get('success') }}",
                icon: "success",
                timer: 5000,

            });
        </script>
    @endif
    <script>
        $(document).on("change", "#changeStatus", function() {
            var $toggleButton = $(this);

            var status = $toggleButton.prop('checked') ? '1' : '0';
            let id = $(this).data('id');
            $.ajax({

                url: "{{ route('backend.employee.update_status') }}",
                data: {
                    'status': status,
                    'id': id
                },
                type: "GET",
                success: function(response) {
                    if (response.status == 200) {
                        Swal.fire({
                            title: "Success!",
                            text: "Status successfully updated.",
                            icon: "success"
                        });
                    }
                }
            });
        });
    </script>
@endsection
@endsection
