<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Permission Update</title>
</head> 
<body style="font-family: sans-serif;">
    <section>
        <div class="emailMSG" style="max-width: 600px; margin: 0 auto; border: 1px solid gainsboro;">
            <div style="width: 100%; height: 8px; background-color:#FFAA1D"></div>
            <div class="emailBox">
                <div class="companylogo" style="border-bottom: 1px solid gainsboro;">
                    <span style="">
                        <center>
                            <img src="{{url('public/assets/logo/cygnett-logo.png')}}" width="20%" alt="">
                        </center>
                    </span>
                </div>  
                <div class="msgtext" style="padding: 1.5rem;">
                    <center>
                        <h4 style="margin: .5rem 0; color: #253a76;">Folder Permission Update Notification</h4>
                    </center>
                    <p style="font-size: 15px;">Hi, <b style="color: #253a76;">{{$all_folder_permission_alert_data['user_name']}}</b></p>
                    @if($all_folder_permission_alert_data['sub_folders'] != null)
                    <p style="font-size: 15px;">We are notifying you that your permissions for a specific folder have been updated.</p>
                    @php
                        $sub_folder_list = App\Models\Backend\SubFolder::with('getMainFolder')->whereIn('id', $all_folder_permission_alert_data['sub_folders'])->get();
                    @endphp
                    <div class="userForm"> 
                        <div class="userDetails"> 
                            <div style="border: 1px solid gainsboro; font-size: 15px;">
                                <div class="w"
                                    style="width: 49%; float: right; border-left: 1px solid gainsboro; padding: 7px 8px; font-size: 15px;">
                                    <b style="color: #1a2c61;">Sub Folder</b>
                                </div>
                                <div class="w" style="width: 49%; padding: 7px 8px; font-size: 15px;">
                                    <span><b style="color: #1a2c61;">Main Folder</b></span>
                                </div>
                            </div> 
                            @foreach($sub_folder_list as $s_folder) 
                            <div style="border: 1px solid gainsboro; border-top: none;">
                                <div class="w"
                                    style="width: 49%; float: right; border-left: 1px solid gainsboro; padding: 7px 8px; font-size: 15px;">
                                    {{$s_folder->name}}
                                </div>
                                <div style="width: 49%; padding: 7px 8px; font-size: 15px;">
                                    <span>{{$s_folder->getMainFolder?->name}}</span>
                                </div>
                            </div>
                            @endforeach 
                        </div>
                        @else
                            <p>We are notifying you that your all folder permission have been removed. You no longer have access to view any folder</p>
                            @endif  
                        <div>
                            <p style="font-size: 13px; margin-top: 2rem;">If you have any questions, feel free to contact us.</p>
                        </div> 
                    </div>
                </div>
                <footer style="background-color: #1a2c61; padding: .7rem 0">
                    <div class="socil">
                        <div style="width: fit-content; margin: 0 auto;">
                            <a href="https://www.facebook.com/cygnetthotels/" style="margin-right: 6px;">
                                <span>
                                    <img src="http://cygnetthotels.com/mailer/images/f_icon.png" alt="">
                                </span>
                            </a>
                            <a href="https://www.instagram.com/cygnett_hotels/" style="margin-right: 6px;">
                                <span>
                                    <img src="http://cygnetthotels.com/mailer/images/i_icon.png" alt="">
                                </span>
                            </a>
                            <a href="https://www.linkedin.com/company/cygnett-hotels-&-resorts/?originalSubdomain=in"
                                style="margin-right: 6px;">
                                <span>
                                    <img src="http://cygnetthotels.com/mailer/images/l_icon.png" alt="">
                                </span>
                            </a>
                            <a href="https://www.youtube.com/user/CygnettHotels" style="">
                                <span>
                                    <img src="http://cygnetthotels.com/mailer/images/y_icon.png" alt="">
                                </span>
                            </a> 
                        </div>
                    </div>
                    <div class="footerdetails"
                        style="color: #fff; border-top: 1px solid #fff; margin: .6rem 0 .7rem 0;">
                        <center>
                            <h4 style="margin:.7rem 0 .4rem 0;">Cygnett Hotels & Resorts</h4>
                            <p style="margin-top: .3rem; font-size: 13.5px;">606, 6th Floor, Tower-D, Unitech Cyber
                                Park, Sector 39, Gurgaon 122003, Haryana, India
                                www.cygnetthotels.com</p>
                        </center>
                    </div>
                </footer>
            </div>
        </div>
    </section>
</body>

</html>