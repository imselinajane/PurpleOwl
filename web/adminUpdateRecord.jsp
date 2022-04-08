<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.9.1/jquery.min.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Record</title>
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
        <form  method="POST" action="updateDB.do">
            <%
                response.setHeader("Cache-control", "no-cache, no-store, must-revalidate");
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
                    PreparedStatement prepStmt = con.prepareStatement("SELECT * FROM ORDERSDB", ResultSet.TYPE_SCROLL_SENSITIVE,
                            ResultSet.CONCUR_READ_ONLY);
                    ResultSet rss = prepStmt.executeQuery();
                    rss.last();
                    String updateBT = "";
                    PreparedStatement prepareStmt = con.prepareStatement("SELECT * FROM ITEMDB");
                    PreparedStatement pStmt = con.prepareStatement("SELECT * FROM ORDERSDB WHERE USERID = ?");
                    for (int i = 1; i <= rss.getRow(); i++) {
                        updateBT = request.getParameter("update" + i);
                        if (updateBT != null) {
                            System.out.println(updateBT);
                            pStmt.setInt(1, Integer.parseInt(updateBT));
                        }
                    }
                    ResultSet rs = pStmt.executeQuery();
                    while (rs.next()) {%>
            <div class="masterTable">
                <div class="divDetails">
                    <input type="hidden" id="userid" name="userid" value="<%= rs.getString("USERID")%>">
                    <label for="name">Name of Client/Couple:</label><br>
                    <input type="text" id="name" name="name" placeholder="<%= rs.getString("NAME")%>" required><br><br>

                    <label for="datetime">Date and Time:</label>
                    <input type="datetime-local" id="datetime" name="datetime"required><br><br>

                    <label for="occasion">Occasion:</label><br>
                    <input type="text" placeholder="<%= rs.getString("OCCASION")%>" id="occasion" name="occasion"required><br><br>

                    <label for="headcount">Headcount:</label><br>
                    <input type="text" id="headcount" placeholder="<%= rs.getInt("HEADCOUNT")%>" name="headcount"required><br><br>

                    <label for="number">contact number:</label><br>
                    <input type="text" id="number" placeholder="<%= rs.getString("CONTACTNUMBER")%>" name="number"required><br>
                </div>

                <div class="personalDetails">
                    <label for="request">Dietary Requests/Restrictions:</label><br>
                    <textarea rows="5" cols="60" name="requestText" placeholder="<%= rs.getString("REQUESTS")%>"></textarea><br>
                    <label for="venue">Preferred Venue:</label><br>
                    <input type="text" placeholder="<%= rs.getString("VENUE")%>" id="venue" name="venue"required><br><br>

                    <h2>Personalize Your Set-up</h2>
                    <label for="theme">Choose a Theme/Colour Scheme:</label><br> 
                    <input type="text" id="theme" placeholder="<%= rs.getString("THEME")%>" name="theme"><br>
                    <label for="picture">Paste a GDrive or Picture URL for reference:</label><br>
                    <input type= "url" name="url" id="picture" placeholder="<%= rs.getString("GDRIVE")%>" pattern="https://.*" size="30"><br><br>
                    <label for="message">Type a meaningful message and quotes to add in the design:</label><br> 
                    <input type="text" placeholder="<%= rs.getString("QUOTES1")%>" id="message" name="message"><br>
                    <label for="music">Type a meaningful message and quotes to add in the design:</label><br> 
                    <input type="text" placeholder="<%= rs.getString("QUOTES2")%>" id="music" name="message2"><br>
                </div><br>
                <div class="price">
                    <label for="price">Price:</label><br> 
                    <input type="text" value="" placeholder="<%= rs.getString("PRICE")%>" id="totalPrice" name="price"><br>
                </div>
            </div>
            <% } %><br><br>

            <div class="bookDetails">
                <label for="package">Package:</label>
                <select class="options" name="package">
                    <option value="" data-price="0" disabled selected>Choose your Package</option>
                    <% ResultSet rsPack = prepareStmt.executeQuery();
                        while (rsPack.next()) {
                            if (rsPack.getString("TYPE").equals("Package")) { %>
                    <option value="<%out.print(rsPack.getString("NAME"));%>" data-price="<%out.print(rsPack.getInt("PRICE"));%>"> 
                        <%out.print(rsPack.getString("NAME"));%> </option>
                        <% }
                            }
                        %>
                </select>
                <br>
                <br>

                <label for="menu">Menu:</label>
                <select class="options" name="menu">
                    <option value="" data-price="0" disabled selected>Choose your Menu</option>
                    <% ResultSet rsMenu = prepareStmt.executeQuery();
                        while (rsMenu.next()) {
                            if (rsMenu.getString("TYPE").equals("Menu")) {
                    %>
                    <option value="<%out.print(rsMenu.getString("NAME"));%>" data-price="<%out.print(rsMenu.getInt("PRICE"));%>"> 
                        <%out.print(rsMenu.getString("NAME"));%> </option>
                        <% }
                            }
                        %>
                </select>
                <br>
                <div class="centerDiv">
                    <% ResultSet rsAddOn = prepareStmt.executeQuery();
                        while (rsAddOn.next()) {
                            if (rsAddOn.getString("TYPE").equals("Add-On")) { %>
                    <input type="checkbox" id="addOnsChkbox" data-price="<%out.print(rsAddOn.getInt("PRICE"));%>" 
                           name="addOnsChkbox" value="<%out.print(rsAddOn.getString("NAME"));%>">
                    <label for="addOnsChkbox"><%out.print(rsAddOn.getString("NAME"));%></label> <br><br>
                    <% }
                        }
                    %>
                </div>
            </div>
            <% rss.close();
                    prepareStmt.close();
                    pStmt.close();
                    rsPack.close();
                    rsMenu.close();
                    rsAddOn.close();
                    rs.close();
                } catch (SQLException sqle) {
                    sqle.printStackTrace();
                }%>
            <br><br>
            <input type="submit" value="Update">
        </form>
    </body>
</html>
<script>
    $("select[class='options']").change(function () {
        updateTotal();
    });
    $("input[type='checkbox']").click(function () {
        updateTotal();
    });
    function updateTotal() {
        var total = 0;
        $("select[class='options'] option:selected").each(function () {
            total += parseInt($(this).data('price'));
            console.log(total);
            $("input[name='price']").val(total);
        });
        $("input[id='addOnsChkbox']:checked").each(function () {
            total += parseInt($(this).data('price'));
            console.log(total);
            $("input[name='price']").val(total);
        });
    }
</script>
