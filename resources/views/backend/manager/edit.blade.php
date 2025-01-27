@extends('layouts/backend/main')
@section('main-section')
    <div class="page-wrapper">
        <div class="page-titles">
            <div class="row">
                <div class="col-lg-8 col-md-6 col-12 align-self-center">
                <nav aria-label="breadcrumb">
                <ol class="breadcrumb mb-0 d-flex align-items-center">
                    <li class="breadcrumb-item"><a href="{{route('dashboard')}}" class="link"><i class="ri-home-3-line fs-5"></i></a></li> 
                    <li class="breadcrumb-item active" aria-current="page"><a href="{{route('backend.manager.index')}}" class="link">Manager</a></li>
                    <li class="breadcrumb-item active" aria-current="page">Edit</li>
                </ol>
            </nav>
                    <h1 class="mb-0 fw-bold">Edit Manager</h1>
                </div>
            </div>
        </div>
        <div class="container-fluid">
            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-body">
                            <form class="mt-4" method="POST" action="{{route('backend.manager.update', [Crypt::encrypt($manager->id)])}}">
                                @csrf
                                <div class="row">
                                    <div class="mb-3 col-md-6">
                                        <lable>First Name</lable>
                                        <input type="text" class="form-control" placeholder="Enter First Name" name="f_name" id="f_name" value="{{$manager->first_name ?? ''}}" required
                                        oninput="capitalizeEachWord(this); allowOnlyLetters(event);"/>
                                            @error('f_name')
                                            <p style="color:red;">{{$message}}</p>
                                            @enderror
                                    </div>
                                    <div class="mb-3 col-md-6">
                                        <lable>Last Name</lable>
                                        <input type="text" class="form-control" placeholder="Enter Last Name" name="l_name" id="l_name" value="{{$manager->last_name ?? ''}}" required
                                        oninput="capitalizeEachWord(this); allowOnlyLetters(event);"/>
                                            @error('l_name')
                                            <p style="color:red;">{{$message}}</p>
                                            @enderror
                                    </div>

                                    <div class="mb-3 col-md-6">
                                    <lable>Email</lable>
                                        <input type="email" class="form-control" placeholder="Email" name="email" value="{{$manager->email ?? ''}}" required disabled/>
                                        @error('email')
                                        <p style="color:red;">{{$message}}</p>
                                        @enderror
                                    </div>
                                    <div class="mb-3 col-md-6">
                                    <lable>Phone</lable>
                                        <input type="tel" class="form-control" id="phone" placeholder="Phone" name="phone" value="{{$manager->phone ?? ''}}" required
                                        maxlength="10" 
                                            minlength="10" 
                                            pattern="\d{10}" 
                                            oninput="validatePhone(this)"/>
                                            <span style="font-size:11px; color:gray;">Phone number should be 10 digits without country code.</span>
                                        @error('phone')
                                        <p style="color:red;">{{$message}}</p>
                                        @enderror
                                    </div> 
                                    <div class="mb-3 col-md-6">
                                        <lable>Select Role</lable>
                                        <select name="role_type" class="select2 hotel form-control" style="width: 100%;" id="role_type"> 
                                            <option value="">--Select--</option>
                                            @foreach($role_types as $role)
                                                <option value="{{$role->id ?? ''}}" {{$role->id == $manager->role_type_id ? "selected":""}}>{{$role->name ?? ''}}</option>
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
                                            <option value="{{$department->id}}" {{$manager->department_type_id == $department->id ? "selected":""}}>{{$department->name ?? ''}}</option> 
                                        @endforeach
                                      </select>
                                      <p id="department_type_error" style="color:red;"></p>
                                    </div>

                                    <div class="mb-3 col-md-6"  id="head_department_section">
                                    <lable>Head Department</lable>
                                        <select name="head_department" class="select2 form-control"
                                            style="width: 100%;" id="department_head" onchange="">
                                            @if(Auth::user()->role_type_id == 1) 
                                            <option value="">--Select--</option>
                                            @foreach($head_departments as $head_department)
                                            <option value="{{$head_department->id}}" {{$head_department->id == $manager->head_department_id ? "selected":""}}>{{$head_department->name ?? ''}}</option>
                                            @endforeach
                                            @elseif(Auth::user()->role_type_id == 2)
                                            <option value="{{$manager->getHead?->id}}">{{$manager->getHead?->name}}</option>
                                            @endif
                                        </select>
                                        @error('head_department')
                                        <p style="color:red;">{{$message}}</p>
                                        @enderror
                                    </div>

                                    <div class="mb-3 col-md-6" id="hotel_section">
                                    <lable>Hotel</lable>
                                        <select name="hotel" class="select2 form-control" style="width: 100%;" id="unit" onchange="getManagerList();">
                                            <option value="">--Select Manager--</option>
                                             @foreach($units as $unit)
                                                <option value="{{$unit->id ?? ''}}" {{$manager->unit_id == $unit->id ? "selected":""}}>{{$unit->name ?? ''}}</option>
                                            @endforeach   
                                        </select>
                                        @error('hotel')
                                        <p style="color:red;">{{$message}}</p>
                                        @enderror
                                    </div>  

                                    <div class="mb-3 col-md-6" id="manager_section" style="display:none;">
                                        <lable>Manager</lable> 
                                        <select name="manager" class="select2 hotel form-control"
                                            style="width: 100%;" id="manager" onchange="getTeamLeaderList();">  
                                            <option value="">--Select--</option>
                                            @if($managers != '' && $managers != NULL)
                                            @foreach($managers as $mngr)
                                            <option value="{{$mngr?->id}}" {{$mngr->id == $manager->manager_id ? "selected":""}}>{{$mngr?->first_name.' '.$mngr?->last_name}}</option>
                                            @endforeach 
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
        
        $(document).on("change", "#role_type", function(){
            const loggedin_user = "{{Auth::user()->role_type_id}}";
            const role_type = $(this).val();
            if(loggedin_user == 1){
                // if loggedin user is admin.
                if(role_type == 2){
                    // if selected user is head of department.
                    $("#department_type_section").show();
                    $("#head_department_section").hide();
                    $("#manager_section").hide();
                    $("#team_leader_section").hide()
                    $("#hotel_section").hide();
                }else if(role_type == 5){
                    // if selected user is manager.
                    $("#department_type_section").hide();
                    $("#head_department_section").hide();
                    $("#manager_section").hide();
                    $("#team_leader_section").hide()
                    $("#hotel_section").show();

                }else if(role_type == 6){
                    // if selected user is team leader.
                    $("#department_type_section").hide();
                    $("#head_department_section").show();
                    $("#hotel_section").show();
                    $("#manager_section").show();
                    $("#team_leader_section").hide(); 

                }else if(role_type == 7){
                    // if selected user is team member.
                    $("#department_type_section").hide();
                    $("#head_department_section").show();
                    $("#hotel_section").show();
                    $("#manager_section").show();
                    $("#team_leader_section").show();  
                }else{
                    // if nothing is selected.
                    $("#department_type_section").hide();
                    $("#head_department_section").hide();
                    $("#hotel_section").hide();
                    $("#manager_section").hide();
                    $("#team_leader_section").hide(); 
                }
            }else if(loggedin_user == 2){
                // if loggedin user is haed of department.
                   if(role_type == 5){
                    // if selected role is manager.
                    $("#department_type_section").hide();
                    $("#head_department_section").show();
                    $("#manager_section").hide();
                    $("#team_leader_section").hide()
                    $("#hotel_section").show();
                }else if(role_type == 6){
                    // if selected role is team leader.
                    $("#department_type_section").hide();
                    $("#head_department_section").show();
                    $("#hotel_section").show();
                    $("#manager_section").show();
                    $("#team_leader_section").hide(); 
                }else if(role_type == 7){
                    // if selected role is team member.
                    $("#department_type_section").hide();
                    $("#head_department_section").show();
                    $("#hotel_section").show();
                    $("#manager_section").show();
                    $("#team_leader_section").show();  
                }else{
                    // if nothing is seleted
                    $("#department_type_section").hide();
                    $("#head_department_section").hide();
                    $("#hotel_section").hide();
                    $("#manager_section").hide();
                    $("#team_leader_section").hide(); 
                }
            }


        });
 
 

        // async function getUnitList(){
        //     let department_id = $("#head_department").val(); 
        //     let url = "{{route('backend.get_unit_ist')}}";
        //     let response = await fetch(`${url}?department_id=${department_id}`);
        //     let responseData = await response.json();
        //     let append_to_html = '<option value="">--Select Unit--</option>'; 
        //     if(responseData.status == "success"){
        //         responseData.unit_list.forEach(element => { 
        //             append_to_html += `<option value="${element.id}">${element.name}</option>`;
        //         }); 
        //         $("#hotel").html(append_to_html);
        //     }
        // }  
        async function getManagerList(){
            let head_id = $("#department_head").val(); 
            let unit_id = $("#unit").val(); 
            let url = "{{route('backend.get_manager_ist')}}"; 
            let response = await fetch(`${url}?unit_id=${unit_id}&department_head=${head_id}`);
            let responseData = await response.json();  
            let append_to_html = '<option value="">--Select Manager--</option>';
            if(responseData.status == "success"){
                console.log(responseData);
                responseData.manager_list.forEach(element => { 
                    append_to_html += `<option value="${element.id}">${element.name}</option>`;
                });
                $("#manager").html(append_to_html);
            } 
        } 
        async function getTeamLeaderList(){
            const role_type = $("#role_type").val();
            if(role_type == 7){
                const unit_id = $("#unit").val();
                const manager_id = $("#manager").val();
                const url ="{{route('backend.manager.get_team_leader_list')}}";
                const csrf_token = $('meta[name="csrf-token"]').attr('content');
                const response = await fetch(url, {
                    method:'POST',
                    headers:{
                        'Content-Type':'application/json',
                        'X-CSRF-TOKEN':csrf_token,
                    },
                    body:JSON.stringify({
                        'unit_id':unit_id,
                        'manager_id':manager_id
                    }),
                });
                if(response.ok){
                    const responseData = await response.json();  
                    console.log(responseData);
                    let append_to_html = '<option value="">--Select Team Leader--</option>';
                    responseData.team_leader_list.forEach(element =>{
                        append_to_html += `<option value="${element.id}">${element.first_name} ${element.last_name}</option>`;
                    });
                    $("#team_leader").html(append_to_html);
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
