var room = 1;

function education_fields() {
  room++;
  var objTo = document.getElementById("education_fields");
  var divtest = document.createElement("div");
  divtest.setAttribute("class", "mb-3 removeclass" + room);
  var rdiv = "removeclass" + room;
  divtest.innerHTML =
    '<form class="row"><div class="col-md-6"><div class="form-group"><input type="text" class="form-control" id="Schoolname" name="meta_tag" placeholder="Meta Tag"></div></div><div class="col-sm-2"> <div class="form-group"> <button class="btn rounded-pill px-4 btn-light-danger text-danger font-weight-medium waves-effect waves-light" type="button" onclick="remove_education_fields(' +
    room +
    ');"> <i class="ri-delete-bin-line fs-5"></i> </button> </div></div></form>';

  objTo.appendChild(divtest);
  feather.replace();
}

function remove_education_fields(rid) {
  $(".removeclass" + rid).remove();
}
