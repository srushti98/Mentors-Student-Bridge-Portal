<%--
  Created by IntelliJ IDEA.
  User: suhani
  Date: 10/10/18
  Time: 6:44 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.Writer" %>
<%@ page import="static java.util.Objects.equals" %>
<%@ page import="java.lang.String" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Send MOM</title>

    <meta name="viewport" content="width=device-width,initial-state=1"/>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.min.css">
    <script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
    <style>
        * {
            box-sizing: border-box;
        }

        #bg{
            background: url("") no-repeat;
            background-size:
        }

        #log{
            border: 2px solid white;
            padding: 50px 40px;
            margin-top: 50px;
            margin-bottom: 50px;
            border-radius: 10px;
            margin-left: 150px;
            margin-right: 150px;
            background: rgba(0,0,0,.05);
        }

        input[type=text], select, textarea {
            width: 100%;
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 4px;
            resize: vertical;
        }

        label {
            padding: 12px 12px 12px 0;
            display: inline-block;
        }

        input[type=submit] {
            background-color: #d9e2e9;
            color: #24282b;
            padding: 12px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            float: right;
        }

        input[type=submit]:hover {
            background-color: #45a049;
        }

        .container {
            border-radius: 5px;
            background-color: #f2f2f2;
            padding: 20px;
        }

        .col-25 {
            float: left;
            width: 10%;
            margin-top: 6px;
            margin-left: 150px;
        }

        .col-75 {
            float: left;
            width: 50%;
            margin-top: 6px;
            resize: no;
        }

        h2{
            text-align: center;
            font-size: 40px;
            color: #52368a;
        }

        /* Clear floats after the columns */
        .row:after {
            content: "";
            display: table;
            clear: both;
        }

        /* Responsive layout - when the screen is less than 600px wide, make the two columns stack on top of each other instead of next to each other */
        @media screen and (max-width: 600px) {
            .col-25, .col-75, input[type=submit] {
                width: 100%;
                margin-top: 0;
            }
        }
    </style>
</head>
<body id="bg">
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <%
        if (session.getAttribute("stud_name")==null)
            response.sendRedirect("/index.jsp");
        String mentor_id = (String)session.getAttribute("stud_name");
    %>
    <a class="navbar-brand" href="#">WELCOME <%=mentor_id%></a>

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

<h2>MINUTES OF A MEETING</h2>
<div class="container" id="log">
    <form action="" method="post">
        <div class="row">
            <%
                <%--try--%>
                <%--{   Connection con;--%>
                    <%--PreparedStatement ps = null;--%>
                    <%--Class.forName("com.mysql.jdbc.Driver");--%>
                    <%--con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mentorsys", "hello", "hello");--%>
                    <%--System.out.println("SL3 "+ "database successfully opened.");--%>
            <%--%>--%>
            <div class="col-25">
                <label for="fname">DATE:</label>
                String fname = rs.getString("mentorname");
            </div>
            <div class="col-75">
                <input type="text" id="fname" name="firstname" placeholder="DD/MM/YYYY">
            </div>
        </div>
        <div class="row">
            <div class="col-25">
                <label for="lname">AGENDA:</label>
            </div>
            <div class="col-75">
                <input type="text" id="lname" name="lastname" placeholder="TOPIC">
            </div>
        </div>
        <div class="row">
            <div class="col-25">
                <label for="subject">MINUTES:</label>
            </div>
            <div class="col-75">
                <textarea id="subject" name="subject" placeholder="WRITE THE MINUTES HERE" style="height:300px"></textarea>
            </div>
        </div>
        <div class="row">
            <input type="submit" value="Submit">
        </div>
    </form>
</div>

</body>
</html>
