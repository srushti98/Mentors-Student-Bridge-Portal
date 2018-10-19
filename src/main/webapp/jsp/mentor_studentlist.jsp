<%--&lt;%&ndash;--%>
  <%--Created by IntelliJ IDEA.--%>
  <%--User: suhani--%>
  <%--Date: 3/10/18--%>
  <%--Time: 12:23 AM--%>
  <%--To change this template use File | Settings | File Templates.--%>
<%--&ndash;%&gt;--%>

<%--<%@ page import="java.sql.*" %>--%>
<%--<%@ page import="java.io.Writer" %>--%>
<%--<%@ page import="static java.util.Objects.equals" %>--%>
<%--<%@ page import="java.lang.String" %>--%>
<%--<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">--%>
<%--<html>--%>
<%--<head>--%>
    <%--<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">--%>
    <%--<title>Drop Downlist</title>--%>

    <%--<meta name="viewport" content="width=device-width,initial-state=1"/>--%>
    <%--<link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.min.css">--%>
    <%--<script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>--%>
<%--</head>--%>
<%--<body>--%>
<%--<nav class="navbar navbar-expand-lg navbar-light bg-light">--%>
    <%--<%--%>
        <%--if (session.getAttribute("stud_name")==null)--%>
            <%--response.sendRedirect("/index.jsp");--%>
        <%--String mentor_id = (String)session.getAttribute("stud_name");--%>
    <%--%>--%>
    <%--<a class="navbar-brand" href="#">WELCOME <%=mentor_id%></a>--%>

    <%--<div class="collapse navbar-collapse" id="navbarColor03">--%>
        <%--<ul class="navbar-nav mr-auto">--%>

            <%--<li class="nav-item ">--%>
                <%--<a class="nav-link" href="#">Home </a>--%>
            <%--</li>--%>
            <%--<li class="nav-item ">--%>
                <%--<a class="nav-link" href="/jsp/mentor_studentlist.jsp">View Students Profile</a>--%>
            <%--</li>--%>
            <%--<li class="nav-item ">--%>
                <%--<a class="nav-link" href="#">Arrange a meeting</a>--%>
            <%--</li>--%>
            <%--<li class="nav-item">--%>
                <%--<a class="nav-link" href="#">Send MOM</a>--%>
            <%--</li>--%>
            <%--<li class="nav-item">--%>
                <%--<a class="nav-link" href="#">Track Students Attendance</a>--%>
            <%--</li>--%>
        <%--</ul>--%>
        <%--<a class="nav-link" href="../LogoutServlet"><i class="material-icons">--%>
            <%--account_circle--%>
        <%--</i> signout</a>--%>
    <%--</div>--%>

<%--</nav>--%>
<%--<div class="row" style="margin-top: 100px">--%>
    <%--<div class="col-md-3"></div>--%>
    <%--<div class="col-md-6">--%>
        <%--<table class="table table-hover" style="width: 1200px">--%>
            <%--<thead>--%>
            <%--<tr>--%>
                <%--<th scope="col">MIS-ID</th>--%>
                <%--<th scope="col">Name</th>--%>
                <%--<th scope="col">Profile</th>--%>
            <%--</tr>--%>
            <%--</thead>--%>

            <%--<%--%>
                <%--try--%>
                <%--{   Connection con;--%>
                    <%--PreparedStatement ps = null;--%>
                    <%--Class.forName("com.mysql.jdbc.Driver");--%>
                    <%--con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mentorsys", "hello", "hello");--%>
                    <%--System.out.println("SL3 "+ "database successfully opened.");--%>
                    <%--String menid = (String)session.getAttribute("stud_name");--%>
                    <%--System.out.println(menid);--%>
                    <%--String sql = "select s.stud_mis_id,s.stud_name from student s,studentmentorrel sm where  s.stud_mis_id=sm.stud_mis_id and sm.emp_id=? order by s.stud_roll_no;";--%>

                    <%--ps = con.prepareStatement(sql);--%>
                    <%--ps.setString(1,menid);--%>
                    <%--ResultSet rs = ps.executeQuery();--%>
                    <%--while (rs.next())--%>
                    <%--{--%>
                        <%--String student_id=rs.getString("s.stud_mis_id");--%>
                        <%--String student_name=rs.getString("s.stud_name");--%>
                        <%--System.out.println(student_id + student_name);--%>
            <%--%>--%>
            <%--<tbody>--%>
            <%--<tr class="table-primary">--%>
            <%--<td><%=student_id%></td>--%>
            <%--<td><%=student_name%></td>--%>
                <%--<td><a href="/jsp/mentor_view_student.jsp?id=<%=student_id%>">View Profile</a></td>--%>
            <%--</tr>--%>

            <%--<%--%>
                    <%--}--%>
                <%--}--%>
                <%--catch(SQLException sqe)--%>
                <%--{--%>
                    <%--System.out.println(sqe);--%>
                <%--}--%>
            <%--%>--%>
            <%--</tbody>--%>

        <%--</table>--%>
    <%--</div>--%>
<%--</div>--%>


<%--</body>--%>
<%--</html>--%>
<%@ page import="java.sql.*" %><%--
  Created by IntelliJ IDEA.
  User: srushti
  Date: 11/10/18
  Time: 11:14 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/css/bootstrap.min.css" integrity="sha384-Smlep5jCw/wG7hdkwQ/Z5nLIefveQRIY9nfy6xoR1uRYBtpZgI6339F5dgvm/e9B" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons"
          rel="stylesheet">


    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/js/bootstrap.min.js" integrity="sha384-o+RDsa0aLu++PJvFqy8fFScvbHFLtbvScb8AjopnFD+iEQ7wo/CG0xlczd+2O/em" crossorigin="anonymous"></script><title>Register!!!</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.css" rel="stylesheet" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
    <link rel="stylesheet" href="/css/viewtrail.css">

    <title>Title</title>
    <style>
        .navbar,.navbar-expand-lg{
            background: linear-gradient(to right, #25c481, #25b7c4);
        }
        .active{
            background-color: #2699c4;
        }
        .navbar-expand-lg a:hover {
            background-color: #0d8ec4;
        }
    </style>
</head>
<body>


<%
    if (session.getAttribute("mentor_id")==null)
        response.sendRedirect("/index.jsp");
%>


<nav class="navbar navbar-expand-lg " >
    <h1 class="navbar-brand"  style="color: white"><strong><b style="font-family: URW Chancery L, cursive ">Mentors' Portal</b></strong></h1>


    <div class="collapse navbar-collapse" id="navbarColor03" >
        <ul class="navbar-nav mr-auto">

            <li class="nav-item ">
                <a class="nav-link " style="color: white" href="/jsp/mentor_profile.jsp"><strong><b>Home</b></strong> </a>
            </li>
            <li class="nav-item ">
                <a class="nav-link active" style="color: white " href="/jsp/mentor_studentlist.jsp"><strong><b>View Students Profile</b></strong></a>
            </li>
            <li class="nav-item ">
                <a class="nav-link" style="color: white" href="/jsp/mentor_meeting.jsp"><strong><b>Arrange a meeting</b></strong></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" style="color: white" href="/jsp/meeting_mom.jsp"><strong><b>Send MOM</b></strong></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" style="color: white" href="/jsp/mentor_showmeetings.jsp"><strong><b>Track Students Attendance</b></strong></a>
            </li>
        </ul>
        <a class="nav-link" href="../LogoutServlet" style="color: white"><i class="material-icons">
            account_circle
        </i> <strong><b>signout</b></strong></a>
    </div>

</nav>
<div class="col-4"></div>
<div class="col-4" style="margin-left: 670px ;margin-top: 40px">
   <h1 style="color: #0a8cc4"> STUDENTS LIST </h1>
</div>
<div class="container">
    <table class=".table-responsive" >
        <thead>
        <tr class=".table-responsive">
            <th >MIS-ID</th>
            <th >Name</th>
            <th >Profile</th>
        </tr>
        </thead>

        <%
            try
            {   Connection con;
                PreparedStatement ps = null;
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mentorsys", "hello", "hello");
                System.out.println("SL3 "+ "database successfully opened.");
                String menid = (String)session.getAttribute("mentor_id");
                //String menid="P123456787";
                //System.out.println(menid);
                String sql = "select s.stud_mis_id,s.stud_name from student s,studentmentorrel sm where  s.stud_mis_id=sm.stud_mis_id and sm.emp_id=? order by s.stud_roll_no;";

                ps = con.prepareStatement(sql);
                ps.setString(1,menid);
                ResultSet rs = ps.executeQuery();
                while (rs.next())
                {
                    System.out.print("hello");
                    String student_id=rs.getString("s.stud_mis_id");
                    String student_name=rs.getString("s.stud_name");
                    System.out.println(student_id + student_name);
        %>
        <tbody class=".table-responsive">
        <tr class=".table-responsive">
            <td style="color: #2f28d6"><%=student_id%></td>
            <td style="color: #2f28d6"><%=student_name%></td>
            <%--<td style="color: #2f28d6"><button class="button" href="/jsp/mentor_view_student.jsp?id=<%=student_id%>"><span style="font-size: x-large">View </span></button></td>--%>
            <td><a  href="/jsp/mentor_view_student.jsp?id=<%=student_id%>"><button class="button"><span style="font-size: x-large">View</span></button></a></td>
        </tr>

        <%
                }
            }
            catch(SQLException sqe)
            {
                System.out.println(sqe);
            }
        %>
        </tr>
        </tbody>
    </table>
</div>
</body>
</html>
