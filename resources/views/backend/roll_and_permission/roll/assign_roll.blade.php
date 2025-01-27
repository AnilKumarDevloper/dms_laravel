
@extends('layouts/backend/main')
@section('main-section')

<section id="main-section">
    <div class="container"> 
    <div class="row">
        <div class="col-md-12">
        <form class="my-5" action="{{route('roll.assign_roll_store')}}" method="POST">
        @csrf
        <div class="mb-3">
    <label for="roll_name" class="form-label">Select Roll</label>
    <select class="form-control" id="roll_name" name="roll_name">
    @foreach($rolls as $roll)  
    <option value="{{$roll->name}}">{{$roll->name}}</option>
    @endforeach 
    </select>
  </div>
  
  <div class="mb-3">
    <label for="user_id" class="form-label">Select User</label>
    <select class="form-control" id="user_id" name="user_id">
    @foreach($users as $user)  
    <option value="{{$user->id}}">{{$user->name}}</option>
    @endforeach 
    </select>
  </div>
    
  <button type="submit" class="btn btn-primary">Assign</button>
</form>
        </div>
    </div>
    </div>
</section>
@endsection
