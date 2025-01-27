@extends('layouts/backend/main')
@section('main-section')
    <div class="page-wrapper">
        <div class="page-titles">
            <div class="row">
                <div class="col-lg-8 col-md-6 col-12 align-self-center">
                    <h1 class="mb-0 fw-bold">Check List</h1>
                </div>

            </div>
        </div>
        <div class="card-body">
            <form action="{{ route('backend.update_checklist', [$dept_id]) }}" method="POST">
                @csrf
                <div class="container">
                    <div class="row g-3">
                        <div class="col-md-6">
                            <label> Select Hotel</label>
                            <select name="hotel_name" id="hotel_name" class="select2 js-programmatic form-control"
                                style="width: 100%; height: 36px" required>
                                <option value="null" selected>--Select--</option>
                                @if (count($hotels) > 0)
                                    @foreach ($hotels as $hotel)
                                        <option value="{{ $hotel->name }}" data-id="{{ $hotel->id }}">
                                            {{ $hotel->name }}</option>
                                    @endforeach
                                @endif
                            </select>
                        </div>
                        <div class="col-md-6">
                            <label>Hotel Location/Detail</label>
                            <input type="text" class="form-control" id="hotel_detail" name="hotel_detail" required>
                            @error('hotel_detail')
                                <p style="color:red;">{{ $message }}</p>
                            @enderror
                        </div>
                        <div class="col-md-6">
                            <label>Write Title</label>
                            <input type="text" class="form-control" id="title" name="title" required>
                            @error('title')
                                <p style="color:red;">{{ $message }}</p>
                            @enderror
                        </div>
                        <div class="col-md-6">
                            <label>Write Description</label>
                            <input type="text" class="form-control" id="description" name="description" required>
                            @error('description')
                                <p style="color:red;">{{ $message }}</p>
                            @enderror
                        </div>
                        <div class="col-md-6">
                            <label>Start Date</label>
                            <input type="date" class="form-control" id="start_date" name="start_date" required>
                            @error('start_date')
                                <p style="color:red;">{{ $message }}</p>
                            @enderror
                        </div>
                        <div class="col-md-6">
                            <label>End Date</label>
                            <input type="date" class="form-control" id="end_date" name="end_date" required>
                            @error('end_date')
                                <p style="color:red;">{{ $message }}</p>
                            @enderror
                        </div>
                        <div class="col-md-6">
                            <label>Select Department User</label>
                            <select name="department_user" id="department_user" class="select2 js-programmatic form-control"
                                style="width: 100%; height: 36px" required>
                                <option value="null" selected>--Select--</option>
                                @if (count($users) > 0)
                                    @foreach ($users as $user)
                                        <option value="{{ $user->id }}">{{ $user->name }}</option>
                                    @endforeach
                                @endif
                            </select>
                            @error('end_date')
                                <p style="color:red;">{{ $message }}</p>
                            @enderror
                        </div>
                    </div>
                </div>
                @foreach ($categories as $categoryName => $items)
                    <div class="main_section" style="border-bottom:1px solid black;">
                        @if ($items->isNotEmpty())
                            <div class="d-flex align-items-center my-3">
                                <input type="checkbox" class="form-check-input me-2 {{ 'main' . $categoryName }}"
                                    id="heading-checkbox"
                                    onchange="checkGroupCheckbox('{{ 'main' . $categoryName }}', '{{ 'inner' . $categoryName }}', '{{ 'lable_' . $categoryName }}')">
                                <h3 class="mb-0">{{ strtoupper(str_replace('_', ' ', $categoryName)) }}</h3>
                            </div>
                            @foreach ($items as $item)
                                <div class="section-container">
                                    <div class="d-flex align-items-center mb-3 label-1 {{ 'lable_' . $categoryName }}">
                                        <input type="checkbox" name="is_checked_{{ $item->id }}" value="1"
                                            class="form-check-input me-2 {{ 'inner' . $categoryName }}"
                                            {{ $item->is_checked == 1 ? 'checked' : '' }} id="field-checkbox"
                                            onchange="checkSingleCheckbox('{{ 'main' . $categoryName }}', '{{ 'inner' . $categoryName }}', '{{ 'lable_' . $categoryName }}')">
                                        <label class="col-sm-2 col-form-label">{{ $item->item_name ?? '' }}</label>
                                        <input type="hidden" name="item_name_{{ $item->id }}"
                                            value="{{ $item->item_name ?? '' }}"
                                            {{ $item->is_checked == 0 ? 'disabled' : '' }}>
                                        <div class="row">
                                            <div class="row">
                                                <div class="col-md-4">
                                                    <label>Make Model</label>
                                                    <input type="text" class="form-control"
                                                        name="make_model_{{ $item->id }}" id="make_model"
                                                        data-item_id="{{ $item->id }}" placeholder="Make Model"
                                                        value="{{ $item->make_model }}"
                                                        {{ $item->is_checked == 0 ? 'disabled' : '' }}>
                                                    <input type="hidden" name="list_id[]" value="{{ $item->id }}"
                                                        {{ $item->is_checked == 0 ? 'disabled' : '' }}>
                                                    @error('list_id')
                                                        <p style="color:red;">{{ $message }}</p>
                                                    @enderror
                                                </div>
                                                <div class="col-md-4">
                                                    <label>Make and manufactur</label>
                                                    <input type="text" class="form-control"
                                                        name="make_and_manufacture_{{ $item->id }}"
                                                        id="make_and_manufacture" placeholder="Make and manufactur"
                                                        value="{{ $item->make_manufacture }}"
                                                        {{ $item->is_checked == 0 ? 'disabled' : '' }}>
                                                </div>
                                                <div class="col-md-4">
                                                    <label>unit location within hotel </label>
                                                    <input type="text" class="form-control"
                                                        name="unit_location_{{ $item->id }}" id="unit_location"
                                                        placeholder="Unit Location" value="{{ $item->unit_location }}"
                                                        {{ $item->is_checked == 0 ? 'disabled' : '' }}>
                                                </div>
                                                <div class="col-md-4 mt-2">
                                                    <label>Qty</label>
                                                    <input type="number" class="form-control"
                                                        name="qty_{{ $item->id }}" id="qty" placeholder="Qty"
                                                        value="{{ $item->qty }}"
                                                        {{ $item->is_checked == 0 ? 'disabled' : '' }}>
                                                </div>
                                                <div class="col-md-4 mt-2">
                                                    <label>Status</label>
                                                    <select name="status_{{ $item->id }}"
                                                        id=""class="select2 js-programmatic form-control"
                                                        style="width: 100%; height: 36px"
                                                        {{ $item->is_checked == 0 ? 'disabled' : '' }}>
                                                        <option value="" selected>Select Status</option>
                                                        <option value="1"
                                                            {{ $item->item_status == 1 ? 'selected' : '' }}>New</option>
                                                        {{-- <option value="2"
                                                            {{ $item->item_status == 2 ? 'selected' : '' }}>Processing
                                                        </option>
                                                        <option value="3"
                                                            {{ $item->item_status == 3 ? 'selected' : '' }}>Complete
                                                        </option> --}}
                                                    </select>
                                                </div>
                                                <div class="col-md-4 mt-2">
                                                    <label>Remarks</label>
                                                    <input type="text" class="form-control"
                                                        name="remark_{{ $item->id }}" id="remark"
                                                        placeholder="Remarks" value="{{ $item->remark }}"
                                                        {{ $item->is_checked == 0 ? 'disabled' : '' }}>
                                                </div>
                                                <input type="hidden" name="category_{{ $item->id }}"
                                                    value="{{ $item->category ?? '' }}"
                                                    {{ $item->is_checked == 0 ? 'disabled' : '' }}>
                                                <input type="hidden" name="category_id_{{ $item->id }}"
                                                    value="{{ $item->category_id ?? '' }}"
                                                    {{ $item->is_checked == 0 ? 'disabled' : '' }}>
                                                <input type="hidden" name="department_id_{{ $item->id }}"
                                                    value="{{ $item->department_id ?? '' }}"
                                                    {{ $item->is_checked == 0 ? 'disabled' : '' }}>
                                                <input type="hidden" name="group_id_{{ $item->id }}"
                                                    value="{{ $item->group_id ?? '' }}"
                                                    {{ $item->is_checked == 0 ? 'disabled' : '' }}>
                                                <input type="hidden" name="order_{{ $item->id }}"
                                                    value="{{ $item->order ?? '' }}"
                                                    {{ $item->is_checked == 0 ? 'disabled' : '' }}>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            @endforeach
                    </div>
                @endif
                @endforeach
                <center>
                    <button type="submit" class="btn  btn-info font-weight-medium rounded-pillc px-4" value="Submit"
                        style="margin-top: 20px;">
                        <div class="d-flex align-items-center">
                            <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24"
                                fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round"
                                stroke-linejoin="round" class="feather feather-send feather-sm fill-white me-2">
                                <line x1="22" y1="2" x2="11" y2="13"></line>
                                <polygon points="22 2 15 22 11 13 2 9 22 2"></polygon>
                            </svg>
                            Submit
                        </div>
                    </button>
                </center>
            </form>
        </div>
    </div>
    @section('javascript-section')
        <script>
            $(document).ready(function() {
                $('.select2 js-programmatic').select2();
            });
        </script>
        <script>
            $(document).on("change", "#hotel_name",
                function() {
                    let selectedOption = $(this).find('option:selected');
                    let hotelId = selectedOption.data('id');
                    console.log(hotelId);
                    $.ajax({
                        url: "{{ route('backend.check_list.getHotels') }}",
                        data: {
                            'id': hotelId
                        },
                        type: "GET",
                        success: function(response) {
                            if (response.status == 200) {
                                $("#hotel_detail").val(response.data.location);
                            }
                        }
                    });
                });
        </script>
    @endsection
@endsection
