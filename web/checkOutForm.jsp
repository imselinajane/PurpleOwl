<%@page import="java.util.*"%>
<%@page import="model.UserCheckOut"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="css/container.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Lora:ital@1&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro:wght@300&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Kaushan+Script&family=Parisienne&display=swap" rel="stylesheet">

        <title>The Purple Owl: Checkout form</title>
    <img src="img/logosmall.png" class="center" alt = "LOGO">
</head>
<!---HEADER--->
<header>
    <nav class="navbar">
        <div class="brand-title"><!---LOGO OR THE PURPLE OWL TEXT---></div>
        <a href="#" class="toggle-button">
            <span class="bar"></span>
            <span class="bar"></span>
            <span class="bar"></span>
        </a>
        <div class="navbar-links">
            <ul>
                <li><a href="Homepage.jsp" >Home</a></li>
                <li><a href="foodPackages.html">Packages</a></li>
                <li><a href="bookNow.jsp">Book Now!</a></li>
                <li><a href="AboutUs.html">About Us</a></li>
                <li><a href="adminLogin.jsp">Log-in</a></li>
            </ul>
        </div>
    </nav>
</header>
<body>
    <%
        UserCheckOut cartDeets = (UserCheckOut) getServletContext().getAttribute("cartDetails");
        String radioPackage = cartDeets.getPackage();
        String radioFood = cartDeets.getFood();
        List<String> radioAddOns = cartDeets.getAddOns();
    %>
    <h1>
        Order Summary
    </h1>
    <br>
    <br>
    <br>
    <br>

    <!---LOG IN PART--->
<center>
    <form action="insertDB.do" method="POST">
        <section class="container">
            <!---div class="left-half"--->
            <div class="Karen">
                <br>
                <br>
                <h4> NAME:</h4>
                <br>
                <!---output name--->
                <br>
                <h4> DATE & TIME:</h4>
                <br>
                <!---output date and time--->
                <br>
                <h4> OCCASION:</h4>
                <br>
                <!---output occasion--->
                <br>
                <h4> HEADCOUNT:</h4>
                <br>
                <!---output headcount--->
                <br>
                <h4> CONTACT NUMBER:</h4>
                <br>
                <!---output number--->
                <br>
                <h4> PACKAGE:</h4>
                <br>
                <!---output package--->
                <%
                    out.println(radioPackage);
                %>
                <h4> MENU:</h4>
                <br>
                <!---output menu--->
                <%
                    out.println(radioFood);
                %>
                <h4> PREFERRED VENUE:</h4>
                <br>
                <!---output preffered venue--->
                <h4> ADD-ONS:</h4>
                <br>
                <!---output add-ons--->
                <%
                    for (int i = 0; i < radioAddOns.size(); i++) {
                        int j = i + 1;
                        out.print(radioAddOns.get(i));
                        if (j != i && j < radioAddOns.size()) {
                            out.print(", ");
                        }
                    };
                    radioAddOns.clear();
                %>
                <h4> DIETARY REQUESTS/RESTRICTIONS:</h4>
                <br>
                <!---output requests--->
                <h4> THEME/COLOUR SCHEME:</h4>
                <br>
                <!---output theme/colour scheme--->
                <h4> PICTURES LINK:</h4>
                <br>
                <!---output picture link--->
                <h4> MEANINGFUL MESSAGE AND QUOTE/S:</h4>
                <br>
                <!---output meaningful message--->
                <h4> MUSIC/MOVIE/BAND PLAYLIST:</h4>
                <br>
                <!---output music/movie/playlist--->
                <br>
                <input type="submit" value="Checkout">
            </div>
    </form>
</center>
<!---Right side--->
<!---div class="right-half"--->
<!---div class="boxed"--->

<!---/div--->
<!---/div--->
<!---/section--->
<!---/center--->
<!---FOOTER--->

</body>
<footer class="footer">
    <div class="container">
        <div class="row">
            <div class="footer-col">
                <h4>The Purple Owl</h4>
                <ul>
                    <li><a href="Homepage.jsp" >Home</a></li>
                    <li><a href="foodPackages.html">Packages</a></li>
                    <li><a href="bookNow.jsp">Book Now!</a></li>
                    <li><a href="AboutUs.html">About Us</a></li>
                    <li><a href="adminLogin.jsp">Log-in</a></li>
                </ul>
            </div>
            <div class="footer-col">
                <h4>Contact Us</h4>
                <ul>
                    <li><p>Contact Number</p></li>
                    <li><p>Email</p></li>
                    <li><p>Address</p></li>
                </ul>
            </div>
            <div class="footer-col">
                <h4>follow us</h4>
                <div class="social-links">
                    <a href="https://www.facebook.com/ThePurpleOwlTagaytay/"><i class="fab fa-facebook-f"></i></a>
                    <a href="#"><i class="fab fa-twitter"></i></a>
                    <a href="https://www.instagram.com/thepurpleowltagaytay/?hl=en"><i class="fab fa-instagram"></i></a>
                    <a href="#"><i class="fab fa-linkedin-in"></i></a>
                </div>
            </div>
        </div>
    </div>
</footer>
</html>



<!---NOTES: -walang logo, add background image, fix box and text spacing, font should be the same as homepage, BASTA MAGANDA DESIGN--->

