<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" href="css/booknow.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Lora:ital@1&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro:wght@300&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Kaushan+Script&family=Parisienne&display=swap" rel="stylesheet">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

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
    </header>
    <script>var basePrice = 0;</script>


    <!---ABOUT US PART--->

    <div class="header-container">
        <h1>Create Your Special Occasion With Us!</h1>
    </div>
    <center>
        <% response.setHeader("Cache-control", "no-cache, no-store, must-revalidate"); %>
        <form action="checkOut.do" method="POST">
            <!---midbox--->
            <div class="form-container">
                <div class="form-navbar">
                    <li onclick="changeForm(1)" id="basic">1. Basic Details</li>
                    <li onclick="changeForm(2)" id="packages">2. Packages Details</li>
                    <li onclick="changeForm(3)" id="personalize">3. Personalize Your Set-Up</li>
                </div>
                <div class="form-content" id='form1'>
                    <div class="inputBox">
                        <input type="text" class='textbox' id="name" name="name" required>
                        <div class="titleBox">
                            Name of Client/Couple
                        </div>
                    </div>
                    <div class="inputBox">
                        <input type="datetime-local" class='textbox' id="datetime" name="datetime" required>
                        <div class="titleBox">
                            Date and Time
                        </div>
                    </div>
                    <div class="inputBox">
                        <input type="text" class='textbox' id="name" name="occasion" placeholder="Birthday, Anniversary, Proposal, etc." required>
                        <div class="titleBox">
                            Occasion
                        </div>
                    </div>
                    <div class="inputBox">
                        <input type="text" class='textbox' id="name" name="headcount" placeholder='# of people attending the event' required>
                        <div class="titleBox">
                            Headcount
                        </div>
                    </div>
                    <div class="inputBox">
                        <input type="text" class='textbox' id="name" name="number" required>
                        <div class="titleBox">
                            Contact Number
                        </div>
                    </div>
                    <a onclick="changeForm(2)" class="nextButton">>></a>
                </div>

                <div class="form-content" id="form2">
                    <%
                        try {
                            //Register driver
                            Class.forName(getServletContext().getInitParameter("jdbcClassName"));
                            System.out.println("Loaded driver.");

                            //Use String buffer for connection
                            StringBuffer buff = new StringBuffer(getServletContext().getInitParameter("jdbcDriverURL"))
                                    .append("://").append(getServletContext().getInitParameter("dbHostName"))
                                    .append(":").append(getServletContext().getInitParameter("dbPort"))
                                    .append("/").append(getServletContext().getInitParameter("databaseName"));
                            //jdbc:derby://localhost:1527/PurpleOwlAdminDB

                            //Establish connection
                            Connection con = DriverManager.getConnection(buff.toString(),
                                    getServletContext().getInitParameter("dbUserName"), getServletContext().getInitParameter("dbPassword"));
                            System.out.println("You are now connected.");
                            String query = "SELECT * FROM ITEMDB";
                            PreparedStatement pStmt = con.prepareStatement(query);
                    %>
                    <!-- select package -->
                    <div class="inputBox">
                        <select class="options" name="package">
                            <option value="" data-price="0" disabled selected>Choose your Package</option>
                            <% ResultSet rs = pStmt.executeQuery();
                                while (rs.next()) {
                                    if (rs.getString("TYPE").equals("Package")) { %>
                            <option value="<%out.print(rs.getString("NAME"));%>" data-price="<%out.print(rs.getInt("PRICE"));%>"> 
                                <%out.print(rs.getString("NAME"));%> </option>
                                <% }
                                    }%>
                        </select>
                        <div class="titleBox">
                            Package
                        </div>
                    </div>

                    <!-- select menu -->

                    <div class="inputBox">
                        <select class="options" name="menu">
                            <option value="" data-price="0" disabled selected>Choose your Menu</option>
                            <% ResultSet rsMenu = pStmt.executeQuery();
                                while (rsMenu.next()) {
                                    if (rsMenu.getString("TYPE").equals("Menu")) {
                            %>
                            <option value="<%out.print(rsMenu.getString("NAME"));%>" data-price="<%out.print(rsMenu.getInt("PRICE"));%>"> 
                                <%out.print(rsMenu.getString("NAME"));%> </option>
                                <% }
                                    }%>
                        </select>
                        <div class="titleBox">
                            Menu
                        </div>
                    </div>

                    <div class="inputBox">
                        <input type="text" class="textbox" id="venue" name="venue" placeholder="Indoors/Outdoors">
                        <div class="titleBox">
                            Preferred Venue
                        </div>
                    </div>

                    <!-- select add-on -->

                    <div class="inputBox2">    
                        <div class="titleBox2">
                            Add-ons
                        </div>
                        <div class="checkBoxContainer">
                            <div class="centerDiv">
                                <% ResultSet rsAddOn = pStmt.executeQuery();
                                    while (rsAddOn.next()) {
                                        if (rsAddOn.getString("TYPE").equals("Add-On")) { %>
                                <input type="checkbox" id="addOnsChkbox" data-price="<%out.print(rsAddOn.getInt("PRICE"));%>" 
                                       name="addOnsChkbox" value="<%out.print(rsAddOn.getString("NAME"));%>">
                                <label for="addOnsChkbox"><%out.print(rsAddOn.getString("NAME"));%></label>
                                <% }
                                    } %>
                            </div>
                        </div>
                    </div>

                    <div class="inputBox">
                        <textarea rows="5" cols="60" name="requestText" placeholder="Enter your requests/restrictions here"></textarea>
                        <div class="titleBox">
                            Dietary Requests/Restrictions
                        </div>
                    </div>
                    <a onclick="changeForm(3)" id="pogBT" class="nextButton">>></a>
                </div>
                <%      rs.close();
                        rsMenu.close();
                        rsAddOn.close();
                        pStmt.close();
                    } catch (SQLException sqle) {
                        sqle.printStackTrace();
                    }%>
                <div class="form-content" id="form3">
                    <div class="inputBox">
                        <input type="text" class="textbox" id="theme" name="theme" >
                        <div class="titleBox">
                            Choose a Theme/Colour Scheme
                        </div>
                    </div>

                    <div class="inputBox">
                        <input type= "url" class="textbox" name="url" id="picture" placeholder="https://example.com" pattern="https://.*" size="30">
                        <div class="titleBox">
                            Paste a G-drive or Picture URL for Reference
                        </div>
                    </div>

                    <div class="inputBox">
                        <input type="text" class="textbox" id="message" name="message">
                        <div class="titleBox">
                            Meaningful Message and Quotes to Add
                        </div>
                    </div>

                    <div class="inputBox">
                        <input type="text" class="textbox" id="music" name="message2">
                        <div class="titleBox">
                            Meaningful Message and Quotes to Add
                        </div>
                    </div>
                    <div class="centerDiv2">
                        <input type="checkbox" class="terms" id="modalButton" name="terms" value="terms" required>&nbsp;&nbsp;&nbsp;
                        <label for="terms"> I agree to the terms and conditions</label>


                    </div>
                </div>
            </div>
            <% int i = 0; %>
            <br><br><h1>Price: Php <span id="item-price">0.00</span></h1><br><br> <!-- change this css -->
            <input type="hidden" id="totalPrice" name="price" value="0">

            <div id="myModal" class="modal" >

                <!-- Modal content -->
                <div class="modal-content">
                    <span class="close">&times;</span>
                    <div class="termsHeader">Terms and Conditions</div>
                    <textarea class="termsContainer" readonly>Welcome to Purple Owl!
01. INDOOR AND OUTDOOR LOCATION:
FIRSTLY, ON THE OCCASION OF RAIN, IF THE SKY IS NOT CLEAR, OR THE FORECAST FOR THE DAY STATES A HIGH PROBABILITY OF RAIN, IT IS OUR PREROGATIVE TO PLACE YOU INDOORS.
SECONDLY, OUTDOOR SPOTS WILL AUTOMATICALLY BE PRIORITISED TO FIRST RESERVERS AND/OR CLIENTS THAT AVAILED PACKAGE C OR GROUP GATHERINGS THAT AVAILED FOR LIVE BAND SETUP.

02. RESERVATION DETAILS
ALL DETAILS SHOULD BE COLLATED ONLY WITH THE OFFICIAL COORDINATOR.IDEALLY IN ONE THREAD ONLY.

03. ACCOMODATION
WE DO NOT HAVE OVERNIGHT ACCOMMODATION AS OF THE MOMENT.

04. REFUND, REBOOKING, TRANSFER
WE HAVE A NO REFUND POLICY, BUT ONE MAY DEFER OR POSTPONE OR TRANSFER EVENTS TO BE AVAILED BY SOMEONE ELSE. FOR RESCHEDULING, NOTIFY US WHAT DATE AND WE WILL RELAY TO YOU ITS AVAILABILITY.

05. AVAILABILITY OF VENUE
THE AVAILABILITY OF VENUE IS SUBJECT TO CHANGE AT ANY GIVEN NOTICE DUE TO THE FIRST-PAY FIRST-SERVED BASIS POLICY OF OUR EVENT.

06. AGREEMENT
FINALIZATION OF EVENT ONCE PAYMENT IS MADE IS AN ACKNOWLEDGMENT AND AGREEMENT TO ALL THE AFOREMENTIONED WRITTEN RULES AND POLICIES.
                    </textarea>
                    <div class="rowDiv">
                        <button type="button" class="decline" id="decline">Decline</button>
                        <button class="accept" id="accept">Accept</button>
                    </div>
                </div>
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
</html>
<script>
    $("select[class='options']").change(function () {
        updateTotal();
    });
    $("input[type='checkbox']").click(function () {
        updateTotal();
    });
    $("input[class='terms']").click(function () {
        document.getElementById("totalPrice").value = document.getElementById('item-price').innerHTML;
    });
    function updateTotal() {
        var total = 0;
        $("select[class='options'] option:selected").each(function () {
            total += parseInt($(this).data('price'));
            $("#item-price").text(total);
        });
        $("input[id='addOnsChkbox']:checked").each(function () {
            total += parseInt($(this).data('price'));
            $("#item-price").text(total);
        });
    }

    function changeForm(formNo) {
        if (formNo == 1) {
            document.getElementById("form1").style.display = "flex";
            document.getElementById("form2").style.display = "none";
            document.getElementById("form3").style.display = "none";
            document.getElementById("basic").style.color = "lightcoral";
            document.getElementById("basic").style.borderBottomColor = "lightcoral";
            document.getElementById("packages").style.color = "black";
            document.getElementById("packages").style.borderBottomColor = "black";
            document.getElementById("personalize").style.color = "black";
            document.getElementById("personalize").style.borderBottomColor = "black";
        } else if (formNo == 2) {
            document.getElementById("form1").style.display = "none";
            document.getElementById("form2").style.display = "flex";
            document.getElementById("form3").style.display = "none";
            document.getElementById("basic").style.color = "black";
            document.getElementById("basic").style.borderBottomColor = "black";
            document.getElementById("packages").style.color = "lightcoral";
            document.getElementById("packages").style.borderBottomColor = "lightcoral";
            document.getElementById("personalize").style.color = "black";
            document.getElementById("personalize").style.borderBottomColor = "black";
        } else if (formNo == 3) {
            document.getElementById("form1").style.display = "none";
            document.getElementById("form2").style.display = "none";
            document.getElementById("form3").style.display = "flex";
            document.getElementById("basic").style.color = "black";
            document.getElementById("basic").style.borderBottomColor = "black";
            document.getElementById("packages").style.color = "black";
            document.getElementById("packages").style.borderBottomColor = "black";
            document.getElementById("personalize").style.color = "lightcoral";
            document.getElementById("personalize").style.borderBottomColor = "lightcoral";


        } else {
            document.getElementById("form1").style.display = "flex";
            document.getElementById("form2").style.display = "none";
            document.getElementById("form3").style.display = "none";

        }
    }

    var modal = document.getElementById("myModal");
    var btn = document.getElementById("modalButton");
    var span = document.getElementsByClassName("close")[0];

    btn.onclick = function () {
        modal.style.display = "flex";
    }

    span.onclick = function () {
        document.getElementById("modalButton").checked = false;
        modal.style.display = "none";
    }

    window.onclick = function (event) {
        if (event.target == modal) {
            modal.style.display = "none";
        }
    }

    accept.onclick = function () {
        document.getElementById("modalButton").checked = true;
        modal.style.display = "none";
    }

    decline.onclick = function () {
        document.getElementById("modalButton").checked = false;
        modal.style.display = "none";
    }
</script>



<!---NOTES: 1. padagdag nalang yung modal for terms and conditionsn (naiisip ko na magpopopout siya once na napindot yung book now button, then may button na "I agree" bago mawala yung modal. so need nila umagree para makapag book) 2. paayos ng designs 3. pacheck if may kulang--->

