

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
                  <li class="breadcrumb-item active" aria-current="page">
                   Document Audit
                  </li>
                </ol>
              </nav> 
                <h1 class="mb-0 fw-bold">Document Audit</h1>
            </div>
             
        </div>
    </div>
    <div class="container-fluid">
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-body">
                        <div class="table-responsive">
                            <table id="" class="table table-striped table-bordered text-nowrap">
                                <thead>
                                    <tr>
                                        <th>Action Date</th>
                                        <th>Doc Title</th> 
                                        <th>Main Folder</th>
                                        <th>Sub Folder</th> 
                                        <th>Operation</th> 
                                        <th>By Whom</th> 
                                        <th>Action</th> 
                                    </tr>
                                </thead>
                                <tbody> 
                                    @foreach($document_audits as $audit)
                                    <tr>
                                        <td>{{Carbon\Carbon::parse($audit->created_at)->format('d M, Y h:i A')}}</td>
                                        <td><a href="{{route('backend.document.view', [Crypt::encrypt($audit->getDocument?->doc_file)])}}">{{$audit->getDocument?->document_title ?? "No Title"}}</a></td>
                                        <td>{{$audit->getMainFolder?->name}}</td>
                                        <td>{{$audit->getSubFolder?->name}}</td> 
                                        <td>{{strtoupper($audit->operation)}}</td>
                                        <td>{{$audit->getUser?->name}}  ({{$audit->getRoleType?->name}})</td>
                                        <td><a href="{{route('backend.document_audit.view', [Crypt::encrypt($audit->id)])}}">View</a></td>
                                    </tr> 
                                    @endforeach
                                </tbody>
                            </table>
                            {{$document_audits->links('pagination::bootstrap-5')}} 
                        </div>
                    </div>
                </div>
            </div>
        </div>
    
          
    </div>
    <!-- <footer class="footer">2021© All Rights Reserved by Wrappixel</footer> -->
</div>
@endsection