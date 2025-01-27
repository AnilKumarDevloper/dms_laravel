
@extends('layouts/backend/main')
@section('main-section')

<section id="main-section">
    <div class="container"> 
    <div class="row">
        <div class="col-md-12">
        <form class="my-5" action="{{route('roll.store')}}" method="POST">
        @csrf
  <div class="mb-3">
    <label for="roll_name" class="form-label">Roll Name</label>
    <input type="text" class="form-control" id="roll_name" name="roll_name"> 
  </div> 
  <button type="submit" class="btn btn-primary">Create</button>
</form>
        </div>
    </div>
    </div>
</section>


@endsection
