<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="css/container.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Lora:ital@1&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro:wght@300&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Kaushan+Script&family=Parisienne&display=swap" rel="stylesheet">

        <title>The Purple Owl: Sign Up</title>
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
    <center>
        <div class="boxed">
            <br>
            <br>
            <br>
            <br>
            <h1>Sign Up: Admins Only</h1>
            <br>
            <br>
            <br>
            <br>
            <form action="signUp.do" method="POST">
                <label for="uName"></label>
                <!-- input field for username -->
                <h6>Employee Username</h6>
                <div class="username">
                    <input type="text" class="uName" name="regUser" placeholder="Username" required>
                </div>
                <br><br><br>
                <label for="email"></label>
                <h6>Employee Email</h6>
                <div class="email">
                    <input type="email" class="email" name="regEmail" placeholder="Email" required>
                </div>
                <br><br><br>
                <label for="password"></label>
                <h6>Password</h6>
                <div class="password">
                    <input type="password" class="password" name="regPass" placeholder="Password" required>
                </div>
                <br><br><br>
                <label for="confPassword"></label>
                <h6>Confirm Password</h6>
                <div class="password">
                    <input type="password" class="password" name="regConfirmPass" placeholder="Confirm Password" required>
                </div>
                <!-- button to submit inputs -->
                <button class ="signUpBT">Sign Up</button>
                <br><br>
            </form>
            <button onclick="location.href = 'Homepage.jsp'" class="homePageBT">Back to Home</button>
            <br><br><br>
        </div>
    </center>
</body>

</html>