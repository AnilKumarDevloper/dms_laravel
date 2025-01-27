@extends('layouts/backend/main')
@section('main-section') 
<div class="page-wrapper">
    <div class="page-titles">
        <div class="row">
            <div class="col-lg-8 col-md-6 col-12 align-self-center">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb mb-0 d-flex align-items-center">
                  <li class="breadcrumb-item">
                    <a href="{{route('dashboard')}}" class="link"><i class="ri-home-3-line fs-5"></i></a>
                  </li>
                  <li class="breadcrumb-item" active aria-current="page">{{$task->getMainFolder?->name}}</li> 
                  <li class="breadcrumb-item" active aria-current="page">{{$task->getSubFolder?->name}}</li> 
                  <li class="breadcrumb-item" active aria-current="page">{{$document->document_title ?? "No Title"}}</li> 
                </ol>
            </nav> 
            </div> 
        </div>
    </div>
    <div class="container-fluid"> 
        <div class="row">  
            @if($file_type == 'doc' || $file_type == 'docx' || $file_type == 'xls' || $file_type == 'xlsx')
            <div class="col-12" style="position: relative; height: 600px; width: 100%; text-align:center;">  
                <iframe src='https://view.officeapps.live.com/op/embed.aspx?src={{ urlencode(url($task->ducument_url.'/'.$task->document_name)) }}' width="100%" height="100% !important"  style="border:1px solid green;"></iframe>
            </div>
            @elseif($file_type == 'pdf')
            <div class="col-12" style="position: relative; width: 100%; text-align:center;">  
            <div id="pdfViewer" style=" text-align:center;"></div> 
            </div>
            @elseif($file_type == 'jpg' || $file_type == 'jpeg' || $file_type == 'png' || $file_type == 'gif' || $file_type == 'webp')
            <div class="col-12" style="position: relative; height: 600px; width: 100%; text-align:center;">  
            <img src="{{ url($task->ducument_url.'/'.$task->document_name) }}" alt="Image" height="100%">
            </div>
            @endif 
  
        </div>
    </div>
</div>

@section('javascript-section') 
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdf.js/2.10.377/pdf.min.js"></script> 
@if($file_type == 'pdf') 
        <script>
            const pdfUrl = "{{ url($task->ducument_url.'/'.$task->document_name) }}";
            const pdfViewer = document.getElementById('pdfViewer');
            pdfjsLib.getDocument(pdfUrl).promise.then(function(pdf) {
                const totalPages = pdf.numPages;
                function renderPage(pageNumber) {
                    pdf.getPage(pageNumber).then(function(page) {
                        const scale = 1.5;
                        const viewport = page.getViewport({ scale: scale });
                        const canvas = document.createElement('canvas');
                        const context = canvas.getContext('2d');
                        canvas.height = viewport.height;
                        canvas.width = viewport.width;
                        pdfViewer.appendChild(canvas);
                        const renderContext = {
                            canvasContext: context,
                            viewport: viewport
                        };
                        page.render(renderContext).promise.then(function() {
                            if (pageNumber < totalPages) {
                                renderPage(pageNumber + 1);
                            }
                        });
                    });
                } 
                renderPage(1);
            }).catch(function(error) {
                console.error('Error loading PDF:', error);
            });
        </script> 
@endif
@endsection 
@endsection