@extends('layouts/backend/main')
@section('main-section')

<div class="page-wrapper">
    <div class="page-titles">
        <div class="row">
            <div class="col-lg-8 col-md-6 col-12 align-self-center"> 
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb mb-0 d-flex align-items-center">
                    <li class="breadcrumb-item"><a href="{{route('dashboard')}}" class="link"><i class="ri-home-3-line fs-5"></i></a></li> 
                    <li class="breadcrumb-item active" aria-current="page">Assign Permissions</li>
                 </ol>
            </nav>
                <h1 class="mb-0 fw-bold">Assign Permissions</h1>
            </div>
        </div>
    </div>

    <div class="container-fluid">
        <form action="{{route('backend.sync_custom_permission')}}" method="POST">
            @csrf
            <input type="hidden" name="user_id" value="{{$employee->id ?? ''}}">
            <div class="form-group row">
                <div class="col-md-4">
                    <div class="form-group row">
                        <div class="col-sm-4">
                            <label for="name" class="form-label">Name :</label>
                        </div>
                        <div class="col-sm-9">
                          <p>{{$employee->name ?? ''}}</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group row">
                        <div class="col-sm-4">
                            <label for="email" class="form-label">Email :</label>
                        </div>
                        <div class="col-sm-9">
                        <p>{{$employee->email ?? ''}}</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group row">
                        <div class="col-sm-4">
                            <label for="phone" class="form-label">Phone :</label>
                        </div>
                        <div class="col-sm-9">
                           <p>{{$employee->phone ?? ''}}</p>
                        </div>
                    </div>
                </div>
            </div>
        
        <div class="card mt-3">
            <div class="card-header header-btn">
                <button type="button" class="btn btn-link" id="checkAll">CHECK ALL</button>
                <button type="button" class="btn btn-link" id="checkNone">CHECK NONE</button>
            </div>
            <div class="card-body"> 
                @foreach ($menus as $order_id => $categories)
                @foreach ($categories as $group_name => $menuList) 
                <div class="form-group row config-system">
                        <div class="col-md-2">
                            <label for="permission_ids" class="form-label">{{$group_name ?? ''}}</label>
                        </div>
                        <div class="col-md-7">
                        <div class="row">
                        @foreach ($menuList as $menu) 
                                <div class="col-sm-4">
                                    <input type="checkbox" name="permission_ids[]"  value="{{$menu->id}}" {{in_array($menu->id, $permission_list) ? 'checked':''}}>
                                    <label for="view_checkbox" class="form-label">{{$menu->display_name}}</label>
                                </div> 
                                @endforeach
                            </div>
                        </div>   
                        <div class="col-md-3 btn-col">
                            <div class="row">
                                <div class="col-sm-2 check-btn">
                                    <button type="button" class="btn btn-dark check-all-btn">all</button>
                                    <p class="divider">|</p>
                                    <button type="button" class="btn btn-dark check-none-btn">none</button>
                                </div>
                            </div>
                        </div>
                    </div> 
                    @endforeach
                    @endforeach
                    <input type="submit" value="Submit"> 
                </form>
            </div>
        </div>
    </div>
</div>

@section('javascript-section')
@if(Session::has('updated')) 
        <script>
            Swal.fire({
                title: "Success!",
                text: "{{ Session::get('updated') }}",
                icon: "success",
                timer: 5000,
            });
        </script>
@endif

<script>
    function checkAll(name) {
        const checkboxes = document.querySelectorAll(`input[name=${name}]`);
        checkboxes.forEach(checkbox => checkbox.checked = true);
    }

    function checkNone(name) {
        const checkboxes = document.querySelectorAll(`input[name=${name}]`);
        checkboxes.forEach(checkbox => checkbox.checked = false);
    }

    document.getElementById('checkAll').addEventListener('click', () => {
        const checkboxes = document.querySelectorAll('input[type=checkbox]');
        checkboxes.forEach(checkbox => checkbox.checked = true);
    });

    document.getElementById('checkNone').addEventListener('click', () => {
        const checkboxes = document.querySelectorAll('input[type=checkbox]');
        checkboxes.forEach(checkbox => checkbox.checked = false);
    });

    $(document).ready(function() {
            $('#checkAll').click(function() {
                $('input[type="checkbox"]').prop('checked', true);
            });
            $('#checkNone').click(function() {
                $('input[type="checkbox"]').prop('checked', false);
            });
            
            $('.check-all-btn').click(function() {
                $(this).closest('.form-group').find('input[type="checkbox"]').prop('checked', true);
            });
            $('.check-none-btn').click(function() {
                $(this).closest('.form-group').find('input[type="checkbox"]').prop('checked', false);
            });
        });
</script>
@endsection
@endsection