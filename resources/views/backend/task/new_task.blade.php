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
                    <li class="breadcrumb-item active" aria-current="page"><a href="{{route('admin.task.index')}}" class="link">Task</a></li> 
                    <li class="breadcrumb-item active" aria-current="page"><a href="javascript:void(0);" class="link">Assign New Task</a></li>
                 </ol>
            </nav>
                    <h1 class="mb-0 fw-bold">Assign New Task</h1>
                </div>
            </div>
        </div>
        <div class="container-fluid">
            <div class="row">
                <div class="col-12">
                    <div class="card">
                    <div class="border-bottom title-part-padding">
                     
                    </div>
                        <div class="card-body">
                            <form class="mt-4" action="{{route('admin.task.store')}}" method="POST" enctype="multipart/form-data">
                                @csrf  
                                <div class="row">
                                    <div class="mb-3 col-md-6">
                                        <lable>Select User</lable>
                                        <select name="user" required class="select2 js-programmatic form-control"  style="width: 100%; height: 36px">
                                            <option value="">Select</option> 
                                            @foreach($users as $user)
                                                <option value="{{$user->id}}">{{$user->first_name.' '.$user->last_name}}</option>
                                            @endforeach
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
                                    <div class="mb-3 col-md-6">
                                        <lable>Select Main Folder</lable>
                                        <select name="main_folder" id="main_folder" required class="select2 js-programmatic form-control"  style="width: 100%; height: 36px">
                                            <option value="">--Select--</option> 
                                             @foreach($m_f_list as $m_f)
                                                <option value="{{$m_f->id}}">{{$m_f->name}}</option>
                                             @endforeach
                                        </select>
                                        @error('main_folder')
                                            <p style="color:red;">{{$message}}</p>
                                        @enderror
                                    </div>
                                    <div class="mb-3 col-md-6">
                                        <lable>Select Sub Folder</lable>
                                        <select name="sub_folder" id="sub_folder" required class="select2 js-programmatic form-control"  style="width: 100%; height: 36px">
                                            <option value="">--Select--</option>  
                                        </select>
                                        @error('sub_folder')
                                            <p style="color:red;">{{$message}}</p>
                                        @enderror
                                    </div>
                                </div> 

                                <div class="row">
                                    <div class="mb-3 col-md-6">
                                        <lable>Select Document</lable>
                                        <select name="document_id" id="document" required class="select2 js-programmatic form-control"  style="width: 100%; height: 36px">
                                            <option value="">--Select--</option> 
                                        </select>
                                        @error('document')
                                            <p style="color:red;">{{$message}}</p>
                                        @enderror
                                    </div>
                                    <div class="col-md-6 mt-3">
                                    <lable>Start Date</lable>
                                        <input type="date" name="start_date" id="start_date" class="form-control"/>
                                        @error('start_date')
                                    <p style="color:red;">{{$message}}</p>
                                 @enderror
                                    </div> 
                                </div> 
 
                                    <div class="row">  
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
        $(document).on("change", "#main_folder", async function(){
            let main_folder_id = $(this).val(); 
            $("#sub_folder").empty();
            $("#sub_folder").append('<option valu="">--Select--</option>'); 
            let url = "{{route('api.get_s_folder_list')}}";
            let response = await fetch(`${url}?main_folder_id=${main_folder_id}`);
            let responseData = await response.json(); 
            if(responseData.status == "success"){
                responseData.sub_folder_list.forEach(element=>{
                $("#sub_folder").append(`<option value="${element.id}">${element.name}</option>`);
            });
            }else{
                alert('Something went wrong');
            } 
        });

        $(document).on("change", "#sub_folder", async function(){
            let main_folder_id =  $("#main_folder").val();
            $("#document").empty();
            $("#document").append('<option value="">--Select--</option>'); 
            let sub_folder_id = $(this).val();
            let url = "{{route('api.get_docuemnt_list')}}";
            let response = await fetch(`${url}?main_folder_id=${main_folder_id}&sub_folder_id=${sub_folder_id}`);
            let responseData = await response.json();
            if(responseData.status == "success"){ 
                responseData.document_list.forEach(element=>{
                    $("#document").append(`<option value="${element.id}">${element.document_title ?? 'No Title'} (${element.doc_file.split('.').pop().toUpperCase()})</option>`);
                });
            }else{
                alert('something went wrong');
            } 
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
