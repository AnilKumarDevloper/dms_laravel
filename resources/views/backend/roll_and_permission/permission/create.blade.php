
@extends('layouts/backend/main')
@section('main-section')

<section id="main-section">
    <div class="container"> 
    <div class="row"> 
        <div class="col-md-12">
        <h3 class="my-5">Create Permission</h3>
        <form class="my-5" action="{{route('permission.store')}}" method="POST">
        @csrf
  <div class="mb-3">
    <label for="permission_name" class="form-label">Permission Name</label>
    <input type="text" class="form-control" id="permission_name" name="permission_name"> 
  </div> 
  <button type="submit" class="btn btn-primary">Create</button>
</form>
        </div>
    </div>
    </div>
</section> 
@endsection
