<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Welcome</title>

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
                        <h4 style="margin: .5rem 0; color: #253a76;">Welcome to Cygnett</h4>
                    </center>
                    <p style="font-size: 15px;">Hi, <b style="color: #253a76;">{{$user_detail_mail_data['first_name'] .' '. $user_detail_mail_data['last_name']}}</b></p>
              
                    <p style="font-size: 15px;">These are your login details:</p>
                    <div class="userForm">
                        <div class="userDetails">

                            <div style="border: 1px solid gainsboro; font-size: 15px;">
                                <div class="w"
                                    style="width: 49%; float: right; border-left: 1px solid gainsboro; padding: 7px 8px; font-size: 15px;">
                                    {{$user_detail_mail_data['first_name'] .' '. $user_detail_mail_data['last_name']}}
                                </div>
                                <div class="w" style="width: 49%; padding: 7px 8px; font-size: 15px;">
                                    <span><b style="color: #1a2c61;">Full Name</b></span>
                                </div>
                            </div>
                            <div style="border: 1px solid gainsboro; border-top: none;">
                                <div class="w"
                                    style="width: 49%; float: right; border-left: 1px solid gainsboro; padding: 7px 8px; font-size: 15px;">
                                    <a href="Email:{{$user_detail_mail_data['email']}}">{{$user_detail_mail_data['email']}}</a>
                                </div>
                                <div style="width: 49%; padding: 7px 8px; font-size: 15px;">
                                    <span><b style="color: #1a2c61;">Email</b></span>
                                </div>
                            </div>
                            <div style="border: 1px solid gainsboro; border-top: none;">
                                <div class="w"
                                    style="width: 49%; float: right; border-left: 1px solid gainsboro; padding: 7px 8px; font-size: 15px;">
                                    {{$user_detail_mail_data['phone']}}
                                </div>
                                <div style="width: 49%; padding: 7px 8px; font-size: 15px;">
                                    <span><b style="color: #1a2c61;">Mobile Number</b></span>
                                </div>
                            </div>
                            <div style="border: 1px solid gainsboro; border-top: none;">
                                <div class="w"
                                    style="width: 49%; float: right; border-left: 1px solid gainsboro; padding: 7px 8px; font-size: 15px;">
                                    {{$user_detail_mail_data['password']}}
                                </div>
                                <div style="width: 49%; padding: 7px 8px; font-size: 15px;">
                                    <span><b style="color: #1a2c61;">Your Password</b></span>
                                </div>
                            </div>
                            <div style="border: 1px solid gainsboro; border-top: none;">
                                <div class="w"
                                    style="width: 49%; float: right; border-left: 1px solid gainsboro; padding: 7px 8px; font-size: 15px;">
                                    {{$user_detail_mail_data['role']}}
                                </div>
                                <div style="width: 49%; padding: 7px 8px; font-size: 15px;">
                                    <span><b style="color: #1a2c61;">Role</b></span>
                                </div>
                            </div>

                        </div>
                        <div style="margin-top: 2rem;">
                            <div style="width: fit-content; margin: 1rem auto;">
                                <a href="{{$user_detail_mail_data['login_url']}}" style="text-decoration: none;">
                                    <span
                                        style="padding: 10px 20px; text-decoration: none; font-size: 15px; border: 1px solid #1a2c61; color: #1a2c61; border-radius: 5px;">
                                        Login
                                    </span>
                                </a>
                            </div>
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