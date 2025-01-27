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
                  <li class="breadcrumb-item active" aria-current="page"><a href="{{route('backend.folders.index', [Crypt::encrypt($document->getMainFolder?->id)])}}" class="link">{{$document->getMainFolder?->name}}</a></li>
                  <li class="breadcrumb-item active" aria-current="page"><a href="{{ route('backend.folders.view_doc_list', [Crypt::encrypt($document->getMainFolder?->id), Crypt::encrypt($document->getSubFolder?->id)]) }}" class="link">{{$document->getSubFolder?->name}}</a></li>
                  <li class="breadcrumb-item active" aria-current="page">Document Access</li>
                </ol>
              </nav>
                <h1 class="mb-0 fw-bold">Document Access</h1>
            </div>
             
        </div>
    </div>

    <div class="container-fluid">
        <form action="{{route('backend.document.document_access_sync', [$document->id])}}" method="POST" id="access_form">
           @csrf 
        <div class="row"> 
            <div class="col-md-12">
              <div class="card overflow-hidden">
                <div class="card-body border-bottom">
                  <h4 class="mb-0">{{$document->document_title ?? "No Title"}}</h4>
                </div>
                <div class="row justify-content-center bg-light p-3">
                  <div class="col-md-12">
                    <div class="card shadow-sm">
                      <div class="p-4">
                        <div class="table-responsive">
                          <table id="zero_config" class="table table-striped table-bordered no-wrap" id="access_table">
                            <thead>
                              <tr>
                                <th>User Name</th>
                                <th>Read</th>
                                <th>Write</th>
                                <!-- <th>Download</th>  -->
                              </tr>
                            </thead>
                            <tbody>
                                @foreach($users as $user)
                              <tr>
                                <td>
                                {{$user->name}}
                                <input type="hidden" name="user[]" value="{{$user->id}}" >
                                </td> 
                                <td>
                                    <input type="checkbox" name="read[]" {{$user->getDocumentPermission?->read == 1 ? 'checked':''}} value="{{$user->id}}">
                                </td>
                                <td>
                                    <input type="checkbox" name="write[]" value="{{$user->id}}" {{$user->getDocumentPermission?->write == 1 ? 'checked':''}}>
                                </td> 
                              </tr> 
                              @endforeach
                            </tbody> 
                          </table> 
                        </div> 
                      </div>
                    </div>
                    <input type="submit" class="btn btn-primary" value="Assign"> 
                  </div>
                </div> 
              </div> 
            </div> 
          </div>
          </form> 
        </div> 
            </div>
        </div>
    </div>
</div>
 
@section('javascript-section')

@if(Session::has('updated')) 
        <script>
            Swal.fire({
                title: "Success!",
                text: "{{ Session::get('updated') }}",
                icon: "success",
                timer: 5000,
            });
        </script>
@endif
@if(Session::has('document_access_synced')) 
        <script>
            Swal.fire({
                title: "Success!",
                text: "{{ Session::get('document_access_synced') }}",
                icon: "success",
                timer: 5000,
            });
        </script>
@endif

 <script>
   $('#access_form').on('submit', function(e) {
    e.preventDefault();
    var table = $('#zero_config').DataTable();
    let allData = [];
    table.rows().every(function() {
        let rowData = {
            user_id: $(this.node()).find('input[name="user[]"]').val(),
            read: $(this.node()).find('input[name^="read"]').is(':checked') ? 1 : 0,
            write: $(this.node()).find('input[name^="write"]').is(':checked') ? 1 : 0,
        };
        allData.push(rowData);
    });
    $('<input>').attr({
        type: 'hidden',
        name: 'all_records',
        value: JSON.stringify(allData)
    }).appendTo('#access_form');
    this.submit();
});


 </script>
 
@endsection
    @endsection