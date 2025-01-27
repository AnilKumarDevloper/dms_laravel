@extends('layouts/backend/main')
@section('main-section')
    <div class="page-wrapper">
        <div class="container-fluid">
            <div class="row">
                <div class="col-12">
                    <div class="card">
                        <div class="border-bottom title-part-padding">
                            <h4 class="mb-0">Edit Main Category</h4>
                        </div>
                        <div class="card-body">
                            <form action="{{route('backend.main_category.update', [$main_categories->id])}}" method="POST">
                                @csrf
                                <div class="row">
                                    <div class="col-md-4 mb-3">
                                        <label for="validationDefault02">Category Name</label>
                                        <input type="text" class="form-control" id="validationDefault02" name="category_name"
                                            placeholder="Last name" value="{{$main_categories->name}}" require />
                                    </div>
                                    <div class="col-md-4 mb-3">
                                        <label for="validationDefaultUsername">Description</label>
                                        <div class="input-group">
                                            <input type="text" class="form-control"
                                                id="validationDefaultUsername"placeholder="Description" name="discription"
                                                aria-describedby="inputGroupPrepend2" require value="{{$main_categories->description}}" />
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-md-6 mb-3">
                                        <button class="btn btn-primary rounded-pill px-4 mt-3" type="submit">
                                            Submit
                                        </button>
                                        <a href="{{ route('backend.main_category.index') }}"
                                            class="btn btn-danger rounded-pill px-4 mt-3">Cancle</a>
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
