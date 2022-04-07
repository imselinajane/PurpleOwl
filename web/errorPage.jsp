<!DOCTYPE html>
<html lang="en">

    <head>
        <title>Error!</title>
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
        <section class="errorMessageSec row align-items-center g-0 p-2 text-center" style="height: 90vh;">
            <div class="errorMsgDiv">
                <div class="errorBox">
                    <h1>Oops! Something went wrong.</h1>
                    <!-- Error Type -->
                    <p class="col-9 col-sm-6 mx-auto">

                        <%
                            String errMsg = (String) getServletContext().getAttribute("errorMessage");
                            out.print(errMsg);
                        %>

                    </p>
                    <button class="btn btn-primary backBT" onclick="goBack()">Go Back</button>
                </div>
            </div>
        </section>
        <script>
            function goBack() {
                window.history.back();
            }
        </script>
    </body>

</html>