
@extends('layouts/backend/main')
@section('main-section')


<div class="page-wrapper">
    <div class="page-titles">
      <div class="row">
        <div class="col-lg-8 col-md-6 col-12 align-self-center">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb mb-0 d-flex align-items-center">
                <li class="breadcrumb-item"><a href="{{route('dashboard')}}" class="link"><i class="ri-home-3-line fs-5"></i></a></li> 
                <li class="breadcrumb-item active" aria-current="page">Profile</li>
            </ol>
        </nav>
          <h1 class="mb-0 fw-bold">Profile Page</h1>
        </div>
      </div>
    </div>
    <div class="container-fluid">
      <div class="row">
        <!-- Column -->
        <div class="col-lg-4 col-xlg-3 col-md-5">
          <div class="card">
            <div class="card-body">
              <center class="mt-4">
                <div class="image_upload">
                  @if($user->profile_image == NULL)
                    <img src="{{ url('assets/backend/assets/images/users/default_user.png')}}" class="rounded-circle" width="150" />
                  @else
                  <img src="{{ url('assets/backend/assets/images/upload/profile_image')}}/{{Auth::user()->profile_image}}" class="rounded-circle" width="150" />
                  @endif
                  </div>
                <h4 class="mt-2">{{$user->name}}</h4>
                <h6 class="card-subtitle">{{$user->roleType->name}}</h6>
              </center>
            </div>
            <div>
              <hr />
            </div>
            <div class="card-body">
              <small class="text-muted">Email address</small>
              <h6>{{$user->email}}</h6>
              <small class="text-muted pt-4 db">Phone</small>
              <h6>{{$user->phone}}</h6>   

              @if(Auth::user()->role_type_id == 2 || Auth::user()->role_type_id == 5 || Auth::user()->role_type_id == 6 || Auth::user()->role_type_id == 7)
              <small class="text-muted pt-4 db">Department</small>
              <h6>{{$user->getDepartmentType?->name ?? ''}}</h6>  
              @endif 

              @if(Auth::user()->role_type_id == 5 || Auth::user()->role_type_id == 6 || Auth::user()->role_type_id == 7)
              <small class="text-muted pt-4 db">Head</small>
              <h6>{{$user->getHead?->name ?? ''}}</h6>  
              <small class="text-muted pt-4 db">Unit</small>
              <h6>{{$user->getUnit?->name ?? ''}}</h6> 
              @endif 

              @if(Auth::user()->role_type_id == 6 || Auth::user()->role_type_id == 7)
              <small class="text-muted pt-4 db">Manager</small>
              <h6>{{$user->getManager?->name ?? ''}}</h6>  
              @endif 

              @if(Auth::user()->role_type_id == 7)
              <small class="text-muted pt-4 db">Team Leader</small>
              <h6>{{$user->getTeamLeader?->name ?? ''}}</h6>  
              @endif 

            </div>
          </div>
        </div>
        <div class="col-lg-8 col-xlg-9 col-md-7">
          <div class="card overflow-hidden">
            <ul class="nav nav-pills" id="pills-tab" role="tablist">
                <li class="nav-item">
                    <a class="nav-link active" id="pills-timeline-tab" data-bs-toggle="pill" href="#current-month" role="tab" aria-controls="pills-timeline" aria-selected="true">Setting</a >
                </li>
            </ul>
            <div class="tab-content" id="pills-tabContent">
                <div class="card-body">
                  <form class="form-horizontal form-material" action="{{route('backend.user_profile.update')}}" enctype="multipart/form-data" method="POST">
                  @csrf  
                  <div class="mb-3">
                      <label class="col-md-12">First Name</label>
                      <div class="col-md-12">
                        <input type="text" name="f_name" placeholder="Enter First Name" class="form-control form-control-line" value="{{$user->first_name}}" required oninput="capitalizeEachWord(this); allowOnlyLetters(event);"/>
                      </div>
                    </div>
                    <div class="mb-3">
                      <label class="col-md-12">Last Name</label>
                      <div class="col-md-12">
                        <input type="text" name="l_name" placeholder="Enter Last Name" class="form-control form-control-line" value="{{$user->last_name}}" required oninput="capitalizeEachWord(this); allowOnlyLetters(event);"/>
                      </div>
                    </div>
                    
                  <!-- <div class="mb-3">
                      <label class="col-md-12">Full Name</label>
                      <div class="col-md-12">
                        <input type="text" name="name" placeholder="Your Name" class="form-control form-control-line" value="{{$user->name}}" required/>
                      </div>
                    </div> -->
                    <div class="mb-3">
                      <label for="example-email" class="col-md-12">Email</label>
                      <div class="col-md-12">
                        <input type="email" name="email" placeholder="Email" class="form-control form-control-line" name="email"  value="{{$user->email}}" required disabled/>
                        @error('email')
                          <p style="color:red;">{{$message}}</p>
                        @enderror
                      </div>
                    </div>
                    <div class="mb-3">
                      <label class="col-md-12">Phone No</label>
                      <div class="col-md-12">
                        <input type="tel" name="phone" placeholder="Your Phone No." class="form-control form-control-line" value="{{$user->phone}}" maxlength="10"/>
                        @error('phone')
                          <p style="color:red;">{{$message}}</p>
                        @enderror
                      </div>
                    </div>
                    <div class="mb-3">
                      <label class="col-md-12">Enter password if you want to change</label>
                      <div class="col-md-12">
                        <div class="d-flex align-items-center">
                           <span class="inline-block w-100" >
                              <input type="password" name="new_password" class="form-control form-control-line w-100" placeholder="New Password" id="set_password" />
                              @error('new_password')
                          <p style="color:red;">{{$message}}</p>
                        @enderror
                            </span>
                           <span style="cursor: pointer;">
                            <i class="ri-eye-line" id="show_password"></i>
                            <i class="ri-eye-off-line" id="hide_password" style="display:none"></i>
                          </span>
                        </div>
                        
                      </div>
                    </div>
                    
                    <div class="mb-3">
                      <label class="col-md-12">Profile Image</label>
                      <div class="col-md-12">
                      <input type="file" accept="image/*" class="file_upload" name="profile_image"> 
                      </div>
                    </div>
                     
                     
                    <div class="mb-3">
                      <div class="col-sm-12">
                        <button class="btn btn-success">
                          Update Profile
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
  </div>
</div>
@section('javascript-section')
  @if(Session::has('profile_updated'))
  <script>
  Swal.fire({
  title: "Updated!",
  text: "{{Session::get('profile_updated')}}",
  icon: "success"
  });
  </script>
  @endif

<script>
$(document).ready(function(){
    $('#show_password, #hide_password').on('click', function(){
        const set_password = $('#set_password');
        const passwordVisivel = set_password.attr('type')==='text';
        set_password.attr('type', passwordVisivel ? 'password' : 'text');
        $('#show_password').toggle();
        $('#hide_password').toggle();
    });

});
</script>

@endsection


@endsection