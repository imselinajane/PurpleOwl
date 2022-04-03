<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Update Record</title>
    </head>
    <body>
        <h1>Hello World!
        </h1>
        <form  method="POST" action="updateDB.do">
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
                    PreparedStatement prepStmt = con.prepareStatement("SELECT * FROM ORDERSDB", ResultSet.TYPE_SCROLL_SENSITIVE,
                            ResultSet.CONCUR_READ_ONLY);
                    ResultSet rss = prepStmt.executeQuery();
                    rss.last();
                    String updateBT = "";
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
                <div class="bookDetails">
                    <label for="package">Package:</label>
                    <select id="package" name="package"required>
                        <option value=""disabled selected>Choose your Package</option>
                        <option value="Simple Romantic"> Simple Romantic </option>
                        <option value="Movie Date"> Movie Date </option>
                        <option value="Live Music"> Live Music </option>
                    </select><br><br>

                    <label for="menu">Menu:</label>
                    <select id="menu" name="menu"required>
                        <option value=""disabled selected>Choose your Menu</option>
                        <option value="Menu A"> Menu A </option>
                        <option value="Menu B"> Menu B </option>
                        <option value="Menu C"> Menu C </option>
                    </select><br><br>

                    <label for="venue">Preferred Venue:</label><br>
                    <input type="text" placeholder="<%= rs.getString("VENUE")%>" id="venue" name="venue"required><br><br>
                </div>

                <div class="personalDetails">
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
                    <textarea rows="5" cols="60" name="requestText" placeholder="<%= rs.getString("REQUESTS")%>"></textarea>

                    <h2>Personalize Your Set-up</h2>
                    <label for="theme">Choose a Theme/Colour Scheme:</label><br> 
                    <input type="text" id="theme" placeholder="<%= rs.getString("THEME")%>" name="theme"><br>
                    <label for="picture">Paste a GDrive or Picture URL for reference:</label><br>
                    <input type= "url" name="url" id="picture" placeholder="<%= rs.getString("GDRIVE")%>" pattern="https://.*" size="30"><br><br>
                    <label for="message">Type a meaningful message and quotes to add in the design:</label><br> 
                    <input type="text" placeholder="<%= rs.getString("QUOTES1")%>" id="message" name="message"><br>
                    <label for="music">Type a meaningful message and quotes to add in the design:</label><br> 
                    <input type="text" placeholder="<%= rs.getString("QUOTES2")%>" id="music" name="message2"><br>
                </div>
            </div>

            <%
                    }
                } catch (SQLException sqle) {
                    sqle.printStackTrace();
                }%>
            <br><br>
            <input type="submit" value="Update">
        </form>
    </body>
</html>
