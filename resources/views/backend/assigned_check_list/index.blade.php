@extends('layouts/backend/main')
@section('main-section')


<div class="page-wrapper">
    <div class="page-titles">
        <div class="row">
            <div class="col-lg-8 col-md-6 col-12 align-self-center"> 
                <h1 class="mb-0 fw-bold">Check List</h1>
            </div>
            <div class="
                col-lg-4 col-md-6
                d-none d-md-flex
                align-items-center
                justify-content-end"> 
            </div>
        </div>
    </div>
    <div class="container-fluid">
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-body">
                        <div class="table-responsive">
                            <table id="zero_config" class="table table-striped table-bordered text-nowrap">
                                <thead> 
                                    <tr>
                                        <th>SN</th>
                                        <th>Title</th>  
                                        <th>Hotel Name</th>
                                        <th>Start Date</th>
                                        <th>End Date</th>
                                        <th>Action</th>
                                    </tr>
                                </thead>
                                <tbody> 
                                @if(count($check_lists) > 0)
                                @foreach($check_lists as $check_list)
                                    <tr>
                                        <td>1</td>
                                        <td>{{$check_list->title ?? ''}}</td>
                                        <td>{{$check_list->hotel_name ?? ''}}</td> 
                                        <td>{{Carbon\Carbon::parse($check_list->start_date)->format('d M, Y')}}</td>
                                        <td>{{Carbon\Carbon::parse($check_list->end_date)->format('d M, Y')}}</td>
                                        <td>
                                            <div class="button-container">  
                                                <a href="{{route('backend.assigned_check_list.view', [$check_list->id])}}">
                                                    <button class="editBtn">
                                                        <svg height="1em" viewBox="0 0 512 512">
                                                            <path d="M410.3 231l11.3-11.3-33.9-33.9-62.1-62.1L291.7 89.8l-11.3 11.3-22.6 22.6L58.6 322.9c-10.4 10.4-18 23.3-22.2 37.4L1 480.7c-2.5 8.4-.2 17.5 6.1 23.7s15.3 8.5 23.7 6.1l120.3-35.4c14.1-4.2 27-11.8 37.4-22.2L387.7 253.7 410.3 231zM160 399.4l-9.1 22.7c-4 3.1-8.5 5.4-13.3 6.9L59.4 452l23-78.1c1.4-4.9 3.8-9.4 6.9-13.3l22.7-9.1v32c0 8.8 7.2 16 16 16h32zM362.7 18.7L348.3 33.2 325.7 55.8 314.3 67.1l33.9 33.9 62.1 62.1 33.9 33.9 11.3-11.3 22.6-22.6 14.5-14.5c25-25 25-65.5 0-90.5L453.3 18.7c-25-25-65.5-25-90.5 0zm-47.4 168l-144 144c-6.2 6.2-16.4 6.2-22.6 0s-6.2-16.4 0-22.6l144-144c6.2-6.2 16.4-6.2 22.6 0s6.2 16.4 0 22.6z"></path>
                                                        </svg>
                                                    </button>
                                                </a> 
                                            </div>
                                        </td>
                                    </tr>
                                    @endforeach
                                    @endif 
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>


@section('javascript-section')
@endsection
@endsection