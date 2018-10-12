<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.Writer" %>
<%@ page import="static java.util.Objects.equals" %>
<%@ page import="java.lang.String" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Drop Downlist</title>

    <meta name="viewport" content="width=device-width,initial-state=1"/>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.min.css">
    <script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
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
                <a class="nav-link" style="color: white" href="#"><strong><b>Send MOM</b></strong></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" style="color: white" href="#"><strong><b>Track Students Attendance</b></strong></a>
            </li>
        </ul>
        <a class="nav-link" href="../LogoutServlet" style="color: white"><i class="material-icons">
            account_circle
        </i> <strong><b>signout</b></strong></a>
    </div>

</nav>

<form action="../MentorUpdateAttendance?id=<%=request.getParameter("id")%>" method="post" >
    <div class="row" style="margin-top: 100px">
        <div class="col-md-3"></div>
        <div class="col-md-6">
            <table class="table table-hover" style="width: 1200px">
                <thead>
                <tr>
                    <th scope="col">MIS ID</th>
                    <th scope="col">Roll No</th>
                    <th scope="col">Name</th>
                    <th scope="col">Mark</th>
                </tr>
                </thead>
                <%
                    try
                    {
                        if (session.getAttribute("stud_name")==null)
                            response.sendRedirect("/index.jsp");
                        String activityid = (String)request.getParameter("id");
                        Connection con;
                        PreparedStatement ps = null;
                        Class.forName("com.mysql.jdbc.Driver");
                        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mentorsys", "hello", "hello");
                        System.out.println("SL3 "+ "database successfully opened.");
                        String menid = (String)session.getAttribute("stud_name");
                        System.out.println(menid);
                        String sql = "select sa.student_id,s.stud_roll_no,s.stud_name from student s,student_activitylist sa where sa.activity_id=? and s.stud_mis_id=sa.student_id order by s.stud_roll_no;";
                        ps = con.prepareStatement(sql);
                        ps.setString(1,activityid);
                        ResultSet rs = ps.executeQuery();
                        while (rs.next())
                        {
                            String stud_mis_id=rs.getString("student_id");
                            String mis=rs.getString("student_id");
                            String stud_roll_no=rs.getString("stud_roll_no");
                            String studentname=rs.getString("stud_name");
                %>
                <tbody>
                <tr class="table-primary">
                    <td><%=stud_mis_id%></td>
                    <td><%=stud_roll_no%></td>
                    <td><%=studentname%></td>
                    <td><input type="checkbox" name="attendance" value="<%=mis%>" /> &nbsp; </td>
                </tr>

                <%
                        }
                    }
                    catch(SQLException sqe)
                    {
                        System.out.println(sqe);
                    }
                %>
                </tbody>
            </table>
        </div>
    </div>
    <br><br><br><br>
    <div class="form-group" style="text-align: center">
        <input class="submit" name="submit" type="submit" value="SUBMIT" style="width: 300px; height: 50px; margin: 0 auto;">
    </div>
</form>

</body>
</html>