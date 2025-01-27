@extends('layouts/backend/main')
@section('main-section')

<div class="page-wrapper">
    <div class="page-titles">
        <div class="row">
            <div class="col-lg-8 col-md-6 col-12 align-self-center">
                <h4 class="text-muted mb-0 fw-normal">Welcome {{Auth::user()->name}}</h4>
                <h1 class="mb-0 fw-bold">Employees for Testing</h1>
            </div>
            <div class="
                col-lg-4 col-md-6
                d-none d-md-flex
                align-items-center
                justify-content-end
              ">
                 
            </div>
        </div>
    </div>
    <div class="container-fluid">
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-body">
                        <div class="table-responsive">
                            <table id="zero_config" class="table table-striped table-bordered text-nowrap">
                                <thead>
                                    <tr>
                                        <th>SN</th>
                                        <th>Name</th>
                                        <th>Email</th> 
                                        <th>Department</th>
                                        <!-- <th>status</th> -->
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @php  
                                    $count = '1';
                                    @endphp
                                    @foreach ($roles as $user)
                                    <tr>
                                        <td> {{$count++}}</td>
                                        <td>{{$user->name}}</td>
                                        <td>{{$user->email}}</td> 
                                        <td>{{$user->getDepartment->name ?? ''}}</td>
                                        <!-- <td>
                                            <div class="form-check form-switch">
                                                <input class="form-check-input"
                                                    {{ $user->status === 1 ? 'checked' : '' }}
                                                    value="{{$user->status}}" type="checkbox" id="changeStatus"
                                                    data-id="{{$user->id}}"
                                                    data-status="{{$user->status}}" />
                                            </div>
                                        </td> -->
                                        <td>
                                            <div class="button-container">
                                                <a href="{{route('backend.assign_custom_permission', [$user->id])}}">Permission</a> |
                                                <a href="{{route('backend.assign_folder_permission.assign', [$user->id])}}">Folder Permission</a>
                                                 
                                            </div>
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
 
@endsection
@endsection
