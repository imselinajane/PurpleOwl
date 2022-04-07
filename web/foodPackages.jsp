<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <title>Packages</title>
        <link rel="stylesheet" type="text/css" href="css/foodP.css">
           <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Lora:ital@1&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro:wght@300&display=swap" rel="stylesheet">
         <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
         <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
         <link href="https://fonts.googleapis.com/css2?family=Kaushan+Script&family=Parisienne&display=swap" rel="stylesheet">
         

    <img src="img/LOGO.jpg" height = "100" width = "100" id="logo">

    <header>

        <!---ETO YUNG NAV BAR--->

        <!---start of nav bar--->
        <nav>
            <ul class="nav_links">
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
        </nav>
        <!---end of nav bar--->

    </header>

</head>

<body>
    <%
        response.setHeader("Cache-control", "no-cache, no-store, must-revalidate");
        String button = "";
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
    <h1>Package</h1>
    <div class="wrapper">
        <% if (session.getAttribute("sessionTest") != null) { %>
        <form action="addItem.jsp" method="POST">
            <input type="submit" name="buttonType" value="Add Package">
        </form>
        <% } %>
        <% int ctr = 1;
            ResultSet rs1 = pStmt.executeQuery();
            while (rs1.next()) {
                if (rs1.getString("TYPE").equals("Package")) {
        %>
        <!-- modal for package -->
        <div id="popup_flight_travlDil1<%=ctr%>" class="overlay_flight_traveldil">
            <div class="popup_flight_travlDil">
                <h2><% out.print(rs1.getString("NAME")); %></h2>
                <a class="close_flight_travelDl" id="close_btn" href="#">&times;</a>
                <div class="content_flightht_travel_dil">
                    <!--photogrid-->
                    <div class="row">
                        <div class="column">
                            <img src="<% out.print(rs1.getString("IMAGE1")); %>" style="width:100%">
                        </div>
                        <div class="column">
                            <img src="<% out.print(rs1.getString("IMAGE2")); %>" style="width:100%">
                        </div>  
                        <div class="column">  
                            <img src="<% out.print(rs1.getString("IMAGE3"));%>" style="width:100%">
                        </div>
                    </div>

                    <div class="text-sr">
                        <h3>Inclusions:</h3>
                        <pre><% out.print(rs1.getString("INCLUSIONS")); %></pre>
                        <br>
                        <b><p>Php <% out.print(rs1.getInt("PRICE")); %></p></b>
                    </div>
                </div>
            </div>
        </div>

        <!-- display on package screen -->
        <div class="container">
            <div class="item-package" id="package">
                <img src="<%out.print(rs1.getString("IMAGE1"));%>"/>
                <h3><% out.print(rs1.getString("NAME"));%></h3>
                <a class="button" href="#popup_flight_travlDil1<%=ctr%>">View</a>
                <% if (session.getAttribute("sessionTest") != null) { %>
                <form action="deleteItem.do" method="POST">
                    <% session.setAttribute("delete" + ctr, rs1.getString("NAME"));%>
                    <input type="hidden" name="delete<%=ctr%>" value="<%= rs1.getString("NAME")%>">
                    <input type="submit" value="Delete">
                </form>
                <% } %>
            </div>
        </div>
        <%
                }
                ctr++;
            }
        %>
    </div>
    <!--end of packages-->
    <!---food--->
    <h1>Food</h1>
    <% if (session.getAttribute("sessionTest") != null) { %>
    <form action="addItem.jsp" method="POST">
        <input type="submit" name="buttonType" value="Add Menu">
    </form>
    <% } %>
    <% int ctr2 = 1;
        ResultSet rs2 = pStmt.executeQuery();
        while (rs2.next()) {
            if (rs2.getString("TYPE").equals("Menu")) {
    %>
    <div id="popup_flight_travlDil<%=ctr2%>" class="overlay_flight_traveldil">
        <div class="popup_flight_travlDil">
            <h2><% out.print(rs2.getString("NAME")); %></h2>
            <a class="close_flight_travelDl" href="#">&times;</a>
            <div class="content_flightht_travel_dil">
                <div class="text-ma">
                    <h3>Inclusions:</h3>
                    <pre><% out.print(rs2.getString("INCLUSIONS")); %></pre>
                    <br>
                    <b><p>Php <% out.print(rs2.getInt("PRICE")); %></p></b>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="item-package" id="food">
            <img src="<%out.print(rs2.getString("IMAGE1"));%>"/>
            <h3><% out.print(rs2.getString("NAME"));%></h3>
            <a class="button" href="#popup_flight_travlDil<%=ctr2%>">View</a>
            <% if (session.getAttribute("sessionTest") != null) { %>
            <form action="deleteItem.do" method="POST">
                <% session.setAttribute("delete" + ctr2, rs2.getString("NAME"));%>
                <input type="hidden" name="delete<%=ctr2%>" value="<%= rs2.getString("NAME")%>">
                <input type="submit" value="Delete">
            </form>
            <% } %>
        </div>
    </div>
    <%
            }
            ctr2++;
        }
    %>
    <!--end-->

    <!--add ons-->
    <div class="add">
        <h3>Add-Ons</h3>
    </div>
    <% if (session.getAttribute("sessionTest") != null) { %>
    <form action="addItem.jsp" method="POST">
        <input type="submit" name="buttonType" value="Add Add-On">
    </form>
    <% } %>
    <% int ctr3 = 1;
        ResultSet rs3 = pStmt.executeQuery();
        while (rs3.next()) {
            if (rs3.getString("TYPE").equals("Add-On")) {
    %>
    <div class="container">
        <div class="item-package">
            <img src="<%out.print(rs3.getString("IMAGE1"));%>"/>
            <h3><% out.print(rs3.getString("NAME"));%></h3>
            <b><p>Php <% out.print(rs3.getInt("PRICE")); %></p></b>
            <% if (session.getAttribute("sessionTest") != null) { %>
            <form action="deleteItem.do" method="POST">
                <% session.setAttribute("delete" + ctr3, rs3.getString("NAME"));%>
                <input type="hidden" name="delete<%=ctr3%>" value="<%= rs3.getString("NAME")%>">
                <input type="submit" value="Delete">
            </form>
            <% } %>
        </div>
    </div>
    <%
            }
            ctr3++;
        }
    %>
    <%
            rs1.close();
            rs2.close();
            rs3.close();
            pStmt.close();
            con.close();
        } catch (SQLException sqle) {
            sqle.printStackTrace();
        }
    %>
    <br><br>
<center>
    <button onclick="location.href = 'bookNow.jsp'" class="homePageBT">Book Now!</button>
</center>
</body>

<!---FOOTER--->

<footer class="footer">
     <div class="container4">
      <div class="row1">
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
