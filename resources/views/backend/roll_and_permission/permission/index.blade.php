
@extends('layouts/backend/main')
@section('main-section')
<section id="main-section">
    <div class="container"> 
    <div class="row">
        <div class="col-md-12">
            <h3 class="my-5">All Permission</h3>
        <table class="table my-3">
  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">Permission Name</th>
      <th scope="col">Action</th> 
    </tr>
  </thead>
  <tbody>
     @foreach($permissions as $permission)
    <tr>
      <th scope="row">1</th>
      <td>{{$permission->name}}</td>
      <td>
      <button type="button" class="btn btn-primary">Edit</button>
        <button type="button" class="btn btn-danger">Delete</button>
    </td> 
    </tr> 
    @endforeach
     
  </tbody>
</table>    
        </div>
    </div>
    </div>
</section>


@endsection
