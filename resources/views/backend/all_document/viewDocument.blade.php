@extends('layouts/backend/main')
@section('main-section')
    <div class="page-wrapper">
        <div class="page-titles">
            <div class="row">
                <div class="col-lg-8 col-md-6 col-12 align-self-center">
                    <h1 class="mb-0 fw-bold">Security</h1>
                </div>
            </div>
        </div>
        <div class="container-fluid">
            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-body">
                            <div class="table-responsive align-items-right">
                                <table id="zero_config" class="table table-bordered text-nowrap">
                                    <thead>
                                        <tr>
                                            <th>SN</th>
                                            <th>Name</th>
                                            <th>Email</th>
                                            <th>Department</th> 
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td> 1</td>
                                            <td>Akash Oberoi</td>
                                            <td>akashoberoi@gmail.com</td>
                                            <td>IT (Information Technology)</td>
                                            <td class=" btn btn-xl btn-light-info text-info btn-circle d-flex align-items-center justify-content-center " style="margin-left: 30px">
                                                <a href="{{route('backend.all_document.docView')}}" target="_blank"> 
                                                    <i class="fa-solid fa-eye"></i>
                                                </a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td> 2</td>
                                            <td>Harsh Sahni</td>
                                            <td>harshsahni@gmail.com</td>
                                            <td>Accounts</td> 
                                            <td class=" btn btn-xl btn-light-info text-info btn-circle d-flex align-items-center justify-content-center " style="margin-left: 30px">
                                                <a href="{{route('backend.all_document.docView')}}"> 
                                                    <i class="fa-solid fa-eye"></i>
                                                </a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td> 3</td>
                                            <td>Jackson</td>
                                            <td>jackson@gmail.com</td>
                                            <td>HR (Human Resources)</td>
                                            <td class=" btn btn-xl btn-light-info text-info btn-circle d-flex align-items-center justify-content-center " style="margin-left: 30px">
                                                <a href="{{route('backend.all_document.docView')}}"> 
                                                    <i class="fa-solid fa-eye"></i>
                                                </a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td> 4</td>
                                            <td>Daniel</td>
                                            <td>daniel@gmail.com</td>
                                            <td>FO (Front Office)</td>
                                            <td class=" btn btn-xl btn-light-info text-info btn-circle d-flex align-items-center justify-content-center " style="margin-left: 30px">
                                                <a href="{{route('backend.all_document.docView')}}"> 
                                                    <i class="fa-solid fa-eye"></i>
                                                </a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td> 5</td>
                                            <td>Freddie</td>
                                            <td>freddie@gmail.com</td>
                                            <td>F &amp; BS (Food &amp; Beverage Service)</td>
                                            <td class=" btn btn-xl btn-light-info text-info btn-circle d-flex align-items-center justify-content-center " style="margin-left: 30px">
                                                <a href="{{route('backend.all_document.docView')}}" target="_blank"> 
                                                    <i class="fa-solid fa-eye"></i>
                                                </a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td> 6</td>
                                            <td>Shashank shekhar</td>
                                            <td>shekhar.wts@gmail.com</td>
                                            <td>Legal</td>
                                            <td class=" btn btn-xl btn-light-info text-info btn-circle d-flex align-items-center justify-content-center " style="margin-left: 30px">
                                                <a href="{{route('backend.all_document.docView')}}"> 
                                                    <i class="fa-solid fa-eye"></i>
                                                </a>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    @endsection
