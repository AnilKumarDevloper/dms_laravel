@extends('layouts/backend/main')
@section('main-section')
    <div class="page-wrapper">
        <div class="page-titles">
            <div class="row">
                <div class="col-lg-8 col-md-6 col-12 align-self-center">
                <nav aria-label="breadcrumb">
                <ol class="breadcrumb mb-0 d-flex align-items-center">
                    <li class="breadcrumb-item"><a href="{{route('dashboard')}}" class="link"><i class="ri-home-3-line fs-5"></i></a></li> 
                    <li class="breadcrumb-item active" aria-current="page"><a href="{{route('backend.folders.index', [Crypt::encrypt($main_folder->id)])}}" class="link">{{$main_folder->name}}</a></li>
                    <!-- <li class="breadcrumb-item active" aria-current="page"><a href="{{ route('backend.folders.view_doc_list', [Crypt::encrypt($main_folder->id), Crypt::encrypt($sub_folder->id)]) }}" class="link">{{$sub_folder->name}}</a></li> -->
                    <li class="breadcrumb-item active" aria-current="page"><a href="{{ route('backend.folders.view_doc_list', [Crypt::encrypt($main_folder->id), Crypt::encrypt($sub_folder->id)]) }}" class="link">{{$sub_folder->name}}</a></li>
                    <li class="breadcrumb-item activex" aria-current="page">Assign Permission</li>
                 </ol>
            </nav>
                    <h1 class="mb-0 fw-bold">{{$main_folder->name ?? ''}}/{{$sub_folder->name ?? ''}}</h1>
                </div> 
            </div>
        </div>
        <form method="POST" action="{{route('backend_folder_permission.sync.direct')}}">
            @csrf
        <div class="container-fluid">
            <div class="row">  
                <input type="hidden" name="m_folder_id" value="{{$main_folder->id}}">
                <input type="hidden" name="s_folder_id" value="{{$sub_folder->id}}">
                <div class="col-md-6 mt-3">
                <lable>Folder Access</lable> 
                <select class="select2 form-control" multiple="multiple" name="users[]" style="height: 40px; width: 100%">
                @foreach($users as $user)
                <option value="{{$user->id}}" {{in_array($user->id, $assigned_users) ? 'selected':''}}>{{$user->name}}</option>  
                @endforeach
                </select> 
                <br><br>
                <input class="btn btn-info d-flex align-items-center ms-2" type="submit" value="Assign">
            </div> 
        </div>
        </div>
    </form>
         
    <br>
    <br>
    <br>

    <form method="POST" action="{{route('backend_folder_permission.sync.file_upload_accesss')}}">
            @csrf
        <div class="container-fluid">
            <div class="row">  
                <input type="hidden" name="m_folder_id" value="{{$main_folder->id}}">
                <input type="hidden" name="s_folder_id" value="{{$sub_folder->id}}">
            <div class="col-md-6 mt-3">
                <lable>File Upload Access</lable> 
                <select class="select2 form-control" multiple="multiple" name="users[]" style="height: 40px; width: 100%">
                @foreach($users as $user)
                <option value="{{$user->id}}" {{in_array($user->id, $assigned_users_upload_access) ? 'selected':''}}>{{$user->name}}</option>  
                @endforeach
                </select> 
                <br><br>
                <input class="btn btn-info d-flex align-items-center ms-2" type="submit" value="Assign">
            </div> 
        </div>
        </div>
    </form>
@endsection


@section('javascript-section')
<script>
    
</script> 
    @if(Session::has('foler_permission_synced'))
    <script>
        Swal.fire({
            title: "Success!",
            text: "{{ Session::get('foler_permission_synced') }}",
            icon: "success",
            timer: 5000,
        });
    </script>
    @elseif(Session::has('folder_permission_synced'))
    <script>
        Swal.fire({
            title: "Success!",
            text: "{{ Session::get('folder_permission_synced') }}",
            icon: "success",
            timer: 5000,
        });
    </script>
@endif



@endsection
