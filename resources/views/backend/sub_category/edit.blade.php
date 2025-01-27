
@extends('layouts/backend/main')
@section('main-section')


<div class="page-wrapper">
    <div class="container-fluid">
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="border-bottom title-part-padding">
                        <h4 class="mb-0">Edit Sub Category</h4>
                    </div>
                    <div class="card-body">
                        <form action="{{route('backend.sub_category.update', [$sub_category->id])}}" method="POST">
                            @csrf
                            <div class="row">
                                <div class="col-md-4 mb-3">
                                    <label for="validationDefault02">Category Name</label>
                                    <input type="text" class="form-control" id="validationDefault02" placeholder="Sub Category Name" value="{{$sub_category->name}}" required name="sub_category_name"/>
                                </div>
                                <div class="col-md-4 mb-3">
                                    <label for="validationDefault02">Main Category Name</label>
                                    <select class="form-control" name="main_category_id" required>
                                        <option value="">Select Main Category</option>
                                        @foreach ($main_categories as $main_cat)
                                        <option value="{{$main_cat->id}}" {{$main_cat->id == $sub_category->getMainCategory->id ? 'selected' : '' }}>{{$main_cat->name}}</option>
                                        @endforeach
                                    </select>
                                </div>
                                <div class="col-md-4 mb-3">
                                    <label for="validationDefaultUsername">Description</label>
                                    <div class="input-group">
                                        <input type="text" class="form-control" id="validationDefaultUsername" placeholder="Description" aria-describedby="inputGroupPrepend2" required value="{{$sub_category->description}}" name="discription" />
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <button class="btn btn-primary rounded-pill px-4 mt-3" type="submit">
                                        Submit
                                    </button>
                                    <a href="{{route('backend.sub_category.index')}}" class="btn btn-danger rounded-pill px-4 mt-3" >
                                            Cancle
                                    </a>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
