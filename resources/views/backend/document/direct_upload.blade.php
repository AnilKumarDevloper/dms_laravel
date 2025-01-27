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
                    <li class="breadcrumb-item active" aria-current="page"><a href="{{route('backend.folders.index', [Crypt::encrypt($m_folder->id)])}}" class="link">{{$m_folder->name}}</a></li>
                    <li class="breadcrumb-item active" aria-current="page"><a href="{{ route('backend.folders.view_doc_list', [Crypt::encrypt($m_folder->id), Crypt::encrypt($s_folder->id)]) }}" class="link">{{$s_folder->name}}</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Add Document</li>
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
                            <form class="mt-4" action="{{route('backend.document.direct_upload_store')}}" method="POST" enctype="multipart/form-data">
                                @csrf
                                <input type="hidden" name="m_id" id="m_id" value="{{$decrypt_m_id}}"/>
                                <input type="hidden" name="s_id" id="s_id" value="{{$decrypt_s_id}}"/>
                                <div class="row">
                                    <div class="mb-3 col-md-6">
                                    <lable>Document Title</lable>
                                        <input type="text" class="form-control" name="document_title" id="document_title" placeholder="Document Title"  value="{{old('document_title')}}" required/>
                                        <p style="color:red; display:none;" id="title_exist_error">The title you have entered is already exists.</p>
                                        @error('document_title')
                                            <p style="color:red;">{{$message}}</p>
                                        @enderror
                                    </div>
                                    <div class="col-md-6 mt-3">
                                        <input type="file" name="document" id="document" class="form-control" required accept=".pdf,.png,.doc,.docx,.xls,.xlsx,.xlsm,.pptx,.gif,.jpg"/>
                                        @error('document')
                                            <p style="color:red;">{{$message}}</p>
                                        @enderror
                                    </div> 
                                    <div class="mt-3">
                                        <button id="submit_btn"
                                            class="btn rounded-pill px-4 btn-light-success text-success font-weight-medium waves-effect waves-light" type="submit">
                                            <i data-feather="send" class="feather-sm ms-2 fill-white"></i>Upload</button>
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
        $(document).on("keyup", "#document_title", async function(){
            const title = $(this).val();
            const main_folder_id = $("#m_id").val();
            const sub_folder_id = $("#s_id").val(); 
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
                        'department_id':main_folder_id,
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
        });
   
   
    </script>
 
@endsection
@endsection
