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
    <style>
        body, html {
            height: 100%;
            background-image: url("/img/mentor.jpg");

            /* Full height */
            height: 100%;

            /* Center and scale the image nicely */
            background-position: center;
            background-repeat: no-repeat;
            background-size: cover;
            margin: 0px;
        }

        .navbar{
            background-color: #2F4F4F;
            min-height: 80px;
        }
        .navbar-toggle {
            /* (80px - button height 34px) / 2 = 23px */
            padding: 9px 10px !important;
        }

        .navbar .navbar-nav > li > a {
            line-height: 45px;
        }

        @media (min-width: 768px) {
            .navbar-nav > li > a {
                /* (80px - line-height of 27px) / 2 = 26.5px */
                padding-top: 26.5px;
                padding-bottom: 26.5px;
                line-height: 45px;
            }
        }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light navbar-toggle " >
    <a class="navbar-brand" href="#">WELCOME </a>


    <div class="collapse navbar-collapse" id="navbarColor03">
        <ul class="navbar-nav mr-auto">

            <li class="nav-item ">
                <a class="nav-link" href="/jsp/mentor_profile.jsp">Home </a>
            </li>
            <li class="nav-item ">
                <a class="nav-link" href="/jsp/mentor_studentlist.jsp">View Students Profile</a>
            </li>
            <li class="nav-item ">
                <a class="nav-link" href="#">Arrange a meeting</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/jsp/mentor_mom.jsp">Send MOM</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/jsp/mentor_showmeetings.jsp">Update Meeting Attendance</a>
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
<%--<div class="c1">--%>
    <%--<div class="content" style="min-height: 600px;margin-top: 50px">--%>
        <%--<div class="baner_image">--%>
            <%--<div class="inner_baner_image" style="margin-left: 600px">--%>
                <%--<div class="baner_content">--%>
                    <%--<h1>Welcome to Admin Portal</h1>--%>
                    <%--<p>View and Allot</p>--%>

                <%--</div>--%>

            <%--</div>--%>

        <%--</div>--%>


    <%--</div>--%>

<%--</div>--%>

</body>


</html>




