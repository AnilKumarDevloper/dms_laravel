@extends('layouts/backend/main')
@section('main-section')
<style>
    .feather_dashboard_icon{
        height: 50px;
        width: 70px;
        color:#fff;
    }
    .card-body {
        flex: 1 1 auto !important;
        padding: 8px 8px !important;
    }
    .card{
        border-radius: 2px !important;
        border: 2px solid #ecf0f2 !important;
    }
    .card_data{
        margin: 10px 15px;
    }
</style>

    <div class="page-wrapper">
        <div class="page-titles pb-0">
            <div class="row">
                <div class="col-lg-8 col-md-6 col-12 align-self-center">
                    <h4 class="text-muted mb-0 fw-normal">Welcome {{ Auth::user()->name ?? '' }}</h4>
                    <h1 class="mb-0 fw-bold">Dashboard</h1>
                </div> 
            </div>
        </div>
        <div class="container-fluid" style="padding-top: 20px !important;"> 
            <div class="row">
                <div class="col-lg-4">
                    <div class="card">
                        <div class="card-body d-flex">
                            <span class="align-items-center d-flex" style="background:#d3ac07;">
                                <i class="feather_dashboard_icon" data-feather="book"></i>
                            </span>
                            <div class="card_data d-flex flex-column justify-content-center">
                            <h6 class="text-muted mb-0">Total Documents Uploaded</h6>
                            <h1 class="mb-0 fw-bold">{{$todal_doc_count ?? ''}}</h1>
                            </div> 
                        </div>
                    </div> 
                </div>
                <div class="col-lg-4">
                    <div class="card"> 
                        <div class="card-body d-flex">
                            <span class="align-items-center d-flex" style="background:#d3ac07;">
                                <i class="feather_dashboard_icon" data-feather="users"></i>
                            </span>
                            <div class="card_data d-flex flex-column justify-content-center">
                                <h6 class="text-muted mb-0">Total Users Added</h6>
                                <h1 class="mb-0 fw-bold">{{$total_users_count ?? ''}}</h1>
                            </div> 
                        </div> 
                    </div>
                </div> 
                <div class="col-lg-4">
                <div class="card"> 
                    <div class="card-body d-flex">
                        <span class="align-items-center d-flex" style="background:#d3ac07;">
                        <i class="feather_dashboard_icon" data-feather="layers"></i>
                        </span>
                        <div class="card_data d-flex flex-column justify-content-center">
                        <h6 class="text-muted mb-0">Total Departments Added</h6>
                        <h1 class="mb-0 fw-bold">{{$total_dept_count ?? ''}}</h1>
                        </div> 
                    </div> 
                </div>
                </div> 
            </div>

                    <div class="row"> 
                        <div class="col-lg-8">  
                            <div class="card-body">
                                <div class="table-responsive">
                                    @if(count($recently_added_documents) > 0)
                                        <h2><b>Recently Added Documents</b></h2> 
                                        <table id="" class="table table-striped table-bordered text-nowrap">
                                            <thead>
                                                <tr>
                                                    <th>SN</th>
                                                    <th>Title</th>    
                                                    <th>File Type</th>    
                                                    <th>Department</th>
                                                    <th>Main Folder</th>
                                                    <th>Sub Folder</th>
                                                    <th>Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                @php $count = '1'; @endphp 
                                                @foreach($recently_added_documents as $doc)
                                                <tr>
                                                    <td>{{$count++}}</td>
                                                    <td><a href="{{route('backend.document.view', [Crypt::encrypt($doc->doc_file)])}}">{{$doc->document_title ?? 'No Title'}}</a></td>
                                                    <td>{{ strtoupper(pathinfo($doc->doc_file, PATHINFO_EXTENSION)) }}</td> 
                                                    <td>{{$doc->getDepartmentType->name ?? '' }}</td>  
                                                    <td>{{$doc->getMainFolder->name ?? ''}}</td>  
                                                    <td>{{$doc->getSubFolder->name ?? ''}}</td>  
                                                    <td>
                                                        <div class="dropown dropstart d-flex justify-content-around" style="cursor: pointer;">
                                                            <span>
                                                                <a href="{{route('backend.document.view', [Crypt::encrypt($doc->doc_file)])}}">
                                                                    <i class="far fa-eye" class="feather-sm"></i>
                                                                </a>
                                                            </span>
                                                        </div>
                                                    </td>
                                                </tr> 
                                                @endforeach 
                                            </tbody>  
                                        </table>
                                    @else
                                        <h2><b>No Recent data available</b></h2>  
                                    @endif
                                </div>
                            </div>  
                            <br><br> 
                            @if(count($recently_added_users) > 0)
                            <div class="card-body">
                                <h2><b>Recently Added User</b></h2>
                                <div class="table-responsive">
                                    <table id="" class="table table-striped table-bordered text-nowrap">
                                    <thead>
                                        <tr>
                                            <th>SN</th> 
                                            <th>Name</th> 
                                            <th>Phone</th> 
                                            <th>Email</th> 
                                            <th>User Type</th>  
                                        </tr>
                                    </thead> 
                                    <tbody>
                                        @php $count = '1'; @endphp  
                                        @foreach($recently_added_users as $user)
                                        <tr>
                                            <td>{{$count++}}</td> 
                                            <td>{{$user->name ?? ''}}</td>
                                            <td>{{$user->phone ?? ''}}</td>  
                                            <td>{{$user->email ?? ''}}</td>  
                                            <td>{{$user->roleType->name}}</td>  
                                        </tr>
                                        @endforeach
                                    
                                    </tbody>  
                                    </table>
                                    @else
                                    <h2><b>No Recent User Available</b></h2>
                                    @endif
                                </div>
                            </div>
                        </div>
                        
                        <div class="col-lg-4">
                            <div>
                                <h3>Documents Share Departmentwise</h3>
                                <canvas id="myChart"></canvas>
                            </div>
                        </div>
                    </div>
        </div> 
     
    @section('javascript-section') 
      <script>
        async function fetchChartData(){
            try{
                let url = "{{route('fetch_chart_data')}}";
                const response = await fetch(url);
                const result = await response.json();  
                const filteredData = result.data.map((value, index) => {
                    return value > 0 ? { value, label: result.labels[index] } : null;
                }).filter(item => item !== null);   
                const filteredLabels = filteredData.map(item => item.label);
                const filteredValues = filteredData.map(item => item.value); 
                const ctx = document.getElementById('myChart'); 
                new Chart(ctx, {
                    type: 'pie',
                    data: {
                        labels: filteredLabels,
                        datasets: [{
                            label: 'No of Documents',
                            data: filteredValues,
                            borderWidth: 1
                        }]
                    },
                options: {
                    plugins: {
                        datalabels: {
                            color: '#000',
                            formatter: (value, context) => {
                                return context.chart.data.labels[context.dataIndex];
                            },
                            anchor: 'end',
                            align: 'start',
                            font: {
                                size: 12,
                                weight: 'bold'
                            },
                            offset: 10,
                            rotation: function(context){
                                const index = context.dataIndex;
                                const totalSegments = context.chart.data.labels.length; 
                                const angle = (index / totalSegments) * 360; 
                                return angle > 90 && angle < 270 ? angle + 180 : angle;
                            }
                        }
                    }
            },
            plugins: [ChartDataLabels]
            }); 
            }catch(error){
                console.error('Error fetching chart data:', error);
            }
        } 
        fetchChartData();
    </script> 
    <script> 
    </script>
  
    @endsection
        @endsection
