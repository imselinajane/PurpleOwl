<%@page import="model.Modal"%>
<!doctype html>
<html lang="en">
    <head>
        <link rel="stylesheet" href="css/background_styles.css">
        <link rel="stylesheet" href="css/style.css"> 
        <title>Purple Owl</title>
        <!-- Required meta tags -->
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
    </head>

    <body>
        <%
            response.setHeader("Cache-control", "no-cache, no-store, must-revalidate");
        %>
        <nav class="navbar">
            <div class="brand-title">The Purple Owl</div>
            <a href="Homepage.jsp" class="toggle-button">
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

        <section aria-label="Newest Photos">
            <div class="carousel" data-carousel>
                <button class="carousel-button prev" data-carousel-button="prev">&#8656;</button>
                <button class="carousel-button next" data-carousel-button="next">&#8658;</button>
                <ul data-slides>
                    <li class="slide" data-active>
                        <img src="img/Photo1.jpg" alt="Will you marry me?">
                    </li>
                    <li class="slide">
                        <img src="img/Photo2.jpg" alt="Merry Christmas">
                    </li>
                    <li class="slide">
                        <img src="img/Photo3.jpg " alt="Happy Birthday">
                    </li>
                </ul>
            </div>
        </section>


        <div class ="heading">
            <h1>
                Making Wonderful Memories
            </h1>
            <p>
                Imagine having your very own cozy private space with personalized ambience to mark your event extra, extra special. <br>
                Imagine you can choose from colors to playlist. Imagine going all out expressive. 
                This is your moment and you want it <br> romantic and etched in your memory forever. Where to go? How to begin? 
                <br>
                <br>
                <br>
                Hello. We're The Purple Owl. We are located at the windy cool Tagaytay.


            </p>
        </div>

        <br>


        <br><br>

        <section id="slider">
            <input type="radio" name="slider" id="s1">
            <input type="radio" name="slider" id="s2">
            <input type="radio" name="slider" id="s3" checked>
            <input type="radio" name="slider" id="s4">
            <input type="radio" name="slider" id="s5">
            <label for="s1" id="slide1">
                <img src="img/gratitude1.jpg" height="100%" width="100%">
            </label>
            <label for="s2" id="slide2">
                <img src="img/gratitude2.jpg" height="100%" width="100%">
            </label>
            <label for="s3" id="slide3">
                <img src="img/gratitude1.jpg" height="100%" width="100%">
            </label>
            <label for="s4" id="slide4">
                <img src="img/gratitude2.jpg" height="100%" width="100%">
            </label>
            <label for="s5" id="slide5">
                <img src="img/gratitude1.jpg" height="100%" width="100%">
            </label>
        </section>
        <br>
        <br>
        <h1 style="text-align: center;font-size: 42px;font-family:Lora, serif;color: #F9E4D4">Our Gratitude</h1>

        <br>
        <br>

        <footer class="footer">
            <div class="container">
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

        <!-- Optional JavaScript -->
        <!-- jQuery first, then Popper.js, then Bootstrap JS -->
        <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
        <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
        <script src="js/script.js" defer></script>
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Lora:ital@1&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro:wght@300&display=swap" rel="stylesheet">

        <!-- Modal -->
        <!-- 
        <div class="modal fade" id="myModal" role="dialog">
            <div class="modal-dialog modal-dialog-centered"  >

                
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="staticBackdropLabel">WELCOME</h5>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                        <h4 class="modal-title"></h4>
                    </div>

                    <div class="modal-body">

                        <p>Would you like to be updated about new promos? <br>
                            Enter your email for updates</p>
                        <form>
                            <div class="form-group">
                                <label for="Email" class="col-form-label" style="color:red;" >Email:</label>
                                <input type="text" class="form-control" id="email" placeholder="juandelacruz@gmail.com">
                            </div>
                    </div>
                    <div class="modal-footer">
                        <button class="btn btn-danger" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#secondModal">Send Email</button>
                    </div>
                </div>
            </div>
        </div>

        
        <div class="modal fade" id="secondModal" role="dialog" data-backdrop="static">
            <div class="modal-dialog modal-dialog-centered">

                
                <div class="modal-content">
                    <div class="modal-header alert alert-success">
                        <h5 class="modal-title" id="staticBackdropLabel">Thank you!</h5>
                        <button type="button" class="close" data-dismiss="modal" id="close">&times;</button>
                        <h4 class="modal-title"></h4>
                    </div>
                    <div class="modal-body">

                        <p>Thank you, will email you! </p>
                    </div>
                </div>
            </div>
        </div>
-->
    </body>

</html>