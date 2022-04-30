    <%@page import="java.sql.*"%>
<%@page import="model.Admin"%>
 <%
        boolean g_isDisabled = false;
        int total = 0;
        int maxBookingSlot = 0;
        try 
        {
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
                            String query = "SELECT * FROM BOOKING FETCH FIRST ROW ONLY";
                            Statement statement = con.createStatement();
                            ResultSet rs = statement.executeQuery(query);
                            while(rs.next()) {
                            
                            g_isDisabled = rs.getBoolean("isBookingDisabled");
                            maxBookingSlot = rs.getInt("maxBooking");
                            
                            Statement st=con.createStatement();
    String strQuery = "SELECT COUNT(*) FROM ORDERSDB";
    rs = st.executeQuery(strQuery);

    String Countrow="";
      while(rs.next()){
      Countrow = rs.getString(1);
      total = Integer.valueOf(Countrow);
      System.out.println("Total Row :" +total);
       } 
     }
    }catch (SQLException sqle) {
          sqle.printStackTrace();
    
    }
        
                    %>
<!DOCTYPE html>

<html>
    <head>
        <title>PurpleOwl Admin Database</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" type="text/css" href="css/database.css">
    </head>
    <body>
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
        <%
            if (session.getAttribute("sessionTest") == null || session == null) {
                response.sendRedirect("Homepage.jsp");
                return;
            }
            response.setHeader("Cache-control", "no-cache, no-store, must-revalidate");
            Admin scMsg = (Admin) getServletContext().getAttribute("loginDetails");
            String userName = scMsg.getUEmail();
        %> 
        <div class="showUsername">
            <h2>
                <% out.print("Welcome, " + userName); %>
            </h2>
            <h2>
                <form action="toggle.do" method="POST"> 
                    <button type="submit">Toggle Booking</button>
                       </form>
                <br>
                <% 
String status = "";
if (g_isDisabled) {
                 status = "disabled";   
                    }
                    else {
                    status = "enabled";
                    } %>
                    
                <% out.print("Booking is " + status); %>
                <br>
                <% out.print("Total booking: " + total); %>
                <br>
                
                <% out.print("Max Booking Slot is set to: " + maxBookingSlot); %>
                <form action="setmax.do" method="POST"> 
                    <input type="number" placeholder="Set a max slot" id="maxBooking" name="maxBooking" value=<%=maxBookingSlot%>></input>
                    <button type="submit">Set max</button>
                       </form>
            </h2>
        </div>


        <!-- will generate new block per item in database :) -->
        <%//while (rs.next()) {%>
        <!-- you guys can use this as template, change it up a bit if ever 
            because kinda copied from internet
        <div class="row g-0 align-items-center justify-content-center justify-content-sm-between p-1 p-sm-4 my-3 border rounded" style="border-color:darkgray; word-wrap:break-word;">


            <div class="card border-0 my-2" style="width: auto;">
                <h1 class="card-header bg-white border-0">
                    <p><%//out.print(rs.getString("FNAME")); %>
        <%//out.print(rs.getString("LNAME")); %></p>
</h1>
<h6 class="card-subtitle py-2 px-3">
    <p><%//out.print(rs.getString("RESERVEDDATE"));%></p>
</h6>
</div>
<ul class="list-group list-group-flush my-2" style="width: auto;">
<p><%//out.print(rs.getInt("NUMBEROFPPL"));%></p>
<p><%//out.print(rs.getString("CPNUMBER"));%></p>
<p><%//out.println(rs.getString("EMAIL"));%></p>
</ul>

<div class=" my-2" style="width: auto;">
<button class="btn btn-success text-white mb-3">Edit</button>
<br>
<button class="btn btn-danger">Delete</button>
</div>

</div>
        -->
        <div class="masterTable">
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
                    String query = "SELECT * FROM ORDERSDB";
                    PreparedStatement pStmt = con.prepareStatement(query);
                    ResultSet rs = pStmt.executeQuery();
            %>
            <div class="tableCaption">
                Purple Owl Orders Database
            </div>
            <div class="tableHeaders">
                <div class="table-header-cell">
                    ID
                </div>
                <div class="table-header-cell">
                    Name
                </div>
                <div class="table-header-cell">
                    Date and Time
                </div>
                <div class="table-header-cell">
                    Occasion
                </div>
                <div class="table-header-cell">
                    Headcount
                </div>
                <div class="table-header-cell">
                    Contact Number
                </div>
                <div class="table-header-cell">
                    Package
                </div>
                <div class="table-header-cell">
                    Menu
                </div>
                <div class="table-header-cell">
                    Venue
                </div>
                <div class="table-header-cell">
                    Add-Ons
                </div>
                <div class="table-header-cell">
                    Requests
                </div>
                <div class="table-header-cell">
                    Theme
                </div>
                <div class="table-header-cell">
                    Reference Link
                </div>
                <div class="table-header-cell">
                    Quotes 1
                </div>
                <div class="table-header-cell">
                    Quotes 2
                </div>
                <div class="table-header-cell">
                    Price
                </div>
                <div class="table-header-cell">
                    Actions
                </div>
            </div>

            <div class="tableBody">
                <%int i = 1;
                    while (rs.next()) {%>
                <br>
                <div class="tableRow"> <!-- generates new row per item in database -->
                    <div class="table-body-cell"> 
                        <%out.print(rs.getInt("USERID"));%>
                    </div>
                    <div class="table-body-cell"> 
                        <%out.print(rs.getString("NAME"));%>
                    </div>
                    <div class="table-body-cell">
                        <%out.print(rs.getTimestamp("DATEANDTIME"));%>
                    </div>
                    <div class="table-body-cell">
                        <%out.print(rs.getString("OCCASION"));%>
                    </div>
                    <div class="table-body-cell"> 
                        <%out.print(rs.getInt("HEADCOUNT"));%>
                    </div>
                    <div class="table-body-cell">
                        <%out.print(rs.getString("CONTACTNUMBER"));%>
                    </div>
                    <div class="table-body-cell">
                        <%out.print(rs.getString("PACKAGE"));%>
                    </div>
                    <div class="table-body-cell"> 
                        <%out.print(rs.getString("MENU"));%>
                    </div>
                    <div class="table-body-cell">
                        <%out.print(rs.getString("VENUE"));%>
                    </div>
                    <div class="table-body-cell">
                        <%out.print(rs.getString("ADDONS"));%>
                    </div>
                    <div class="table-body-cell"> 
                        <%out.print(rs.getString("REQUESTS"));%>
                    </div>
                    <div class="table-body-cell">
                        <%out.print(rs.getString("THEME"));%>
                    </div>
                    <div class="table-body-cell">
                        <%out.print(rs.getString("GDRIVE"));%>
                    </div>
                    <div class="table-body-cell"> 
                        <%out.print(rs.getString("QUOTES1"));%>
                    </div>
                    <div class="table-body-cell">
                        <%out.print(rs.getString("QUOTES2"));%>
                    </div>
                    <div class="table-body-cell">
                        <%out.print(rs.getString("PRICE"));%>
                    </div>

                    <div class="table-body-cell">
                        <form action="adminUpdateRecord.jsp" method="POST">
                            <% session.setAttribute("check" + i, rs.getInt("USERID"));%>
                            <input type="hidden" name="update<%=i%>" value="<%= rs.getInt("USERID")%>">
                            <input type="submit" value="Update">
                        </form>
                        <form action="delete.do" method="POST">
                            <% session.setAttribute("delete" + i, rs.getInt("USERID"));%>
                            <input type="hidden" name="delete<%=i%>" value="<%= rs.getInt("USERID")%>">
                            <input type="submit" value="Delete">
                        </form>
                    </div>
                </div>

                <br>
                <% i++;
                        }
                        rs.close();
                        pStmt.close();
                        con.close();
                    } catch (SQLException sqle) {
                        sqle.printStackTrace();
                    }
                %>
            </div>

        </div>

    </body>
</html>