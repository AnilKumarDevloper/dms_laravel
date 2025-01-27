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
                        <li class="breadcrumb-item active" aria-current="page">View Document Audit</li>
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
                        <table class="table table-striped table-bordered text-nowrap">
                            <thead>
                                <tr>
                                    <th>Column Name</th>
                                    <th>Old</th>
                                    <th>New</th>
                                </tr>
                            </thead>   
                            <tbody>
                                @if($audit->changes != '')
                            @foreach($audit->changes as $field => $change) 
                                @php 
                                    $column_name;
                                    switch($field){
                                        case 'main_folder_id':
                                            $column_name = 'Main Folder';
                                        break;
                                        case 'sub_folder_id':
                                            $column_name = 'Sub Folder';
                                        break;
                                        case 'department_type_id':
                                            $column_name = 'Department';
                                        break;
                                        case 'document_title':
                                            $column_name = 'Document Title';
                                        break;
                                        case 'assigned_users':
                                            $column_name = 'Share With';
                                        break;
                                    } 
                                @endphp
                                <tr> 
                                    @if($field == 'assigned_users')
                                        <td>{{$column_name}}</td>
                                        <td>
                                        @if($change['old'] != '')
                                            @foreach($change['old'] as $share_with)
                                                @php 
                                                    $user = \App\Models\User::where('id', $share_with)->first()->name;
                                                @endphp
                                                {{$user}},
                                            @endforeach
                                        @endif
                                    </td>
                                    <td>
                                        @if($change['new'] != '') 
                                            @foreach($change['new'] as $share_with)
                                                @php 
                                                    $user = \App\Models\User::where('id', $share_with)->first()->name;
                                                @endphp
                                                {{$user}},
                                            @endforeach
                                        @endif
                                    </td>
                                @else 
                                    <td>{{$column_name}}</td>
                                    <td>
                                        @if($column_name == 'Main Folder')
                                            @php 
                                                $main_folder = \App\Models\backend\MainFolder::where('id', $change['old'])->first()->name;
                                            @endphp
                                            {{$main_folder}}
                                            @elseif($column_name == 'Sub Folder')
                                            @php
                                                $sub_folder = \App\Models\backend\SubFolder::where('id', $change['old'])->first()->name;
                                            @endphp
                                                {{$sub_folder}} 
                                            @elseif($column_name == 'Department')
                                            @php
                                                $department = \App\Models\backend\DepartmentType::where('id', $change['old'])->first()->name;
                                            @endphp
                                                {{$department}} 
                                            @else
                                                {{$change['old']}} 
                                        @endif
               
                                    <td>
                                        @if($column_name == 'Main Folder')
                                            @php 
                                                $main_folder = \App\Models\backend\MainFolder::where('id', $change['new'])->first()->name;
                                            @endphp
                                            {{$main_folder}}
                                            @elseif($column_name == 'Sub Folder')
                                            @php
                                                $sub_folder = \App\Models\backend\SubFolder::where('id', $change['new'])->first()->name;
                                            @endphp
                                                {{$sub_folder}} 
                                            @elseif($column_name == 'Department')
                                            @php
                                                $department = \App\Models\backend\DepartmentType::where('id', $change['new'])->first()->name;
                                            @endphp
                                                {{$department}} 
                                            @else
                                                {{$change['new']}} 
                                        @endif
                                    </td>

                                    <!-- <td>{{$change['new']}}</td>  -->
                                @endif
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
@endsection