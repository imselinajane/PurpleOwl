<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>PurpleOwl Admin Forgot Password</title>
    </head>
    <body>
        <div class="forgotPassBox">
            <h2 class = "forgotLabel">Forgot Password?</h2>
            <form action="forgotPass.do" method="POST">
                <!-- input field for email -->
                <div class ="forgotEmail">
                    <input type="text" class="fEmail" name="adminEmail" placeholder="Email">
                </div>
                <br><br>
                <!-- button to submit inputs -->
                <button class ="sendEmailBT">Send Email</button>
            </form>
        </div>
    </body>
</html>
