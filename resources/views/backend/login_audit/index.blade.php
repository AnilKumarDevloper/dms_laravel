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
                    Login Report
                  </li>
                </ol>
              </nav>
                <h1 class="mb-0 fw-bold">Login Report</h1>
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
                                        <th>Name</th>
                                        <th>Email</th> 
                                        <th>IP Address</th>
                                        <th>Date</th> 
                                    </tr>
                                </thead>
                                <tbody>
                                    
                                    @foreach($login_audits as $audit)
                                    <tr>
                                        <td>{{$audit->getUser?->name}}</td>
                                        <td>{{$audit->getUser?->email}}</td>
                                        <td>{{$audit->ip}}</td>
                                        <td>{{Carbon\Carbon::parse($audit->created_at)->format('d M, Y h:i A')}}</td>
                                    </tr>
                                    @endforeach 
                                </tbody>
                            </table>
                            {{$login_audits->links('pagination::bootstrap-5')}} 
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- BEGIN MODAL -->
        <div class="modal" id="my-event">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header d-flex align-items-center">
                        <h4 class="modal-title"><strong>Add Event</strong></h4>
                        <button type="button" class="btn-close close-dialog" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body"></div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary close-dialog waves-effect" data-bs-dismiss="modal" aria-label="Close">
                            Close
                        </button>
                        <button type="button" class="btn btn-success save-event waves-effect waves-light">
                            Create event
                        </button>
                        <button type="button" class="btn btn-danger delete-event waves-effect waves-light" data-bs-dismiss="modal">
                            Delete
                        </button>
                    </div>
                </div>
            </div>
        </div>
        <div class="modal-backdrop bckdrop hide"></div>
        <!-- Modal Add Category -->
        <div class="modal none-border" id="add-new-event">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header d-flex align-items-center">
                        <h4 class="modal-title"><strong>Add</strong> a category</h4>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form>
                            <div class="row">
                                <div class="col-md-6">
                                    <label class="control-label">Category Name</label>
                                    <input class="form-control form-white" placeholder="Enter name" type="text" name="category-name" />
                                </div>
                                <div class="col-md-6">
                                    <label class="control-label">Choose Category Color</label>
                                    <select class="form-select form-white" data-placeholder="Choose a color..." name="category-color">
                                        <option value="success">Success</option>
                                        <option value="danger">Danger</option>
                                        <option value="info">Info</option>
                                        <option value="primary">Primary</option>
                                        <option value="warning">Warning</option>
                                        <option value="inverse">Inverse</option>
                                    </select>
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="
                      btn btn-danger
                      waves-effect waves-light
                      save-category
                    " data-bs-dismiss="modal">
                            Save
                        </button>
                        <button type="button" class="btn btn-secondary waves-effect" data-bs-dismiss="modal">
                            Close
                        </button>
                    </div>
                </div>
            </div>
        </div>
        <!-- END MODAL -->
    </div>
    <!-- <footer class="footer">2021© All Rights Reserved by Wrappixel</footer> -->
</div>
@endsection