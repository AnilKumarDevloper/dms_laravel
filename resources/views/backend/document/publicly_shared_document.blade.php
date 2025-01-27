<style>
    .ro_ss{
       display: flex;
       flex-wrap: wrap;
       gap: 2%;
    }
    .w_20{
        width: 18%;
        margin: .5rem 0;
    }
    .card{
        border: none !important;
    }
    .btn-info{
        background-color: #253a76 !important;
        border-color: #253a76 !important;
    } 
</style> 
@extends('layouts/backend/main')
@section('main-section')
    <div class="page-wrapper">

        <div class="page-titles">
            <div class="row">
                <div class="col-lg-8 col-md-6 col-12 align-self-center">
                <nav aria-label="breadcrumb">
                <ol class="breadcrumb mb-0 d-flex align-items-center">
                    <li class="breadcrumb-item"><a href="{{route('dashboard')}}" class="link"><i class="ri-home-3-line fs-5"></i></a></li> 
                    <li class="breadcrumb-item" aria-current="page"><a href="{{route('backend.folders.index', [Crypt::encrypt($document->main_folder_id)])}}" class="link">{{$document->getMainFolder?->name ?? ''}}</a></li>
                    <li class="breadcrumb-item" aria-current="page"><a href="{{ route('backend.folders.view_doc_list', [Crypt::encrypt($document->getMainFolder?->id), Crypt::encrypt($document->getSubFolder?->id)]) }}" class="link">{{$document->getSubFolder?->name ?? ''}}</a></li>
                     <li class="breadcrumb-item" aria-current="page"><a href="{{ route('backend.folders.view_doc_list', [Crypt::encrypt($document->getMainFolder?->id), Crypt::encrypt($document->getSubFolder?->id)]) }}" class="link">{{$document->document_title ?? 'No Title'}}</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Share Document</li>
                </ol>
            </nav>
                    <h1 class="mb-0 fw-bold">{{$main_folder->name ?? ''}}</h1>
                </div>
                 
            </div>
        </div>
        <div class="container-fluid">
            <form method="POST" action="{{route('backend.create_publicly_shared_url_send')}}">
                @csrf
            <div class="row">
                <div class="col-md-6">
                    <lable>Enter Multiple Email Separate by (,)</lable>
                    <input type="text" class="form-control" name="email" placeholder="example:- abc@test.com, abc2@test.com" required>
                </div>
                <div class="col-md-6">
                    <lable>Link valid untill</lable>
                    <input type="date" class="form-control" name="date" id="validation_date" placeholder="Select Date">
                </div>
                <div class="col-md-6"></div>
                <br>
                <div class="col-md-6">
                    <input type="hidden" name="doc_id" value="{{$decrypt_id}}">
                    <input type="submit" class="btn btn-primary">
                </div>
        </div>
    </form>
            
        </div>


         
@endsection


@section('javascript-section')
    <script> 
        const today = new Date().toISOString().split('T')[0];
        document.getElementById('validation_date').setAttribute('min', today); 
    </script>
@if (Session::has('success'))
    <script>
        Swal.fire({
            title: "Success!",
            text: "{{ Session::get('success') }}",
            icon: "success",
            timer: 5000,
        });
    </script>
@elseif(Session::has('update'))
    <script>
        Swal.fire({
            title: "Success!",
            text: "{{ Session::get('update') }}",
            icon: "success",
            timer: 5000,
        });
    </script>
@elseif(Session::has('warning'))
    <script>
        Swal.fire({
            title: "Warning!",
            text: "{{ Session::get('warning') }}",
            icon: "warning",
            timer: 5000,
        });
    </script>
    @elseif(Session::has('error'))
    <script>
        Swal.fire({
            title: "Error!",
            text: "{{ Session::get('error') }}",
            icon: "error",
            timer: 5000,
        });
    </script>
@endif



@endsection
