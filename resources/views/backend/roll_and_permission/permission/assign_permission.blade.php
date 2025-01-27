
@extends('layouts/backend/main')
@section('main-section')

<section id="main-section">
    <h3>Assign Permission</h3>
    <div class="container"> 
    <div class="row">
        <div class="col-md-12">
        <form class="my-5" action="{{route('permission.assign_permission_store')}}" method="get">
        @csrf
        <div class="mb-3">
    <label for="role_id" class="form-label">Select Role</label>
    <select class="form-control" id="roll_id" name="role_id">
    @foreach($roles as $role)  
    <option value="{{$role->id}}">{{$role->name}}</option>
    @endforeach 
    </select>
  </div>
  
  <div class="mb-3">
    <label for="permissions" class="form-label">Select Permission</label>
    @foreach($permissions as $permission)
    <div class="form-check">
        <input class="form-check-input" type="checkbox" value="{{$permission->name}}" id="permissions" name="permissions[]" {{$permission->id}}>
        <label class="form-check-label" for="flexCheckChecked">{{$permission->name}}</label>
    </div>
    @endforeach
</div>
    
  <button type="submit" class="btn btn-primary">Assign</button>
</form>
        </div>
    </div>
    </div>
</section>
@endsection
