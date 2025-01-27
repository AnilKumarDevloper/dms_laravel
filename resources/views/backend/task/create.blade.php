@extends('layouts/backend/main')
@section('main-section')


<style>
    .select2-container--default .select2-selection--multiple .select2-selection__choice__remove {
        color: #ffffff;
    
    } 
    .select2-container--default .select2-selection--multiple .select2-selection__choice {
        background-color:#0bb2fb;
        border: 1px solid #0bb2fb;
    } 
    .js-example-basic-multiple {
        width: 100%; 
        box-sizing: border-box; 
    } 
    .js-example-basic-multiple option {
        white-space: nowrap; 
    } 
</style>
    <div class="page-wrapper">
        <div class="page-titles">
            <div class="row">
                <div class="col-lg-8 col-md-6 col-12 align-self-center">
                <nav aria-label="breadcrumb">
                <ol class="breadcrumb mb-0 d-flex align-items-center">
                    <li class="breadcrumb-item"><a href="{{route('dashboard')}}" class="link"><i class="ri-home-3-line fs-5"></i></a></li> 
                    <li class="breadcrumb-item" aria-current="page"><a href="{{route('backend.folders.index', [Crypt::encrypt($document->main_folder_id)])}}" class="link">{{$document->getMainFolder?->name ?? ''}}</a></li>
                    <li class="breadcrumb-item" aria-current="page"><a href="{{ route('backend.folders.view_doc_list', [Crypt::encrypt($document->getMainFolder?->id), Crypt::encrypt($document->getSubFolder?->id)]) }}" class="link">{{$document->getSubFolder?->name ?? ''}}</a></li>
                     <li class="breadcrumb-item" aria-current="page">Upload New File</li>
                    <li class="breadcrumb-item active" aria-current="page">Assign Task</li>
                 </ol>
            </nav>
                    <h1 class="mb-0 fw-bold">Assign Task</h1>
                </div>
            </div>
        </div>
        <div class="container-fluid">
            <div class="row">
                <div class="col-12">
                    <div class="card">
                    <div class="border-bottom title-part-padding">
                    
                        <h4>{{$document->document_title ?? 'No Title'}}</h4>
                    </div>
                        <div class="card-body">
                            <form class="mt-4" action="{{route('admin.task.store')}}" method="POST" enctype="multipart/form-data">
                                @csrf 
                                <input type="hidden" name="document_id" value="{{$document->id}}">
                                <div class="row">
                                    <div class="mb-3 col-md-6">
                                        <lable>Select User</lable>
                                        <select name="user" required class="select2 js-programmatic form-control"  style="width: 100%; height: 36px">
                                            <option value=" ">Select</option> 
                                            @if(count($users) > 0)
                                            @foreach($users as $user)
                                            <option value="{{$user->id}}">{{$user->name}}</option> 
                                            @endforeach 
                                            @endif 
                                        </select>
                                        @error('user')
                                            <p style="color:red;">{{$message}}</p>
                                        @enderror
                                    </div>
                                    <div class="mb-3 col-md-6">
                                        <lable>Description</lable>
                                        <textarea class="form-control" name="description"></textarea>
                                        @error('user')
                                            <p style="color:red;">{{$message}}</p>
                                        @enderror
                                    </div>
                                </div> 
 
                                    <div class="row"> 
                                    <div class="col-md-6 mt-3">
                                    <lable>Start Date</lable>
                                        <input type="date" name="start_date" id="start_date" class="form-control"/>
                                        @error('start_date')
                                    <p style="color:red;">{{$message}}</p>
                                 @enderror
                                    </div>  
                                    <div class="col-md-6 mt-3">
                                    <lable>End Date</lable>
                                        <input type="date" name="end_date" id="end_date" class="form-control"/>
                                        @error('end_date')
                                    <p style="color:red;">{{$message}}</p>
                                 @enderror
                                    </div>  
                                    <div class="mt-3">
                                        <button
                                            class=" btn rounded-pill px-4 btn-light-success text-success font-weight-medium waves-effect waves-light "
                                            type="submit">
                                            <i data-feather="send" class="feather-sm ms-2 fill-white"></i>
                                            Assign
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
        $("#department").select2({
            placeholder: "Select Department",
        }); 
        $("#sub_folder").select2({
            placeholder: "Select Folder",
        }); 
        
        $(document).ready(function() {
            const $startDateInput = $('#start_date');
            const $endDateInput = $('#end_date'); 
            $endDateInput.prop('disabled', true); 
            const today = new Date().toISOString().split('T')[0];
            $startDateInput.attr('min', today); 
            $startDateInput.on('change', function() {
                const startDateValue = $(this).val();
                if (startDateValue) {
                    $endDateInput.prop('disabled', false);
                    $endDateInput.attr('min', startDateValue);
                } else {
                    $endDateInput.prop('disabled', true);
                }
            });
        });
    </script>
     
    <script>
        @if(Session::has('success'))
            Swal.fire({
                title: "Success!",
                text: "{{Session::get('success')}}",
                icon: "success"
            });
        @endif
    </script>

@endsection
@endsection
