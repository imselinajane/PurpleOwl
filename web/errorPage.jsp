<!DOCTYPE html>
<html lang="en">

<head>
    <title>Error!</title>
</head>

<body>
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