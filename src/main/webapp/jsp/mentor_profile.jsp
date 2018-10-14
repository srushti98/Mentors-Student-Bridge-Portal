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
    <link rel="stylesheet" href="/css/mentorprofile.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
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
        body{
            background-image: url("/img/mentorback.jpg");
            background-repeat: no-repeat;
            background-position: center;
            background-size: cover;
        }
    </style>
</head>
<body>
<%
    try
    {   Connection con;
        PreparedStatement ps = null;
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mentorsys", "hello", "hello");
        System.out.println("SL3 "+ "database successfully opened.");
        String menid = (String)session.getAttribute("stud_name");
        System.out.println(menid);
        String sql = "select count(*) as ccount from student_mentor_communication where emp_id=? and seen=0;";
        ps = con.prepareStatement(sql);
        ps.setString(1,menid);
//        ps.setString(2,menid);
        ResultSet rs = ps.executeQuery();
        rs.next();
        int ccount = rs.getInt("ccount");
%>
<nav class="navbar navbar-expand-lg " >
    <h1 class="navbar-brand"  style="color: white"><strong><b style="font-family: URW Chancery L, cursive ">Mentors' Portal</b></strong></h1>


    <div class="collapse navbar-collapse" id="navbarColor03" >
        <ul class="navbar-nav mr-auto">

            <li class="nav-item ">
                <a class="nav-link  active " style="color: white" href="/jsp/mentor_profile.jsp"><strong><b>Home</b></strong> </a>
            </li>
            <li class="nav-item ">
                <a class="nav-link" style="color: white " href="/jsp/mentor_studentlist.jsp"><strong><b>View Students Profile</b></strong></a>
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
        <a class="nav-link" href="mentor_notifications.jsp" style="color: white"><span><i class="fa fa-bell"></i></span><% if (ccount!=0) {%><span class="badge badge-danger badge-pill"><%=ccount%></span><%}%></a>
        <a class="nav-link" href="../LogoutServlet" style="color: white"><i class="material-icons-account_circle"></i> <strong><b>signout</b></strong></a>
    </div>
    <%
            }
        catch(SQLException sqe)
        {
            System.out.println(sqe);
        }
    %>
</nav>
<%--<div class="c1">--%>
<%--<div class="content" style="min-height: 600px;margin-top: 50px">--%>
<%--<div class="baner_image">--%>
<%--<div class="inner_baner_image" style="margin-left: 600px">--%>
<%--<div class="baner_content">--%>
<%--<h1>Welcome to Mentor Portal</h1>--%>
<%--<p>View . Arrange . Manage</p>--%>

<%--</div>--%>

<%--</div>--%>

<%--</div>--%>


<%--</div>--%>

<%--</div>--%>
<div style="margin-top: 200px;margin-left: 450px;max-width: 1200px;height: 400px;background-color: rgba(0, 0, 0, 0.7);">
    <h1 style="color: white;padding-left: 300px;padding-top: 150px">Welcome to Mentor Portal</h1>

</div>
</body>


</html>

