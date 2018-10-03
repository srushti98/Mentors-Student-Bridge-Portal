<%@ page import="java.sql.*" %>
<%@ page import="java.io.Writer" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Drop Downlist</title>

    <meta name="viewport" content="width=device-width,initial-state=1"/>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.min.css">
    <script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.css" rel="stylesheet" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="#">WELCOME</a>


    <div class="collapse navbar-collapse" id="navbarColor03">
        <ul class="navbar-nav mr-auto">

            <li class="nav-item ">
                <a class="nav-link" href="#">Home </a>
            </li>
            <li class="nav-item ">
                <a class="nav-link" href="/jsp/mentor_studentlist.jsp">View Students Profile</a>
            </li>
            <li class="nav-item ">
                <a class="nav-link" href="#">Arrange a meeting</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Send MOM</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="#">Track Students Attendance</a>
            </li>
        </ul>
        <a class="nav-link" href="../LogoutServlet"><i class="material-icons">
            account_circle
        </i> signout</a>
    </div>

</nav>
</body>


</html>




