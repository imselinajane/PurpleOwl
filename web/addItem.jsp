<%@page import="model.Admin"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Purple Owl: Add Item</title>
    </head>
    <body>
        <%
            if (session.getAttribute("sessionTest") == null || session == null) {
                response.sendRedirect("Homepage.jsp");
                return;
            }
            response.setHeader("Cache-control", "no-cache, no-store, must-revalidate");
            String type = request.getParameter("buttonType");
            session.setAttribute("buttonType", type);
            System.out.println(type);
        %>

        <%if (type.equals("Add Package")) {%>
        <form action="add.do" method="POST">
            <div class="addPackage">
                <label for="name">Package Name/Title:</label><br>
                <input type="text" id="name" name="name"><br><br>

                <label for="pic1">Image 1 (Direct Imgur Link):</label><br>
                <input type="url" id="pic1" name="pic1" placeholder="https://example.com" pattern="https://.*" size="30"><br><br>

                <label for="pic2">Image 2 (Direct Imgur Link):</label><br>
                <input type="url" id="pic2" name="pic2" placeholder="https://example.com" pattern="https://.*" size="30"><br><br>

                <label for="pic3">Image 3 (Direct Imgur Link):</label><br>
                <input type="url" id="pic3" name="pic3" placeholder="https://example.com" pattern="https://.*" size="30"><br><br>

                <label for="inclusions">Inclusions:</label><br>
                <textarea rows="5" cols="60" id="inclusions" name="inclusions" placeholder="Enter your package description here..."></textarea><br><br>

                <label for="price">Price:</label><br>
                <input type="number" min="1" step="any" id="price" name="price"><br><br>
                
                <button class ="add">Add Package</button>
            </div>
        </form>
        <% } else if (type.equals("Add Menu")) {%>
        <form action="add.do" method="POST">
            <div class="addMenu">
                <label for="name">Menu Name/Title:</label><br><br>
                <input type="text" id="name" name="name"><br><br>

                <label for="pic">Image (Direct Imgur Link):</label><br>
                <input type="url" id="pic" name="pic" placeholder="https://example.com" pattern="https://.*" size="30"><br><br>

                <label for="inclusions">Inclusions:</label><br>
                <textarea rows="5" cols="60" id="inclusions" name="inclusions" placeholder="Enter your menu contents here..."></textarea><br><br>

                <label for="price">Price:</label><br>
                <input type="number" min="1" step="any" id="price" name="price"><br><br>
                
                <button class ="add">Add Menu</button>
            </div>
        </form>

        <% } else if (type.equals("Add Add-On")) {%>
        <form action="add.do" method="POST">
            <div class="addAddOn">
                <label for="name">Add-On Name/Title:</label><br><br>
                <input type="text" id="name" name="name"><br><br>

                <label for="pic">Image (Direct Imgur Link):</label><br>
                <input type="url" id="pic" name="pic" placeholder="https://example.com" pattern="https://.*" size="30"><br><br>

                <label for="price">Price:</label><br>
                <input type="number" min="1" step="any" id="price" name="price"><br><br>
                
                <button class ="add">Add Add-On</button>
            </div>
        </form>
        <% } %>
    </body>
</html>
