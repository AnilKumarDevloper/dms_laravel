@extends('layouts/backend/main')
@section('main-section')
    <div class="page-wrapper">
        <div class="page-titles">
            <div class="row">
                <div class="col-lg-8 col-md-6 col-12 align-self-center">
                <nav aria-label="breadcrumb">
                    <ol class="breadcrumb mb-0 d-flex align-items-center">
                        <li class="breadcrumb-item"><a href="{{route('dashboard')}}" class="link"><i class="ri-home-3-line fs-5"></i></a></li> 
                        <li class="breadcrumb-item active" aria-current="page"><a href="" class="link">User</a></li>
                        <li class="breadcrumb-item active" aria-current="page">Create</li>
                    </ol>
                </nav>
                    <h1 class="mb-0 fw-bold">Add User</h1>
                </div>
            </div>
        </div>
        <div class="container-fluid">
            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="card-body">
                            <form class="mt-4" method="POST" action="{{route('backend.user.store')}}" id="create_user_form">
                                @csrf
                                <div class="row">
                                    <div class="mb-3 col-md-6">
                                        <lable>First Name</lable>
                                        <input type="text" class="form-control" placeholder="First Name" name="f_name" id="f_name"
                                             value="{{ old('f_name') }}" onkeyup="removeError('f_name_error');" 
                                             oninput="capitalizeEachWord(this); allowOnlyLetters(event);" maxlength="20" />
                                             <p id="f_name_error" style="color:red;"></p>
                                            @error('f_name')
                                            <p style="color:red;">{{$message}}</p>
                                            @enderror
                                    </div>
                                    <div class="mb-3 col-md-6">
                                        <lable>Last Name</lable>
                                        <input type="text" class="form-control" placeholder="Last Name" name="l_name" id="l_name"
                                             value="{{ old('l_name') }}" onkeyup="removeError('l_name_error');"
                                             oninput="capitalizeEachWord(this); allowOnlyLetters(event);" maxlength="20"/>
                                             <p id="l_name_error" style="color:red;"></p>
                                            @error('l_name')
                                            <p style="color:red;">{{$message}}</p>
                                            @enderror
                                    </div>

                                    <div class="mb-3 col-md-6">
                                        <lable>Email</lable>
                                        <input type="email" class="form-control" placeholder="Email" name="email" id="email"
                                             value="{{ old('email') }}" onkeyup="removeError('email_error');"/>
                                             <p id="email_error" style="color:red;"></p> 
                                            @error('email')
                                            <p style="color:red;">{{$message}}</p>
                                            @enderror
                                    </div>

                                    <div class="mb-3 col-md-6">
                                    <lable>Phone</lable>
                                        <input type="tel" class="form-control" placeholder="Phone" id="phone" name="phone"
                                          value="{{ old('phone') }}" onkeyup="removeError('phone_error');"  
                                            maxlength="10" 
                                            minlength="10" 
                                            pattern="\d{10}" 
                                            oninput="validatePhone(this)" />
                                            <span style="font-size:11px; color:gray;">Phone number should be 10 digits without country code.</span>
                                            <p id="phone_error" style="color:red;"></p>  
                                            @error('phone')
                                            <p style="color:red;">{{$message}}</p>
                                            @enderror
                                    </div> 
 
                                    <div class="mb-3 col-md-6">
                                    <lable>Select Role</lable>
                                        <select name="role_type" class="select2 hotel form-control"
                                            style="width: 100%;" id="role_type" onchange="removeError('role_type_error');"> 
                                            <option value="">--Select--</option>
                                            @foreach($role_types as $role)
                                            <option value="{{$role->id ?? ''}}">{{$role->name ?? ''}}</option>
                                            @endforeach
                                            {{-- @if(Auth::user()->role_type_id == 1)
                                            <option value="2">Department Head</option>
                                            @endif
                                            @if(Auth::user()->role_type_id == 1 || AutH::user()->role_type_id == 2)
                                            <option value="5">Manager</option>
                                            @endif
                                            @if(Auth::user()->role_type_id == 1 || Auth::user()->role_type_id == 2 || Auth::user()->role_type_id == 5)
                                            <option value="6">Team Leader</option>
                                            <option value="7">Team Member</option>
                                            @endif --}}


                                        </select>
                                        <p id="role_type_error" style="color:red;"></p>  
                                        @error('role_type')
                                        <p style="color:red;">{{$message}}</p>
                                        @enderror
                                    </div>
                                    <div class="mb-3 col-md-6" id="unit_list" style="display:none;">
                                        <lable>Select Units </lable> 
                                        <select class="form-control" name="unit" style="height: 40px; width: 100%" id="unit">
                                            <option value="">--Select--</option>
                                            @if(count($units) > 0)
                                                @foreach($units as $unit)
                                                    <option value="{{$unit->id}}">{{$unit->name}}</option>
                                                @endforeach
                                            @endif
                                    </select>  
                                    </div> 
                                </div>
                                  <div class="row"> 
                                
                                </div> 
                                <br> 
                                <div class="row" id="row_container">
                                </div>

                                <div class="row">
                                <div class="mb-3">
                                <button class="btn btn-primary rounded-pill px-4 mt-3" type="submit"><i data-feather="send" class="feather-sm ms-2 fill-white"></i> Submit</button>
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
        let auth_role = ''; 
    </script>
 
    <script>
        $("#create_user_form").on("submit", function(event){
            event.preventDefault(); 
            let f_name = $("#f_name").val(); 
            let l_name = $("#l_name").val(); 
            let email = $("#email").val(); 
            let phone = $("#phone").val(); 
            let role_type = $("#role_type").val(); 
            let unit = $("#unit").val();
            let department_type = $("#department_type").val();
         
            // let department_head = $("#department_head").val();
            // let manager = $("#manager").val();
            // let team_leader = $("#team_leader").val();
            $("#f_name_error").text(''); 
            $("#l_name_error").text(''); 
            $("#email_error").text(''); 
            $("#phone_error").text('');
            $("#role_type_error").text('');
            $("#unit_error").text('');
            // $("#department_head_error").text('');
            // $("#manager_error").text('');
            // $("#team_leader_error").text('');
            let error_flag = false; 
            if(f_name == ''){
                error_flag = true;
                $("#f_name_error").text('Please First Enter Name.'); 
                console.log('name_error');
            }
            if(l_name == ''){
                error_flag = true;
                $("#l_name_error").text('Please Last Enter Name.'); 
                console.log('name_error');
            }
            if(email == ''){
                error_flag = true;
                $("#email_error").text('Please Enter Email.'); 
                console.log('email_error');
            }
            if(phone == ''){
                error_flag = true;
                $("#phone_error").text('Please Enter Phone Number.'); 
                console.log('phone_error');
            }
            if(role_type == ''){
                error_flag = true;
                $("#role_type_error").text('Please Select Role.'); 
                console.log('role_type_error');
            } 
            // if(unit == ''){
            //     error_flag = true;
            //     $("#unit_error").text('Please Select Unit');
            //     console.log('unit_error');
            // }
            if(department_type == ''){
                 error_flag = true;
                 $("#department_type_error").text('Please Select Department');
                 console.log('department_type_error');
             }
            //  if(department_head == ''){
            //      error_flag = true;
            //      $("#department_head_error").text('Please Select Department Head');
            //      console.log('department_head_error');
            //  }
            //  if(manager == ''){
            //      error_flag = true;
            //      $("#manager_error").text('Please Select Manager');
            //      console.log('manager_error');
            //  }
            //  if(team_leader == ''){
            //      error_flag = true;
            //      $("#team_leader_error").text('Please Select Team Leader');
            //      console.log('team_leader_error');
            //  }
           if(auth_role != ''){ 
                if(error_flag){
                    return false;
                }else{
                    $("#create_user_form").off('submit').submit();
                }
           }else{
            console.log('not ready to submit');
           }     
        });
    </script>
 
     <script>
        $(document).on("change", "#role_type", async function(){
            let role_type_id = $(this).val(); 
            if(role_type_id == 2){
                let url = "{{route('backend.get_department_list')}}";
                let response = await fetch(`${url}`);
                let responseData = await response.json();
                auth_role = responseData.auth_role;
                if(responseData.status == "success"){
                    let html_to_append = '';
                    html_to_append = `<div class="mb-3 col-md-6">
                                      <lable>Department</lable>
                                      <select name="department_type" class="select2 hotel form-control" style="width: 100%;" id="department_type" onchange="removeDepTypeError();"> 
                                      <option value="">--Select Department--</option>
                                      </select>
                                      <p id="department_type_error" style="color:red;"></p>
                                      </div>`;
                    $("#row_container").html(html_to_append); 

                    responseData.department_type_list.forEach(function(department) {
                        $('#department_type').append(`<option value="${department.id}">${department.name}</option>`);
                    });  
                    $("#unit_list").hide();
                    // responseData.unit_list.forEach(function(unit) {
                    //     $('#units').append(`<option value="${unit.id}">${unit.name}</option>`);
                    // });  
                }
            }else if(role_type_id == 5){
                // $("#unit_list").hide();  
                let url = "{{route('backend.get_hierarchie_for_manager')}}";
                let response = await fetch(`${url}`);
                let responseData = await response.json();
                if(responseData.status == "success"){
                    let html_to_append = '';
                    auth_role = responseData.auth_role; 
                    if(responseData.auth_role == 1){
                        html_to_append = `<div class="mb-3 col-md-6">
                                          <lable>Department Head</lable>
                                          <select name="department_head" class="select2 hotel form-control" style="width: 100%;" id="department_head" removeError('department_head_error');"> 
                                          <option value="">--Select Department Head--</option>
                                          </select>
                                            <p id="department_head_error" style="color:red;"></p>
                                          </div>`;
                        $("#row_container").html(html_to_append);
                        responseData.head_department_list.forEach(function(head) {
                         $('#department_head').append(`<option value="${head.id}">${head.name}</option>`);
                        });
                    }
                    // else if(responseData.auth_role == 2){
                    //     html_to_append = `<div class="mb-3 col-md-6">
                    //                   <lable>Unit</lable>
                    //                   <select name="unit" class="select2 hotel form-control" style="width: 100%;" id="unit" onchange="removeError('unit_error');"> 
                    //                   <option value="">--Select Unit--</option>
                    //                   </select>
                    //                    <p id="unit_error" style="color:red;"></p>
                    //                   </div>`;
                    //     $("#row_container").html(html_to_append);
                    //     responseData.unit_list.forEach(function(unit){
                    //         $('#unit').append(`<option value="${unit.id}">${unit.name}</option>`);
                    //     }); 
                    // }
                    $("#unit_list").show();
                } 
            }else if(role_type_id == 6){
                // $("#unit_list").hide();
                let url = "{{route('backend.get_hierarchie_for_team_leader')}}";
                let response = await fetch(`${url}`); 
                let responseData = await response.json();  
                console.log(responseData);
                if(responseData.status == "success"){
                    let html_to_append = '';
                    auth_role = responseData.auth_role;
                    
                    if(responseData.auth_role == 1){
                        html_to_append = `<div class="mb-3 col-md-6">
                                          <lable>Department Head</lable>
                                          <select name="department_head" class="select2 hotel form-control" style="width: 100%;" id="department_head" removeError('department_head_error');" onchange="getManagerList();"> 
                                          <option value="">--Select Department Head--</option>
                                          </select>
                                          <p id="department_head_error" style="color:red;"></p>
                                          </div>
                                           
                                          <div class="mb-3 col-md-6">
                                          <lable>Manager</lable>
                                          <select name="manager" class="select2 hotel form-control" style="width: 100%;" id="manager"  onchange="removeError('manager_error');"> 
                                          <option value="">--Select Manager--</option>
                                          </select>
                                           <p id="manager_error" style="color:red;"></p>
                                          </div>`; 
                        $("#row_container").html(html_to_append);
                        responseData.head_department_list.forEach(function(head){
                         $('#department_head').append(`<option value="${head.id}">${head.name}</option>`);
                        }); 
                        $("#unit_list").show();
                         
                    }else if(responseData.auth_role == 2){
                        html_to_append = `<div class="mb-3 col-md-6">
                                          <lable>Manager</lable>
                                          <select name="manager" class="select2 hotel form-control" style="width: 100%;" id="manager" onchange="removeError('manager_error');"> 
                                          <option value="">--Select Manager--</option>
                                          </select>
                                          <p id="manager_error" style="color:red;"></p>
                                          </div>`;    
                        $("#row_container").html(html_to_append); 
                        $("#unit_list").show(); 
                    } 
                    $("#unit").on("change", getManagerList); 
                }
            }else if(role_type_id == 7){
                // $("#unit_list").hide(); 
                let url = "{{route('backend.get_hierarchie_for_team_member')}}";
                let response = await fetch(`${url}`); 
                let responseData = await response.json();
                if(responseData.status == "success"){
                    let html_to_append = '';
                    auth_role = responseData.auth_role;
                    if(responseData.auth_role == 1){
                        html_to_append = `<div class="mb-3 col-md-6">
                                          <lable>Department Head</lable>
                                          <select name="department_head"  class="select2 hotel form-control" style="width: 100%;" id="department_head" onchange="removeError('department_head_error'); getManagerList();" > 
                                          <option value="">--Select Department Head--</option>
                                          </select>
                                          <p id="department_head_error" style="color:red;"></p>
                                          </div> 
                                          <div class="mb-3 col-md-6">
                                          <lable>Manager</lable>
                                          <select name="manager" class="select2 hotel form-control" style="width: 100%;" id="manager"  onchange="getTeamLeaderList();"> 
                                          <option value="">--Select Manager--</option>
                                          </select>
                                           <p id="manager_error" style="color:red;"></p>
                                          </div>
                                          <div class="mb-3 col-md-6">
                                          <lable>Team Leader</lable>
                                          <select name="team_leader" class="select2 form-control" style="width: 100%;" id="team_leader"> 
                                          <option value="">--Select Team Leader--</option>
                                          </select>
                                           <p id="team_leader_error" style="color:red;"></p>
                                          </div>`;
                        $("#row_container").html(html_to_append);
                        responseData.head_department_list.forEach(function(head) {
                         $('#department_head').append(`<option value="${head.id}">${head.name}</option>`);
                        }); 
                        $("#unit_list").show();
                    }else if(responseData.auth_role == 2){ 
                        html_to_append = `<div class="mb-3 col-md-6">
                                          <lable>Manager</lable>
                                          <select name="manager" class="select2 hotel form-control" style="width: 100%;" id="manager"  onchange="removeError('manager_error'); getTeamLeaderList();"> 
                                          <option value="">--Select Manager--</option>
                                          </select>
                                           <p id="manager_error" style="color:red;"></p>
                                          </div>
                                          <div class="mb-3 col-md-6">
                                          <lable>Team Leader</lable>
                                          <select name="team_leader" class="select2 form-control" style="width: 100%;" id="team_leader"  onchange="removeError('team_leader_error');"> 
                                          <option value="">--Select Team Leader--</option>
                                          </select>
                                           <p id="team_leader_error" style="color:red;"></p>
                                          </div>`;
                                          $("#row_container").html(html_to_append);
                                          $("#unit").on("change", getManagerList); 
                                          $("#unit_list").show(); 
                    }else if(responseData.auth_role == 5){
                        html_to_append = `<div class="mb-3 col-md-6">
                                          <lable>Team Leader</lable>
                                          <select name="team_leader" class="select2 form-control" style="width: 100%;" id="team_leader"  onchange="removeError('team_leader_error');"> 
                                          <option value="">--Select Team Leader--</option>
                                          </select>
                                           <p id="team_leader_error" style="color:red;"></p>
                                          </div>`;
                        $("#row_container").html(html_to_append);
                        responseData.team_leader_list.forEach(function(team_leader) {
                        $('#team_leader').append(`<option value="${team_leader.id}">${team_leader.name}</option>`);
                    });
                }
               
                }
            }
        });
     </script>
 

    <script> 
        function removeDepTypeError(){
            $("#department_type_error").text('');
        }
        function removeError(id){
            $("#"+id).text('');
        }
        async function getUnitList(){
            let department_id = $("#department_head").val(); 
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
           
            let head_id = $("#department_head").val(); 
            let unit_id = $("#unit").val(); 
            console.log('head_id:- ' + head_id);
            let url = "{{route('backend.get_manager_ist')}}";
            if(head_id != '' && unit_id != ''){ 
            let response = await fetch(`${url}?unit_id=${unit_id}&department_head=${head_id}`);
            let responseData = await response.json();
            let append_to_html = '<option value="">--Select Manager--</option>';
            if(responseData.status == "success"){
                responseData.manager_list.forEach(element => { 
                    append_to_html += `<option value="${element.id}">${element.name}</option>`;
                });
                $("#manager").html(append_to_html);
            } 
        }else{
            console.warn('Department head and unit both selsection is required to show manager list.')
        }
        }

        async function getTeamLeaderList(){
            let manager_id = $("#manager").val();
            let url = "{{route('backend.get_team_leader_list')}}";
            let response = await fetch(`${url}?manager_id=${manager_id}`);
            let responseData = await response.json();
            let append_to_html = '<option value="">--Select Team Leader--</option>';
            if(responseData.status == "success"){
                responseData.team_leader_list.forEach(element => {
                    append_to_html += `<option value="${element.id}">${element.name}</option>`;
                });
                $("#team_leader").html(append_to_html);
            }
        }
 
        
 
         
    </script>
        @if(Session::has('created'))
            <script>
                Swal.fire({
                    title: "Success!",
                    text: "{{Session::get('created')}}",
                    icon: "success"
                });
            </script>
             @elseif(Session::has('already_exists'))
            <script>
                Swal.fire({
                    title: "Waning!",
                    text: "{{Session::get('already_exists')}}",
                    icon: "warning"
                });
            </script>
        @endif
@endsection
@endsection
