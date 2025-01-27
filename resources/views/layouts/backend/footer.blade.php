<footer class="footer">{{Carbon\Carbon::now()->format('Y')}}© All Rights Reserved by Cygnett</footer>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="{{ url('assets/backend/assets/libs/jquery/dist/jquery.min.js') }}"></script>
<script src="{{ url('assets/backend/assets/libs/bootstrap/dist/js/bootstrap.bundle.min.js') }}"></script>
<script src="{{ url('assets/backend/dist/js/app.min.js') }}"></script>
<script src="{{ url('assets/backend/dist/js/app.init.js') }}"></script>
<script src="{{ url('assets/backend/dist/js/app-style-switcher.js') }}"></script>
<script src="{{ url('assets/backend/assets/libs/perfect-scrollbar/dist/perfect-scrollbar.jquery.min.js') }}"></script>
<script src="{{ url('assets/backend/assets/extra-libs/sparkline/sparkline.js') }}"></script>
<script src="{{ url('assets/backend/dist/js/waves.js') }}"></script>
<script src="{{ url('assets/backend/dist/js/sidebarmenu.js') }}"></script>
<script src="{{ url('assets/backend/dist/js/feather.min.js') }}"></script>
<script src="{{ url('assets/backend/dist/js/custom.min.js') }}"></script>
<script src="{{ url('assets/backend/assets/libs/apexcharts/dist/apexcharts.min.js') }}"></script>
<script src="{{ url('assets/backend/dist/js/pages/dashboards/dashboard1.js') }}"></script>
<script src="{{ url('assets/backend/assets/extra-libs/taskboard/js/jquery-ui.min.js') }}"></script>
<script src="{{ url('assets/backend/dist/js/pages/chat/chat.js') }}"></script>
<script src="{{ url('assets/backend/assets/extra-libs/taskboard/js/jquery.ui.touch-punch-improved.js') }}"></script>
<script src="{{ url('assets/backend/asse0s/extra-libs/taskboard/js/lobilist.js') }}"></script>
<script src="{{ url('assets/backend/assets/extra-libs/taskboard/js/lobibox.min.js') }}"></script>
<script src="{{ url('assets/backend/assets/extra-libs/taskboard/js/task-init.js') }}"></script>
<script src="{{ url('assets/backend/assets/libs/popper.js/popper.min.js') }}"></script>
<script src="{{ url('assets/backend/assets/libs/moment/min/moment.min.js') }}"></script>
<script src="{{ url('assets/backend/assets/libs/fullcalendar/dist/fullcalendar.min.js') }}"></script>
<script src="{{ url('assets/backend/dist/js/pages/calendar/cal-init.js') }}"></script>
<script src="{{ url('assets/backend/assets/extra-libs/datatables.net/js/jquery.dataTables.min.js') }}"></script>
<script src="{{ url('assets/backend/assets/extra-libs/datatables.net-bs4/js/dataTables.responsive.min.js') }}"></script>
<script src="{{ url('assets/backend/dist/js/pages/datatable/datatable-basic.init.js') }}"></script>
<script src="{{ url('assets/backend/assets/extra-libs/prism/prism.js') }}"></script>
<script src="{{ url('assets/backend/assets/libs/dropzone/dist/min/dropzone.min.js') }}"></script>
<script src="{{ url('assets/backend/assets/libs/jquery.repeater/jquery.repeater.min.js') }}"></script>
<script src="{{ url('assets/backend/assets/extra-libs/jquery.repeater/repeater-init.js') }}"></script>
<script src="{{ url('assets/backend/assets/extra-libs/jquery.repeater/dff.js') }}"></script>
<script src="{{ url('assets/backend/assets/libs/select2/dist/js/select2.full.min.js') }}"></script>
<script src="{{ url('assets/backend/assets/libs/select2/dist/js/select2.min.js') }}"></script>
<script src="{{ url('assets/backend/dist/js/pages/forms/select2/select2.init.js') }}"></script>
<script src="{{ url('assets/backend/dist/js/custom.js') }}"></script>

 <!-- Chart JS -->
 <!-- <script src="{{ url('assets/backend/dist/js/pages/chartjs/chartjs.init.js') }}"></script>
 <script src="{{ url('assets/backend/assets/libs/chart.js/dist/Chart.min.js') }}"></script> -->

<!-- <script src="https://cdn.jsdelivr.net/npm/select2@4.1.0-rc.0/dist/js/select2.min.js"></script> -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/slick-carousel/1.9.0/slick.js" integrity="sha512-eP8DK17a+MOcKHXC5Yrqzd8WI5WKh6F1TIk5QZ/8Lbv+8ssblcz7oGC8ZmQ/ZSAPa7ZmsCU4e/hcovqR8jfJqA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.9.0/js/bootstrap-datepicker.min.js"></script>

<script src="https://cdn.jsdelivr.net/npm/chartjs-plugin-datalabels"></script>
<script> 
function togglePassword() {
    const passwordField = document.getElementById('password');
    const toggleIcon = document.getElementById('togglePasswordIcon'); 
    if (passwordField.type === 'password') {
        passwordField.type = 'text';
        toggleIcon.classList.remove('fa-eye');
        toggleIcon.classList.add('fa-eye-slash');
    } else {
        passwordField.type = 'password';
        toggleIcon.classList.remove('fa-eye-slash');
        toggleIcon.classList.add('fa-eye');
    }
}
 </script>
@yield('javascript-section')

<!-- <script>
    (function() {
        "use strict";
        window.addEventListener(
            "load",
            function() {
                var forms = document.getElementsByClassName("needs-validation");
                var validation = Array.prototype.filter.call(
                    forms,
                    function(form) {
                        form.addEventListener(
                            "submit",
                            function(event) {
                                if (form.checkValidity() === false) {
                                    event.preventDefault();
                                    event.stopPropagation();
                                }
                                form.classList.add("was-validated");
                            },
                            false
                        );
                    }
                );
            },
            false
        );
    })();
</script> -->
</body>

</html>
