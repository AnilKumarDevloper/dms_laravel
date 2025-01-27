@extends('layouts/backend/main')
@section('main-section')
    <div class="page-wrapper">
        <div class="page-titles">
            <div class="row">
                <div class="col-lg-8 col-md-6 col-12 align-self-center d-flex flex-row align-items-center">
                    <span class="fw-bold me-3 h1">Folders :</span>
                    <span class="fw-bold h3 mb-0">{{ $folder->name }}</span>
                </div>
                <div class="col-lg-4 col-md-6 d-none d-md-flex align-items-center justify-content-end">
                    <a href="{{url('admin/folders')}}" class="btn btn-info d-flex align-items-center ms-2">
                    <i class="ri-arrow-left-line me-1"></i>
                    Back
                </a>
                </div>
            </div>
        </div>
        <div class="container-fluid">
            <div class="row">
                @foreach ($folder->folders as $value)
                    <div class="col-lg-3 g-2">
                        <div class="card-group my-1">
                            <div class="card">
                                <div class="card-body">
                                    <span
                                        class=" btn btn-xl btn-light-info text-info btn-circle d-flex align-items-center justify-content-center ">
                                        <a href="#">
                                            <i class="fa-regular fa-folder"></i>
                                        </a>
                                    </span>
                                    <h6 class="text-muted mt-3 pt-1 mb-0 fw-bold">{{ $value->folder_name }}</h6>
                                </div>
                            </div>
                        </div>
                    </div>
                @endforeach
            </div>
        </div>
    @endsection
