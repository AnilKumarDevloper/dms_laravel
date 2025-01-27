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
        <form action="{{route('backend.folder_permission.sync')}}" method="POST">
            @csrf
            <input type="hidden" name="user_id" value="{{Crypt::encrypt($user->id) ?? ''}}">
            <input type="hidden" name="user_email" value="{{$user->email}}">
            <div class="form-group row">
                <div class="col-md-4">
                    <div class="form-group row">    
                        <div class="col-sm-4">
                            <label for="name" class="form-label">Name :</label>
                        </div>
                        <div class="col-sm-9">
                          <p>{{$user->name ?? ''}}</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group row">
                        <div class="col-sm-4">
                            <label for="email" class="form-label">Email :</label>
                        </div>
                        <div class="col-sm-9">
                            <p>{{$user->email ?? ''}}</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4">
                    <div class="form-group row">
                        <div class="col-sm-4">
                            <label for="phone" class="form-label">Phone :</label>
                        </div>
                        <div class="col-sm-9">
                           <p>{{$user->phone ?? ''}}</p>
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
            @php 
                $auth_user_permission_folder = App\Models\Backend\UserMainFolderPermission::where('user_id', Auth::user()->id)->pluck('main_folder_id')->toArray();
            @endphp

            @foreach($main_folder_permission_list as $main_folderorder_id => $main_folder_permissions)
                @if(Auth::user()->role_type_id != 1)
                      @if(in_array($main_folder_permissions->main_folder_id, $auth_user_permission_folder)) 
                        <div class="form-group row config-system">
                            <div class="col-md-2">
                                <input type="checkbox" class="main_folder_checkbox" name="main_folder_permission_ids[]"  value="{{$main_folder_permissions->main_folder_id}}" 
                                {{in_array($main_folder_permissions->main_folder_id, $user_main_folder_assigned_permission_list) ? 'checked':''}}>
                                <label for="main_folder_permission_ids" class="form-label">{{$main_folder_permissions->name}}</label>
                            </div>
                            <div class="col-md-7">
                                <div class="row">
                                    @foreach($sub_folder_permission_list as $folder_permission)
                                        @if($folder_permission->main_folder_id == $main_folder_permissions->main_folder_id)
                                            <div class="col-sm-4">
                                                <input type="checkbox" class="sub-folder-checkbox" name="sub_permission_ids[]"  value="{{$folder_permission->sub_folder_id}}" 
                                                {{in_array($folder_permission->sub_folder_id, $user_folder_assigned_permission_list) ? 'checked':''}}>
                                                <label for="view_checkbox" class="form-label">{{$folder_permission->name}}</label>
                                            </div> 
                                        @endif
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
                    @endif
                     
                @else
                    <div class="form-group row config-system"> 
                        <div class="col-md-2">
                            <input type="checkbox" class="main_folder_checkbox" name="main_folder_permission_ids[]"  value="{{$main_folder_permissions->main_folder_id}}" 
                            {{in_array($main_folder_permissions->main_folder_id, $user_main_folder_assigned_permission_list) ? 'checked':''}}>
                            <label for="main_folder_permission_ids" class="form-label">{{$main_folder_permissions->name}}</label>
                        </div> 
                        <div class="col-md-7">
                            <div class="row">
                                @foreach($sub_folder_permission_list as $sub_folder_permission)
                                    @if($sub_folder_permission->main_folder_id == $main_folder_permissions->main_folder_id)
                                        <div class="col-sm-4">
                                            <input type="checkbox" class="sub-folder-checkbox" name="sub_permission_ids[]"  value="{{$sub_folder_permission->sub_folder_id}}" 
                                            {{in_array($sub_folder_permission->sub_folder_id, $user_folder_assigned_permission_list) ? 'checked':''}}>
                                            <label for="view_checkbox" class="form-label">{{$sub_folder_permission->name}}</label>
                                        </div> 
                                    @endif
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
                @endif
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
 
    $('.main_folder_checkbox').on('change', function() {
        let mainCheckbox = $(this); 
        var container = mainCheckbox.closest('.config-system');
        var subCheckboxes = container.find('.sub-folder-checkbox');
        if(mainCheckbox.is(':checked')){
            subCheckboxes.prop('checked', true);
        }else{
            subCheckboxes.prop('checked', false);
        }
    }); 
    $('.sub-folder-checkbox').on('change', function() {
        var container = $(this).closest('.config-system');
        var mainCheckbox = container.find('.main_folder_checkbox');
        var subCheckboxes = container.find('.sub-folder-checkbox');
        if(subCheckboxes.filter(':checked').length > 0){ 
            mainCheckbox.prop('checked', true);
        }else{
            mainCheckbox.prop('checked', false);
        }
    });
 
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

    $(document).ready(function(){
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