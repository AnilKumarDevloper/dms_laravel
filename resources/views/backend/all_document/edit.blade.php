@extends('layouts/backend/main')
@section('main-section')

<div class="page-wrapper">
    <div class="page-titles">
        <div class="row">
            <div class="col-lg-8 col-md-6 col-12 align-self-center">
                <nav aria-label="breadcrumb">
                </nav>
                <h1 class="mb-0 fw-bold">Edit Document</h1>
            </div>
        </div>
    </div>
    <div class="container-fluid">
        <div class="row">
            <div class="col-12">
                <div class="card">
                    <div class="card-body">
                        <form class="mt-4">
                            <div class="row">
                                <div class="mb-3 col-md-6">
                                    <input type="text" class="form-control" placeholder="Name" />
                                </div>
                                <div class="col-md-6">
                                    <div class="mb-3">
                                        <select name="role-type" id="" class="select2 js-programmatic form-control"  style="width: 100%; height: 36px">
                                            <option selected>Select Main Category</option>
                                            <option >Sub Category</option>
                                         </select>
                                    </div>
                                </div>
                                <div class="mb-3m col-md-6">
                                 <select name="categories" id="" class="select2 js-programmatic form-control"  style="width: 100%; height: 36px">
                                    <option value="0" selected>Select Sub Category</option>
                                    <option value="2">Main Category</option>
                                 </select>
                                </div>

                                <div class="mb-3m col-md-6">
                                    <textarea class="form-control" rows="3" placeholder="Description"></textarea>
                                </div>

                                <div class="mb-3m col-md-6" style="margin-bottom: 20px;">
                                    <select name="role-type" id="" class="select2 js-programmatic form-control"  style="width: 100%; height: 36px">
                                        <option selected>Select Role</option>
                                        <option >Employe</option>
                                        <option >Staff</option>
                                        <option >Department</option>
                                    </select>
                                </div>
                                <div class="col-md-6 mt-2">
                                    <input type="text" class="form-control" id="desig" placeholder="Assign/share with users" />
                                </div>
                                <div class="col-md-6 mb-3">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="row">
                                                <div class="col-md-4">
                                                    <label for="start_date" class="form-label">Start Date</label>
                                                </div>
                                                <div class="col-md-8">
                                                    <input type="date" class="form-control mb-3" placeholder="Start Date">
                                                </div>
                                                <div class="col-md-4">
                                                    <label for="start_time" class="form-label">Start Time</label>
                                                </div>
                                                <div class="col-md-8">
                                                    <input type="time" class="form-control" placeholder="Start Time">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6 mt-3">
                                    <div class="row">
                                        <div class="col-md-6">
                                            <div class="row">
                                                <div class="col-md-4">
                                                    <label for="end_date" class="form-label">End Date</label>
                                                </div>
                                                <div class="col-md-8">
                                                    <input type="date" class="form-control" name="end-date" id="end-date">
                                                </div>
                                                <div class="col-md-4 mt-3">
                                                    <label for="end_time" class="form-label">End Time</label>
                                                </div>
                                                <div class="col-md-8 mt-3">
                                                    <input type="time" class="form-control" name="end-time" id="emd-time">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-6 mt-3">
                                    <input type="file" name="file" class="form-control" required />
                                  </div>
                                  <div class="col-md-6 mt-3">
                                   <select name="status" id="status" class="select2 js-programmatic form-control" style="width: 100%; height: 36px">
                                    <option value="0" selected>Select Status</option>
                                    <option value="1">Processing</option>
                                    <option value="2">Done</option>
                                   </select>
                                  </div>
                                  <div class="mt-3 check-box">
                                    <input class="form-check-input" type="checkbox" id="check1" name="option1" value="something" >
                                    <label class="form-check-label">Can Download?</label>
                                  </div>
                                <div class="mt-3">
                                    <button
                                        class=" btn rounded-pill px-4 btn-light-success text-success font-weight-medium waves-effect waves-light "
                                        type="submit">
                                        <i data-feather="send" class="feather-sm ms-2 fill-white"></i>
                                        Submit
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













@endsection
