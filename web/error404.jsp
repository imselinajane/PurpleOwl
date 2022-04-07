<!DOCTYPE html>
<html lang="en">

    <head>
        <title>Error 404!</title>
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
        <h1>Error 404!</h1>
        <h2>Page not found!</h2>
        <button class="backBT" onclick="goBack()">Back</button>
        <script>
            function goBack() {
                window.history.back();
            }
        </script>
    </body>

</html>