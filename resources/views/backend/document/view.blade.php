@extends('layouts/backend/main')
@section('main-section') 
    <style>
        img {
            pointer-events: none; /* Disable dragging */
        }
        #main_page_area{
            z-index: 99999;
        }
    </style>
<div class="page-wrapper" >
    <div class="page-titles">
        <div class="row">
            <div class="col-lg-8 col-md-6 col-12 align-self-center">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb mb-0 d-flex align-items-center">
                    <li class="breadcrumb-item"><a href="{{route('dashboard')}}" class="link"><i class="ri-home-3-line fs-5"></i></a></li>
                    <li class="breadcrumb-item" aria-current="page"><a href="{{route('backend.folders.index', [Crypt::encrypt($document->getMainFolder?->id)])}}" class="link">{{$document->getMainFolder?->name ?? ''}}</a></li>
                    <li class="breadcrumb-item" aria-current="page"><a href="{{ route('backend.folders.view_doc_list', [Crypt::encrypt($document->getMainFolder?->id), Crypt::encrypt($document->getSubFolder?->id)]) }}" class="link">{{$document->getSubFolder?->name ?? ''}}</a></li>
                    <li class="breadcrumb-item active" aria-current="page">{{$document->document_title ?? 'No Title'}}</li> 
                    </ol>
                </nav> 
            </div> 
        </div>
    </div>

    <div class="container-fluid" id="main_page_area">
        <div class="row"> 
            @if($file_type == 'doc' || $file_type == 'docx' || $file_type == 'xls' || $file_type == 'xlsx')
            <div class="col-12" style="position: relative; height: 600px; width: 100%; text-align:center;">  
                <iframe src='https://view.officeapps.live.com/op/embed.aspx?src={{ urlencode(url($document->doc_path.'/'.$document->doc_file)) }}' width="100%" height="100% !important"  style="border:1px solid green;"></iframe>
                <div></div>
                    <div class="" style="background: #f5f5f5; width: 97.2%;  height: 26px; position: absolute; bottom: 1px;"></div>
            </div>
            @elseif($file_type == 'pdf')
            <div class="col-12" style="position: relative; width: 100%; text-align:center;">  
            <div id="pdfViewer" style=" text-align:center;"></div> 
            </div>
            @elseif($file_type == 'jpg' || $file_type == 'jpeg' || $file_type == 'png' || $file_type == 'gif' || $file_type == 'webp')
            @php
                $imagePath = url(str_replace(' ', '%20', $document->doc_path).'/'.$document->doc_file); // or storage_path() for images in storage
                $imageData = file_get_contents($imagePath);
                $base64 = base64_encode($imageData);
                $base64Url = "data:$file_type;base64,$base64";
            @endphp
            <div class="col-12" style="position: relative; height: 600px; width: 100%; text-align:center;">  
            <img src="{{ $base64Url }}" alt="Image" width="100%">
            </div>
            @endif  
        </div>
    </div>
</div>
@section('javascript-section') 
    <script src="https://cdnjs.cloudflare.com/ajax/libs/pdf.js/2.10.377/pdf.min.js"></script> 
    @if($file_type == 'pdf') 
        <script>
            const pdfUrl = "{{ url($document->doc_path.'/'.$document->doc_file) }}";
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

    <script>
        let devtoolsOpen = false;
        const threshold = 160; 
        setInterval(function() {
            const width = window.outerWidth - window.innerWidth;
            const height = window.outerHeight - window.innerHeight;
            if (width > threshold || height > threshold) {
                devtoolsOpen = true;
                $("#main_page_area").empty();
            } else {
                devtoolsOpen = false;
                $("#main_page_area").show();
            }
        }, 100);
        
    </script>

@endsection 
@endsection