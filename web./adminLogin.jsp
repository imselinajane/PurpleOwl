<!DOCTYPE html>

<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="stylesheet" type="text/css" href="css/container.css">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link href="https://fonts.googleapis.com/css2?family=Lora:ital@1&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro:wght@300&display=swap" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css2?family=Kaushan+Script&family=Parisienne&display=swap" rel="stylesheet">

        <title>The Purple Owl: Login</title>
    <img src="img/logosmall.png" class="center" alt = "LOGO">
</head>
<header>
    <nav class="navbar">
        <div class="brand-title"></div>
    </nav>
</header>
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
        <h1>Log in</h1>
        <br>
        <br>
        <br>
        <br>
        <form action="login.do" method="POST">
            <label for="uNameEmail"></label>
            <!-- input field for username -->
            <h6>Employee Username / Email</h6>
            <div class ="userEmail">
                <input type="text" id="uNameEmail" name="adminUserEmail" placeholder="Username / Email">
            </div>
            <br><br><br>
            <label for="Password"></label>
            <h6>Password</h6>
            <input type="password" class="userPass" name="adminPass" placeholder="Password" required>
            <br><br><br>
            <!-- button to submit inputs -->
            <button class ="loginBT">Sign in</button>
            <br><br>
        </form>
        <button onclick="location.href = 'adminForgot.jsp'" class="forgetPassBT">forgot password?</button>
        <br><br>
        <button onclick="location.href = 'Homepage.jsp'" class="homePageBT">Back to Home</button>
        <br><br><br>
    </div>
</center>
</body>
</html>
