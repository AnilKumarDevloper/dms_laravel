@extends('layouts/backend/main')
@section('main-section')
    <div class="page-wrapper">
        <div class="page-titles">
            <div class="row">
                <div class="col-lg-8 col-md-6 col-12 align-self-center">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb mb-0 d-flex align-items-center">
                        <li class="breadcrumb-item"><a href="{{route('dashboard')}}" class="link"><i class="ri-home-3-line fs-5"></i></a></li> 
                        <li class="breadcrumb-item active" aria-current="page"><a href="{{route('backend.team_leader.index')}}" class="link">Team Leader</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Edit</li>
                    </ol>
                </nav>
                    <h1 class="mb-0 fw-bold">Edit Team Leader</h1>
                </div>
            </div>
        </div>
        <div class="container-fluid">
            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-body">
                            <form class="mt-4" method="POST" action="{{ route('backend.team_leader.update', [Crypt::encrypt($team_leader->id)]) }}">
                                @csrf
                                <div class="row">
                                    <div class="mb-3 col-md-6">
                                        <lable>Enter First Name</lable>
                                        <input type="text" class="form-control" placeholder="Enter First Name" name="f_name" id="f_name"
                                            value="{{$team_leader->first_name}}" oninput="capitalizeEachWord(this); allowOnlyLetters(event);"/>
                                            @error('f_name')
                                            <p style="color:red;">{{$message}}</p>
                                            @enderror
                                    </div>
                                    <div class="mb-3 col-md-6">
                                        <lable>Enter Last Name</lable>
                                        <input type="text" class="form-control" placeholder="Enter Last Name" name="l_name" id="flname"
                                            value="{{$team_leader->last_name}}" oninput="capitalizeEachWord(this); allowOnlyLetters(event);"/>
                                            @error('l_name')
                                            <p style="color:red;">{{$message}}</p>
                                            @enderror
                                    </div>
                                    <div class="mb-3 col-md-6">
                                    <lable>Email</lable>
                                        <input type="email" class="form-control" placeholder="Email" name="email"
                                            value="{{ $team_leader->email }}" disabled/>
                                            @error('email')
                                            <p style="color:red;">{{$message}}</p>
                                            @enderror
                                    </div>
                                    <div class="mb-3 col-md-6">
                                    <lable>Phone</lable>
                                        <input type="number" class="form-control" id="desig" placeholder="Phone"
                                            name="phone" value="{{ $team_leader->phone }}" />
                                            @error('phone')
                                            <p style="color:red;">{{$message}}</p>
                                            @enderror
                                    </div> 
                                    <div class="mb-3 col-md-6">
                                        <lable>Select Role</lable>
                                        <select name="role_type" class="select2 hotel form-control" style="width: 100%;" id="role_type"> 
                                            <option value="">--Select--</option>
                                            @foreach($role_types as $role)
                                                <option value="{{$role->id ?? ''}}" {{$role->id == $team_leader->role_type_id ? "selected":""}}>{{$role->name ?? ''}}</option>
                                            @endforeach 
                                        </select>
                                        <p id="role_type_error" style="color:red;"></p>  
                                        @error('role_type')
                                            <p style="color:red;">{{$message}}</p>
                                        @enderror
                                    </div>
                                    <div class="mb-3 col-md-6" id="department_type_section" style="display:none;">
                                      <lable>Department</lable>
                                      <select name="department_type" class="select2 hotel form-control" style="width: 100%;" id="department_type"> 
                                        <option value="">--Select Department--</option>
                                        @foreach($department_types as $department)
                                            <option value="{{$department->id}}" {{$team_leader->department_type_id == $department->id ? "selected":""}}>{{$department->name ?? ''}}</option> 
                                        @endforeach
                                      </select>
                                      <p id="department_type_error" style="color:red;"></p>
                                    </div>

                                    <div class="mb-3 col-md-6" id="head_department_section">
                                    <lable>Department Head</lable>
                                        <select name="head_department" class="select2 hotel form-control"
                                            style="width: 100%;" id="head_department" onchange="getManagerList();">
                                            @if(Auth::user()->role_type_id == 1)
                                            <option value="">--Select--</option>
                                            @foreach($department_heads as $head)
                                            <option value="{{$head->id}}" {{$head->id == $team_leader->getHead?->id ? 'selected':''}}>{{$head->first_name.' '.$head->last_name}}</option>
                                            @endforeach
                                            @elseif(Auth::user()->role_type_id == 2 || Auth::user()->role_type_id == 5)
                                            <option value="{{$team_leader->getHead?->id}}" selected>{{$team_leader->getHead?->first_name .' '. $team_leader->getHead?->last_name}}</option>
                                            @endif
                                        </select>
                                        @error('head_department')
                                            <p style="color:red;">{{$message}}</p>
                                            @enderror
                                    </div> 
                                    <div class="mb-3 col-md-6" id="unit_section">
                                    <lable>Unit</lable>
                                        <select name="hotel" class="select2 hotel form-control"
                                            style="width: 100%;" id="unit" onchange="getManagerList();"> 
                                            @if(Auth::user()->role_type_id == 1 || Auth::user()->role_type_id == 2)
                                            <option value="">--Select--</option>
                                             @foreach ($units as $unit)
                                                <option value="{{$unit->id}}" {{$unit->id == $team_leader->unit_id ? "selected":""}}>{{$unit->name}}</option>
                                             @endforeach
                                             @else
                                             <option value="{{$team_leader->getUnit?->id}}" {{$team_leader->getUnit?->id == $team_leader->unit_id ? "selected":""}}>{{$team_leader->getUnit?->name}}</option>
                                             @endif
                                        </select>
                                        @error('hotel')
                                            <p style="color:red;">{{$message}}</p>
                                            @enderror
                                    </div> 
                                    <div class="mb-3 col-md-6" id="manager_section">
                                        <lable>Manager</lable> 
                                        <select name="manager" class="select2 hotel form-control"
                                            style="width: 100%;" id="manager" onchange="getTeamLeaderList();">  
                                            @if(Auth::user()->role_type_id  == 1 || Auth::user()->role_type_id == 2)
                                            <option value="">--Select--</option>
                                            @if($managers != '' && $managers != NULL)
                                            @foreach($managers as $manager)
                                            <option value="{{$manager?->id}}" {{$manager->id == $team_leader->manager_id ? "selected":""}}>{{$manager?->first_name.' '.$manager?->last_name}}</option>
                                            @endforeach
                                            @endif 
                                            @else
                                            <option value="{{$team_leader->getManager?->id}}" {{$team_leader->getManager->id == $team_leader->manager_id ? "selected":""}}>{{$team_leader->getManager?->first_name.' '.$team_leader->getManager?->last_name}}</option>
                                            @endif
                                        </select>
                                        @error('manager')
                                            <p style="color:red;">{{$message}}</p>
                                            @enderror
                                    </div> 
                                    <div class="mb-3 col-md-6" id="team_leader_section" style="display:none;">
                                        <lable>Team Leader</lable>
                                        <select name="team_leader" class="select2 hotel form-control" style="width: 100%;" id="team_leader">
                                                <option value="">--Select Team Leader--</option> 
                                                @if($team_leaders != '')
                                            @foreach($team_leaders as $team_leader)
                                                <option value="{{$team_leader->id}}">{{$team_leader->first_name .' '. $team_leader->last_name}}</option>
                                            @endforeach
                                            @endif
                                        </select>
                                        @error('team_leader')
                                            <p style="color:red;">{{$message}}</p>
                                        @enderror
                                    </div>
                                    <div class="mb-3">
                                        <button class="btn btn-primary rounded-pill px-4 mt-3" type="submit">
                                            <i data-feather="send" class="feather-sm ms-2 fill-white"></i>
                                            Submit
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
@section('javascript-section') 
    <script>
        const logged_in_user = "{{Auth::user()->role_type_id}}";
        $(document).on("change", "#role_type", function(){
            const role_type = $(this).val(); 
            if(logged_in_user == 1){
            // if logged in user is Admin
                if(role_type == 2){
                    // if selected role is head of department
                    $("#department_type_section").show();
                    $("#team_leader_section").hide();
                    $("#manager_section").hide();
                    $("#unit_section").hide();
                    $("#head_department_section").hide(); 
                }else if(role_type == 5){
                    // if selected role is manager.
                    $("#team_leader_section").hide();
                    $("#manager_section").hide();
                    $("#department_type_section").hide();
                    $("#unit_section").show();
                    $("#head_department_section").show(); 
                }else if(role_type == 6){
                    // if selected role is team leader.
                    $("#team_leader_section").hide();
                    $("#department_type_section").hide();

                    $("#unit_section").show();
                    $("#head_department_section").show();
                    $("#manager_section").show(); 
                }else if(role_type == 7){
                    // if selected role is team member.
                    $("#team_leader_section").show();
                    $("#manager_section").show();
                }else{
                    $("#department_type_section").hide();
                    $("#team_leader_section").hide();
                    $("#manager_section").hide();
                    $("#unit_section").hide();
                    $("#head_department_section").hide();
                }
            }else if(logged_in_user == 2){
                // if logged in user is head of department
                if(role_type == 5){
                    // if slected role is manager.
                    $("#manager_section").hide();
                    $("#team_leader_section").hide();
                }else if(role_type == 6){
                    // if selected role is team leader.
                    $("#team_leader_section").hide();
                    $("#manager_section").show();
                }else if(role_type == 7){
                    // if selected role is team member.
                    $("#team_leader_section").show();
                    $("#manager_section").show();
                }else{
                    $("#department_type_section").hide();
                    $("#team_leader_section").hide();
                    $("#manager_section").hide();
                    $("#unit_section").hide();
                    $("#head_department_section").hide();
                }

            }else if(logged_in_user == 5){
                // if logged in user is manager 
                if(role_type == 6){
                    // if selected role is team leader
                    $("#team_leader_section").hide();
                }else if(role_type == 7){
                    // if selected role is team member.
                    $("#team_leader_section").show();

                }
            }
        });

 
        async function getUnitList(){
            let department_id = $("#head_department").val(); 
            let url = "{{route('backend.get_unit_ist')}}";
            let response = await fetch(`${url}?department_id=${department_id}`);
            let responseData = await response.json();
            let append_to_html = '<option value="">--Select Unit--</option>'; 
            if(responseData.status == "success"){
                responseData.unit_list.forEach(element => { 
                    append_to_html += `<option value="${element.id}">${element.name}</option>`;
                }); 
                $("#unit").html(append_to_html);
            }
        } 
        async function getManagerList(){
            let head_id = $("#head_department").val(); 
            let unit_id = $("#unit").val(); 
            let url = "{{route('backend.get_manager_ist')}}"; 
            let response = await fetch(`${url}?unit_id=${unit_id}&department_head=${head_id}`);
            let responseData = await response.json(); 
            let append_to_html = '<option value="">--Select Manager--</option>';
            if(responseData.status == "success"){
                responseData.manager_list.forEach(element => { 
                    append_to_html += `<option value="${element.id}">${element.name}</option>`;
                });
                $("#manager").html(append_to_html);
            }
        } 
        async function getTeamLeaderList(){
            const logged_in_user = "{{Auth::user()->role_type_id}}";
            const role_type = $("#role_type").val();
            const url = "{{route('backend.team_leader.get_team_leader_list')}}";
            const csrf_token = $('meta[name="csrf-token"]').attr('content');
            const manager_id = $("#manager").val(); 
            if(role_type == 7 && (logged_in_user == 1 || logged_in_user == 2)){
                const manager_id = $("#manager").val();
                const response = await fetch(url, {
                    method:'POST',
                    headers:{
                        'Content-Type':'application/json',
                        'X-CSRF-TOKEN':csrf_token
                    },
                    body:JSON.stringify({
                        'manager_id':manager_id
                    })
                });  
                if(response.ok){
                    const responseData = await response.json();
                    let append_to_html = '<option value="">--Select Manager--</option>';
                    if(responseData.status == "success"){ 
                        responseData.team_leader_list.forEach(element => { 
                            append_to_html += `<option value="${element.id}">${element.name}</option>`;
                        });
                        $("#team_leader").html(append_to_html);
                    }
                } 
            }
        }
    </script>   
 
    @if (Session::has('success'))
        <script>
            Swal.fire({
                title: "Success!",
                text: "{{ Session::get('success') }}",
                icon: "success",
                timer: 5000,
                willClose: () => {
                    window.location.href = "{{ route('backend.employee.index') }}";
                }
            });
        </script>
    @endif



 
@endsection
@endsection
