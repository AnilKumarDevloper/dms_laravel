<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document Notification</title>

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
                        <h4 style="margin: .5rem 0; color: #253a76;">Document Notification</h4>
                    </center>
                    <p style="font-size: 15px;">Hi, <b style="color: #253a76;">{{ $shared_document_url['user_email'] }}</b></p>
                    <p style="font-size: 15px;">We are notifying you that a new document has been shared with you. You can view it using the link below.</p>
                    <div class="userForm" style="">
                            <div style="width: fit-content; margin: 1rem auto;">
                                <a href="{{ route('frontend.publicly_shared_document_view', [Crypt::encrypt($shared_document_url['doc_file']), Crypt::encrypt($shared_document_url['row_id'])]) }}">
                                    <span style="padding: 10px 20px; text-decoration: none; font-size: 15px; background-color: #1a2c61; color: #fff; border-radius: 5px;">
                                        View Document
                                    </span>
                                </a>
                            </div>
                            <div style="margin-top: 2rem;">
                                <p><i style="font-size: 13px; color: red;">Please note: This link is valid until  {{ Carbon\Carbon::parse($shared_document_url['valid_until'])->format('d M, Y') }}.</i></p>
                                <p style="font-size: 13px;">If you have any questions, feel free to contact us.</p>
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