<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="css/booknow.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Lora:ital@1&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro:wght@300&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Kaushan+Script&family=Parisienne&display=swap" rel="stylesheet">

        <title>Purple Owl: Book Now!</title>
    </head>
    <!---HEADER--->
    <header>

        <div style = "position:absolute; left:80px; top:20px;">
            <img class="logo" src="img/logosmall.png" alt="logo" width="150" height="150">
        </div>

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
        <!---ABOUT US PART--->

        <h1>Create Your Special Occasion With Us!</h1>
        <br>
        <br>
    <center>
        <form action="checkOut.do" method="POST">
            <!---midbox--->
            <div class="midbox-container">
                <div class="locked_container">
                    <div class="basic_details">
                        <h2>Basic Details</h2>
                        <label for="name">Name of Client/Couple:</label><br>
                        <input type="text" id="name" name="name"><br><br>

                        <label for="datetime">Date and Time:</label>
                        <input type="datetime-local" id="datetime" name="datetime"><br><br>

                        <label for="occasion">Occasion:</label><br>
                        <input type="text" placeholder="Birthday, Anniversary, Proposal, etc." id="occasion" name="occasion"><br><br>

                        <label for="headcount">Headcount:</label><br>
                        <input type="text" id="headcount" name="headcount"><br><br>

                        <label for="number">contact number:</label><br>
                        <input type="text" id="number" name="number"><br>
                    </div>
                    <br>
                    <br>  

                    <div class="package_details">
                        <h2>Packages Details</h2>

                        <label for="package">Package:</label>
                        <select id="package" name="package">
                            <option value=""disabled selected>Choose your Package</option>
                            <option value="Simple Romantic"> Simple Romantic </option>
                            <option value="Movie Date"> Movie Date </option>
                            <option value="Live Music"> Live Music </option>
                        </select><br><br>

                        <label for="menu">Menu:</label>
                        <select id="menu" name="menu">
                            <option value=""disabled selected>Choose your Menu</option>
                            <option value="Menu A"> Menu A </option>
                            <option value="Menu B"> Menu B </option>
                            <option value="Menu C"> Menu C </option>
                        </select><br><br>

                        <label for="venue">Preferred Venue:</label><br>
                        <input type="text" placeholder="Indoors/Outdoors" id="venue" name="venue"><br><br>

                        <label for="addons">Add-ons:</label> <br><br>
                        <input type="checkbox" id="candle" name="addOnsChkbox" value="Candles & Petals">
                        <label for="candle"> Candles & Petals</label>
                        <input type="checkbox" id="surprise" name="addOnsChkbox" value="Surprise Room">
                        <label for="vehicle2"> Surprise Room</label>
                        <input type="checkbox" id="vehicle3" name="addOnsChkbox" value="Additional Person">
                        <label for="vehicle3"> Additional Person</label><br>
                        <input type="checkbox" id="vehicle1" name="addOnsChkbox" value="Photo Coverage">
                        <label for="vehicle1"> Photo Coverage</label>
                        <input type="checkbox" id="vehicle2" name="addOnsChkbox" value="Video Coverage w/ Edit">
                        <label for="vehicle2"> Video Coverage w/ Edit</label>
                        <input type="checkbox" id="vehicle3" name="addOnsChkbox" value="Violinist & Guitar">
                        <label for="vehicle3"> Violinist & Guitar</label><br>
                        <input type="checkbox" id="vehicle1" name="addOnsChkbox" value="Fireworks">
                        <label for="vehicle1"> Fireworks</label>
                        <input type="checkbox" id="vehicle2" name="addOnsChkbox" value="Fountains">
                        <label for="vehicle2"> Fountains</label>
                        <input type="checkbox" id="vehicle3" name="addOnsChkbox" value="Flower Bouquets">
                        <label for="vehicle3"> Flower Bouquets</label>
                        <input type="checkbox" id="vehicle3" name="addOnsChkbox" value="Balloons">
                        <label for="vehicle3"> Balloons</label><br><br>

                        <label for="request">Dietary Requests/Restrictions:</label><br>
                        <textarea rows="5" cols="60" name="requestText" placeholder="Enter your requests/restrictions here"></textarea>
                    </div>
                    <br>
                    <br>

                    <div class="personalize_setup">
                        <h2>Personalize Your Set-up</h2>
                        <label for="theme">Choose a Theme/Colour Scheme:</label><br> 
                        <input type="text" id="theme" name="theme"><br>
                        <label for="picture">Paste a GDrive or Picture URL for reference:</label><br>
                        <input type= "url" name="url" id="picture" placeholder="https://example.com" pattern="https://.*" size="30"><br><br>
                        <label for="message">Type a meaningful message and quotes to add in the design:</label><br> 
                        <input type="text" id="message" name="message"><br>
                        <label for="music">Type a meaningful message and quotes to add in the design:</label><br> 
                        <input type="text" id="music" name="message2"><br>
                    </div>
                    <br>
                </div>
            </div>
            </div>

            <div style="margin: auto; width: 50%; border: 3px solid lightblue; padding: 10px; position:center;">
                <p style="color: white;">
                    Terms and Conditions <br> 
                    <br> 
                    01 - INDOOR AND OUTDOOR LOCATION:
                    FIRSTLY, ON THE OCCASION OF RAIN, IF THE SKY IS NOT CLEAR, OR THE FORECAST FOR<br>
                    THE DAY STATES A HIGH PROBABILITY OF RAIN, IT IS OUR PREROGATIVE TO PLACE YOU
                    INDOORS.<br>
                    SECONDLY, OUTDOOR SPOTS WILL AUTOMATICALLY BE PRIORITISED TO FIRST RESERVERS
                    AND/OR CLIENTS THAT AVAILED PACKAGE C OR GROUP GATHERINGS THAT AVAILED FOR
                    LIVE BAND SETUP.<br>

                    <br>
                    02. RESERVATION DETAILS:<br>
                    ALL DETAILS SHOULD BE COLLATED ONLY WITH THE OFFICIAL COORDINATOR.IDEALLY IN
                    ONE THREAD ONLY.<br>
                    <br>
                    03. ACCOMODATION:<br>
                    WE DO NOT HAVE OVERNIGHT ACCOMMODATION AS OF THE MOMENT.<br>
                    <br>
                    04. REFUND, REBOOKING, TRANSFER:<br>
                    WE HAVE A NO REFUND POLICY, BUT ONE MAY DEFER OR POSTPONE OR TRANSFER EVENTS
                    TO BE AVAILED BY SOMEONE ELSE.<br> FOR RESCHEDULING, NOTIFY US WHAT DATE AND WE
                    WILL RELAY TO YOU ITS AVAILABILITY.<br>
                    <br>
                    05. AVAILABILITY OF VENUE:<br>
                    THE AVAILABILITY OF VENUE IS SUBJECT TO CHANGE AT ANY GIVEN NOTICE DUE TO THE
                    FIRST-PAY FIRST-SERVED BASIS POLICY OF OUR EVENT.<br>
                    <br>
                    06. AGREEMENT:<br>
                    FINALIZATION OF EVENT ONCE PAYMENT IS MADE IS AN ACKNOWLEDGMENT AND
                    AGREEMENT TO ALL THE AFOREMENTIONED WRITTEN RULES AND POLICIES.<br>
                    <br>
                </p>
                <input id="checkbox" type="checkbox" />
                <label for="checkbox" style="color: white;"> I agree to these <a href="#">Terms and Conditions</a>.</label> <br>
                <br> 
                <div class="checkoutButton">
                    <button class ="checkoutButton">Check out</button>
                </div>
        </form>
    </center>
</body>

<!---footer--->

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
                    <a href="#"><i class="fab fa-facebook-f"></i></a>
                    <a href="#"><i class="fab fa-twitter"></i></a>
                    <a href="#"><i class="fab fa-instagram"></i></a>
                    <a href="#"><i class="fab fa-linkedin-in"></i></a>
                </div>
            </div>
        </div>
    </div>
</footer>

</html>



<!---NOTES: 1. padagdag nalang yung modal for terms and conditionsn (naiisip ko na magpopopout siya once na napindot yung book now button, then may button na "I agree" bago mawala yung modal. so need nila umagree para makapag book) 2. paayos ng designs 3. pacheck if may kulang--->

