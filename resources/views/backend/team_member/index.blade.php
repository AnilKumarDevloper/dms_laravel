@extends('layouts/backend/main')
@section('main-section')
<style> 
    .switch {
    position: relative;
    display: inline-block;
    width: 60px;
    height: 34px;
    } 
    .switch input {
    opacity: 0;
    width: 0;
    height: 0;
    } 
    .slider {
    position: absolute;
    cursor: pointer;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;
    background-color: #ccc;
    -webkit-transition: .4s;
    transition: .4s;
    width: 60px;
    height: 33px;
    } 
    .slider:before {
    position: absolute;
    content: "";
    height: 26px;
    width: 26px;
    left: 4px;
    bottom: 4px;
    background-color: white;
    -webkit-transition: .4s;
    transition: .4s;
    } 
    input:checked + .slider {
    background-color: #2196F3;
    } 
    input:focus + .slider {
    box-shadow: 0 0 1px #2196F3;
    } 
    input:checked + .slider:before {
    -webkit-transform: translateX(26px);
    -ms-transform: translateX(26px);
    transform: translateX(26px);
    } 
    .slider.round {
    border-radius: 34px;
    } 
    .slider.round:before {
    border-radius: 50%;
    } 
</style>
<div class="page-wrapper">
    <div class="page-titles">
        <div class="row">
            <div class="col-lg-8 col-md-6 col-12 align-self-center"> 
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb mb-0 d-flex align-items-center">
                    <li class="breadcrumb-item"><a href="{{route('dashboard')}}" class="link"><i class="ri-home-3-line fs-5"></i></a></li> 
                    <li class="breadcrumb-item active" aria-current="page">Team Member</li>
                </ol>
            </nav>
                <h1 class="mb-0 fw-bold">All Team Member</h1>
            </div> 
        </div>
    </div>
    <div class="container-fluid">
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-body">
                        <!---  search section start ---->
                        <div class="d-flex justify-content-end mb-2">
                            <div class="d-flex align-items-center gap-2 mb-2"
                                style="border: 1px solid #54667a; min-width:280px; border-radius:5px; max-width:500px;">
                                <input type="text" class="form-control" id="searchInput_achived" placeholder="Search here..." style="">
                                <span style="font-size:18px; padding: 0 15px;"><i class="ri-search-2-line"></i></span>
                            </div>
                        </div>
                        <!---  search section end ---->
                        <div class="table-responsive">
                            <table id="" class="table table-striped table-bordered text-nowrap">
                                <thead>
                                    <tr>
                                        <th>SN</th>
                                        <th>Name</th> 
                                        <th>Email</th>
                                        <th>Department</th>
                                        <th>Head</th>
                                        <th>Hotel</th>
                                        <th>Manager</th>
                                        <th>Team Leader</th>
                                        <th>Status</th>
                                        <th>Created On</th>
                                        <th style="align-item: end;">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    @php $sn = '1'; @endphp
                                    @foreach($team_members as $member)
                                        <tr>
                                            <td>{{$sn++}}</td>
                                            <td>{{$member->name}}</td> 
                                            <td>{{$member->email}}</td> 
                                            <td>{{$member->getDepartmentType?->name ?? ''}}</td> 
                                            <td>{{$member->getHead?->name ?? ''}}</td>
                                            <td>{{$member->getUnit?->name ?? ''}}</td>
                                            <td>{{$member->getManager?->name ?? ''}}</td>
                                            <td>{{$member->getTeamLeader?->name ?? ''}}</td>

                                            <td>
                                                <label class="switch">
                                                    <input type="checkbox" {{$member->status == 1 ? "checked" : ""}} value="1" name="status" id="status" data-id="{{$member->id}}" {{Auth::user()->role_type_id != 1 ? "disabled" : ""}}>
                                                    <span class="slider round"></span>
                                                </label>
                                            </td>

                                            <td>{{Carbon\Carbon::parse($member->created_at)->format('d M, Y h:i A')}}</td>
                                            <td>
                                            <div class="button-container"> 
                                            @if($member->status)
                                            <a href="{{route('backend.assign_custom_permission', [Crypt::encrypt($member->id)])}}">Permission</a> |
                                            <a href="{{route('backend.assign_folder_permission.assign', [Crypt::encrypt($member->id)])}}">Folder Permission</a>

                                            @if(Auth::user()->role_type_id == 1 || Auth::user()->role_type_id == 2 || Auth::user()->role_type_id == 5)
                                            <a href="{{route('backend.team_member.edit', [Crypt::encrypt($member->id)])}}">
                                                <button class="editBtn">
                                                    <svg height="1em" viewBox="0 0 512 512">
                                                        <path d="M410.3 231l11.3-11.3-33.9-33.9-62.1-62.1L291.7 89.8l-11.3 11.3-22.6 22.6L58.6 322.9c-10.4 10.4-18 23.3-22.2 37.4L1 480.7c-2.5 8.4-.2 17.5 6.1 23.7s15.3 8.5 23.7 6.1l120.3-35.4c14.1-4.2 27-11.8 37.4-22.2L387.7 253.7 410.3 231zM160 399.4l-9.1 22.7c-4 3.1-8.5 5.4-13.3 6.9L59.4 452l23-78.1c1.4-4.9 3.8-9.4 6.9-13.3l22.7-9.1v32c0 8.8 7.2 16 16 16h32zM362.7 18.7L348.3 33.2 325.7 55.8 314.3 67.1l33.9 33.9 62.1 62.1 33.9 33.9 11.3-11.3 22.6-22.6 14.5-14.5c25-25 25-65.5 0-90.5L453.3 18.7c-25-25-65.5-25-90.5 0zm-47.4 168l-144 144c-6.2 6.2-16.4 6.2-22.6 0s-6.2-16.4 0-22.6l144-144c6.2-6.2 16.4-6.2 22.6 0s6.2 16.4 0 22.6z"></path>
                                                    </svg>
                                                </button>
                                            </a>
                                            @endif

                                            @endif 
                                            </div>
                                        </td>
                                        </tr>
                                    @endforeach 
                                </tbody>
                            </table>
                            {{$team_members->links('pagination::bootstrap-5')}} 
                        </div>
                    </div>
                </div>
            </div>
        </div> 
          
    </div>
</div>

@section('javascript-section')
    @if (Session::has('success'))
        <script>
            Swal.fire({
                title: "Success!",
                text: "{{ Session::get('success') }}",
                icon: "success",
                timer: 5000,
            });
        </script>
    @elseif(Session::has('update'))
        <script>
            Swal.fire({
                title: "Success!",
                text: "{{ Session::get('update') }}",
                icon: "success",
                timer: 5000,
            });
        </script>
    @elseif(Session::has('warning'))
        <script>
            Swal.fire({
                title: "Warning!",
                text: "{{ Session::get('warning') }}",
                icon: "warning",
                timer: 5000,
            });
        </script>
        @elseif(Session::has('error'))
        <script>
            Swal.fire({
                title: "Error!",
                text: "{{ Session::get('error') }}",
                icon: "error",
                timer: 5000,
            });
        </script>
        @elseif(Session::has('already_in_use'))
        <script>
            Swal.fire({
                title: "Warning!",
                text: "{{ Session::get('already_in_use') }}",
                icon: "warning"
            });
        </script>
         @elseif(Session::has('deleted'))
        <script>
            Swal.fire({
                title: "Success!",
                text: "{{ Session::get('deleted') }}",
                icon: "success"
            });
        </script>
    @endif


    @if(Auth::user()->role_type_id == 1)
    <script>
    $(document).on("change", "#status", async function() {
        const checkbox = this;
        const isActive = checkbox.checked;
        const statusValue = isActive ? 1 : 0;
        const statusText = isActive ? "Active" : "Inactive";
        const id = $(this).data('id');
        const url = "{{route('backend.team_member.status_change')}}";
        Swal.fire({
            title: 'Are you sure?',
            text: `Do you want to change the status to ${statusText}?`,
            icon: 'warning',
            showCancelButton: true,
            confirmButtonText: 'Yes, change it!',
            cancelButtonText: 'No, keep it',
        }).then(async (result) => {
            if (result.isConfirmed){
                let response = await fetch(`${url}?status=${statusValue}&id=${id}`);
                let responseData = await response.json(); 
                Swal.fire({
                    title: 'Success',
                    text: `The status has been changed successfully.`,
                    icon: 'success',
                    confirmButtonText: 'OK'
                }).then((result) =>{
                    window.location.reload();
                });  
            }else{
                checkbox.checked = !isActive;
            }
        });
    });
</script>
@endif
@endsection
@endsection