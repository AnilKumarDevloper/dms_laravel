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
                    <li class="breadcrumb-item" aria-current="page"><a href="{{ route('backend.folders.view_doc_list', [Crypt::encrypt($document->getMainFolder?->id), Crypt::encrypt($document->getSubFolder?->id)]) }}" class="link">{{$document->document_title ?? 'No Title'}}</a></li>
                    <li class="breadcrumb-item" aria-current="page"><a href="{{route('backend.document.index')}}" class="link">Upload New File</a></li>
                 </ol>
              </nav>
                    <h1 class="mb-0 fw-bold">Upload New File</h1>
                </div>
            </div>
        </div>
        <div class="container-fluid">
            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-body">
                            <form class="mt-4" action="{{route('backend.document.upload_new_file.store', [Crypt::encrypt($document_id)])}}" method="POST" enctype="multipart/form-data">
                                @csrf
                                <div class="row"> 
                                    <div class="col-md-6 mt-3">
                                    <lable>Upload New File</lable> 
                                        <input type="file" name="document" id="document" class="form-control" accept=".pdf,.png,.doc,.docx,.xls,.xlsx,.xlsm,.pptx,.gif,.jpg"/>
                                        @error('document')
                                        <p style="color:red;">{{$message}}</p>
                                        @enderror
                                    </div> 
                                    <div class="mt-3">
                                        <button
                                            class=" btn rounded-pill px-4 btn-light-success text-success font-weight-medium waves-effect waves-light "
                                            type="submit">
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
    </script>
    <script>
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
        })
    </script>

    @if (Session::has('updated'))
        <script>
            Swal.fire({
                title: "Success!",
                text: "{{ Session::get('updated') }}",
                icon: "success",
                timer: 5000, 
            });
            
        </script>
    @endif
 

   
@endsection
@endsection
