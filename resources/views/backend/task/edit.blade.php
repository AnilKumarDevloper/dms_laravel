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
                            <li class="breadcrumb-item active" aria-current="page">Edit</li> 
                        </ol>
                    </nav>
                    <h1 class="mb-0 fw-bold">Edit Task</h1>
                </div>
            </div>
        </div>
        <div class="container-fluid">
            <div class="row">
                <div class="col-12">
                    <div class="card">
                    <div class="border-bottom title-part-padding">
                        @php
                        $current_date = \Carbon\Carbon::now();
                        @endphp
                        @if($task->end_date < $current_date)
                        <h4>{{$task->getDocument?->document_title ?? 'No Title'}}</h4>
                        @else
                        <h4><a href="{{route('admin.task.view_doc', [Crypt::encrypt($task->id)])}}">{{$task->getDocument?->document_title ?? 'No Title'}}</a></h4>
                        @endif
                    </div>
                        <div class="card-body">
                                 <div class="row">
                                    <div class="mb-3 col-md-6">
                                    <lable>Assigned To</lable>
                                    <input type="text" value="{{$task->getAssignedTo?->name}}" class="form-control"  style="width: 100%; height: 36px" disabled>
                                    </div>
                                    <div class="mb-3 col-md-6">
                                    <lable>Assigned By</lable>
                                    <input type="text" value="{{$task->getAssignedBy?->name}}" class="form-control"  style="width: 100%; height: 36px" disabled>
                                    </div>
                                    </div> 

                                    <div class="row"> 
                                    <div class="col-md-6 mt-3">
                                    <lable>Start Date</lable>
                                        <input type="text" class="form-control" disabled value="{{Carbon\Carbon::parse($task->start_date)->format('d M, Y')}}"/>
                                    </div>  
                                    <div class="col-md-6 mt-3">
                                    <lable>End Date</lable>
                                        <input type="text" class="form-control" disabled value="{{Carbon\Carbon::parse($task->end_date)->format('d M, Y')}}"/>
                                    </div>  
                                </div>

                                <div class="row">
                                    <form method="POST" action="{{route('admin.task.update')}}" class="d-flex">
                                        @csrf
                                        <input type="hidden" name="task_id" value="{{$task->id}}">
                                <div class="mb-3 col-md-6">
                                    <lable>Select Current Status</lable> 
                                    <select name="current_status" required class="select2 js-programmatic form-control"  style="width: 100%; height: 36px">
                                        <option value="new" {{$task->current_status == "new" ? "selected":""}}>New</option>  
                                        <option value="in process" {{$task->current_status == "in process" ? "selected":""}}>In Process</option>  
                                        <option value="completed" {{$task->current_status == "completed" ? "selected":""}}>Completed</option>   
                                    </select> 
                                </div>
                                <div class="mb-3 col-md-6">
                                 <div class="mt-3">
                                        <button class=" btn rounded-pill px-4 btn-light-success text-success font-weight-medium waves-effect waves-light" type="submit">
                                            <i data-feather="send" class="feather-sm ms-2 fill-white"></i>
                                            Update Status
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
    </div>
  
@section('javascript-section')
    <script>
        $("#department").select2({
            placeholder: "Select Department",
        }); 
          
    </script>
     


@endsection
@endsection
