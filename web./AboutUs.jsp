<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="css/background_styles.css">
        <link rel="stylesheet" type="text/css" href="css/style.css"> 
        <script src="script.js" defer></script>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Lora:ital@1&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro:wght@300&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
        <title>Purple Owl</title>
    </head>
    <body>
        <nav class="navbar">
            <div class="brand-title">The Purple Owl</div>
            <a href="#" class="toggle-button">
                <span class="bar"></span>
                <span class="bar"></span>
                <span class="bar"></span>

            </a>
            <div class="navbar-links">
                <ul>
                    <li><a href="Homepage.jsp" >Home</a></li>
                    <li><a href="foodPackages.jsp">Packages</a></li>
                    <li><a href="bookNow.jsp">Book Now!</a></li>
                    <li><a href="AboutUs.jsp">About Us</a></li>
                        <% if (session.getAttribute("sessionTest") == null || session == null) { %>
                    <li><a href="adminLogin.jsp">Log-in</a></li>
                        <% } else { %>
                    <li><a href="adminDatabase.jsp">Admin Database</a></li>
                    <li><a href="logout.do">Log out</a></li>
                        <% }%>
                </ul>
            </div>
        </nav>


        <!-- About Us -->
        <div class="container">
            <h1>MAGICAL WELCOME</h1>
            <br>
            <div class="box">
                <div class="icon"><i class="fa fa-info-circle" aria-hidden="true"></i></div>
                <div class="content">
                    <h3>About Us</h3>
                    <p> The Purple Owl is a lovely out-of-town destination for your next date night, movie night, or even your wedding
                        One of Tagaytay's best kept secrets. It's every couple's dining, anniversary, and wedding destination.outdoor movie night.
                        A magical place at Tagaytay. </p>
                </div>
            </div>

            <div class="box">
                <div class="icon"><i class="fa fa-eye" aria-hidden="true"></i></div>
                <div class="content">
                    <h3>Vision</h3>
                    <p> To craft the brands and choice of drinks that people love, to refresh them in body & spirit. And done in
                        ways that create a more sustainable business and better shared future that makes a difference in people's lives, 
                        communities and our planet. </p>
                </div>
            </div>
            <div class="box">
                <div class="icon"><i class="fa fa-thumb-tack" aria-hidden="true"></i></i></div>
                <div class="content">
                    <h3>Mission</h3>
                    <p> Our mission at The Purple Owl is capturing families stories with imagination, innovation and creativity </p>
                </div>
            </div>
        </div>

        <br>
        <br>
        <br>
        <div class="container1">
            <h1>GET KNOW US</h1>
            <p> some of the videos is from vlogger fujhdfghdsjfghfgjg </p>
            <div class="wrapper">
                <div class="row">
                    <div class="col">
                        <div class="videowrapper">
                            <iframe src="https://www.youtube.com/embed/o7mba-tYZ9U" title="YouTube video player" 
                                    frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                        </div>
                    </div>
                    <div class="col"> 
                        <div class="small-video-row">
                            <div class="videowrapper1">
                                <iframe src="https://www.youtube.com/embed/3cxTS21ycr0" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                            </div>
                            <p>Featured by Unang Balita"Ilang pasyalan sa Tagaytay, patok na date place <br> sa mga magkasintahan"</p>
                        </div>
                        <div class="col"> 
                            <div class="small-video-row">
                                <div class="videowrapper1">
                                    <iframe src="https://www.youtube.com/embed/P-A4hvnw6kk" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>

                                </div>
                                <p>Credits to Mark and Melody for sharing your Wedding Proposal with <br> Purple Owl Tagaytay</p>
                            </div>
                            <div class="col"> 
                                <div class="small-video-row">
                                    <div class="videowrapper1">
                                        <iframe src="https://www.youtube.com/embed/-VwX8Emdd1A" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                                    </div>
                                    <p>Credits to Miss AJCotoner for sharing their wonderful proposal with <br> Purple Owl Tagaytay </p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <footer class="footer">
            <div class="container4">
                <div class="row">
                    <div class="footer-col">
                        <h4>The Purple Owl</h4>
                        <ul>
                            <li><a href="Homepage.jsp" >Home</a></li>
                            <li><a href="foodPackages.jsp">Packages</a></li>
                            <li><a href="bookNow.jsp">Book Now!</a></li>
                            <li><a href="AboutUs.jsp">About Us</a></li>
                                <% if (session.getAttribute("sessionTest") == null || session == null) { %>
                            <li><a href="adminLogin.jsp">Log-in</a></li>
                                <% } else { %>
                            <li><a href="adminDatabase.jsp">Admin Database</a></li>
                            <li><a href="logout.do">Log out</a></li>
                                <% }%>
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
                            <a href="#"><i class="fa fa-facebook" aria-hidden="true"></i></a>
                            <a href="#"><i class="fa fa-twitter" aria-hidden="true"></i></a>
                            <a href="#"><i class="fa fa-instagram" aria-hidden="true"></i></a>
                        </div>
                    </div>
                </div>
            </div>
        </footer>
    </body>
</html>