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
                  <li class="breadcrumb-item">
                    <a href="{{route('dashboard')}}" class="link"><i class="ri-home-3-line fs-5"></i></a>
                  </li>
                  <li class="breadcrumb-item" aria-current="page">
                    <a href="{{route('backend.document.index')}}" class="link">All Document</a>
                  </li>
                  <li class="breadcrumb-item active" aria-current="page">
                    Create
                  </li>
                </ol>
              </nav>
                    <h1 class="mb-0 fw-bold">Add Document</h1>
                </div>
            </div>
        </div>
        <div class="container-fluid">
            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-body">
                            <form class="mt-4" action="{{route('backend.document.store')}}" method="POST" enctype="multipart/form-data">
                                @csrf
                                <div class="row">
                                    <div class="mb-3 col-md-6">
                                        <lable>Document Title</lable>
                                        <input type="text" class="form-control" name="document_title" id="document_title" placeholder="Document Title" value="{{old('document_title')}}"/>
                                        <p style="color:red; display:none;" id="title_exist_error">The title you have entered is already exists.</p>
                                        @error('document_title')
                                            <p style="color:red">{{ $message }}</p>
                                        @enderror
                                    </div>
                                      
                                    <div class="col-md-6 mt-3">
                                    <lable>Select Department</lable>
                                        <select name="department" id="department" class="select2 custom-select js-programmatic-user form-control" style="width: 100%; height: 36px">
                                        <option value=""></option>  
                                        @foreach ($departments_list as $department)
                                            <option value="{{ $department->id }}" {{old('department') == $department->id ? 'selected':''}}>{{ $department->name }}</option>
                                        @endforeach
                                        </select>
                                        @error('department')
                                             <p style="color:red">{{ $message }}</p>
                                            @enderror
                                    </div>

                                    <div class="col-md-6 mt-3">
                                    <lable>Select Folder</lable>
                                        <select name="sub_folder" id="sub_folder" class="select2 form-control" style="width: 100%; height: 36px"></select>
                                        @error('sub_folder')
                                         <p style="color:red">{{ $message }}</p>
                                        @enderror
                                    </div> 
                                    
                                    <div class="col-md-6 mt-3"> 
                                        <lable>Share With</lable> 
                                        <select class="select2 form-control" multiple="multiple" name="users[]" style="height: 40px; width: 100%" placeholder="Select Users">
                                        <option value="">Select Users</option> 
                                            @foreach($users as $user)
                                                  <option value="{{$user->id}}">{{$user->name}}</option>
                                            @endforeach
                                        </optgroup> 
                                      </select>  
                                    </div>

                                    <div class="col-md-6 mt-3">
                                        <input type="file" name="document" id="document" class="form-control" accept=".pdf,.png,.doc,.docx,.xls,.xlsx,.xlsm,.pptx,.gif,.jpg"/>
                                        @error('document')
                                         <p style="color:red">{{ $message }}</p>
                                        @enderror
                                    </div>
                                    <!-- <div class="mt-3 check-box">
                                        <input class="form-check-input" type="checkbox" id="check1" name="option1"
                                            value="something">
                                        <label class="form-check-label">Can Download?</label>
                                    </div> -->
                                    <div class="mt-3">
                                        <button id="submit_btn"
                                            class=" btn rounded-pill px-4 btn-light-success text-success font-weight-medium waves-effect waves-light" type="submit">
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
        $("#department").select2({
            placeholder: "Select Department",
        }); 
        $("#sub_folder").select2({
            placeholder: "Select Folder",
        }); 
    // -------------------------------------------------------
        // $(document).ready(async function(){
        //     let html_to_append = '<option value=""></option>';
        //     let department_id = $("#department").val(); 
        //     if(department_id != ''){
        //         let url = "{{route('api.get_sub_folder_list')}}";
        //         let response = await fetch(`${url}/?department_id=${department_id}`);
        //         let responseData = await response.json(); 
        //         console.log(responseData);
        //         if(responseData.status === 'success'){
        //             responseData.folders.forEach(element => {
        //                 html_to_append += `<option value="${element.id}">${element.name}</option>`;
        //             });
        //             $('#sub_folder').html(html_to_append);
        //         }
        //     }
        // }); 
    // -------------------------------------------------------

        $(document).on("change", "#department", async function(){
            let html_to_append = '<option value=""></option>';
            let department_id = $(this).val();
            let url = "{{route('api.get_sub_folder_list')}}";
            let response = await fetch(`${url}/?department_id=${department_id}`);
            let responseData = await response.json(); 
           if(responseData.status === 'success'){
                responseData.folders.forEach(element => {
                    html_to_append += `<option value="${element.id}">${element.name}</option>`;
                });
                $(sub_folder).html(html_to_append);
           }
        }); 
        
        async function checkTitleExistence(){
            const  title = $("#document_title").val();
            const department_id = $("#department").val();
            const sub_folder_id = $("#sub_folder").val();
            const url = "{{route('backend.document.check_document_title_existence')}}";
            const csrf_token = $('meta[name="csrf-token"]').attr('content'); 
            if(title != ''){
                const response = await fetch(url, {
                    method:'POST',
                    headers:{
                        'Content-Type':'application/json',
                        'X-CSRF-TOKEN':csrf_token
                    },
                    body:JSON.stringify({
                        'title':title,
                        'department_id':department_id,
                        'sub_folder_id':sub_folder_id
                    }),
                });
                if(response.ok){
                    const responseData = await response.json();   
                    if(responseData.status == 'success'){
                        if(responseData.title_existence){
                            $("#title_exist_error").show();
                            $("#submit_btn").attr('disabled', true);
                        }else{
                            $("#title_exist_error").hide();
                            $("#submit_btn").attr('disabled', false); 
                        }
                    }
                }
            }
        } 
        $(document).on("keyup", "#document_title", async function(){ 
            await checkTitleExistence(); 
        });
        $(document).on("change", "#department", async function(){ 
            await checkTitleExistence(); 
        });
        $(document).on("change", "#sub_folder", async function(){ 
            await checkTitleExistence(); 
        });
    </script> 
@endsection
@endsection
