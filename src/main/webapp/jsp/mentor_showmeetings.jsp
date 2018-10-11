<%--
  Created by IntelliJ IDEA.
  User: suhani
  Date: 8/10/18
  Time: 8:49 PM
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
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Drop Downlist</title>

    <meta name="viewport" content="width=device-width,initial-state=1"/>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.min.css">
    <script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
</head>
<body>
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

<div class="row" style="margin-top: 100px">
    <div class="col-md-3"></div>
    <div class="col-md-6">
        <table class="table table-hover" style="width: 1200px">
            <thead>
            <tr>
                <th scope="col">Meeting_id</th>
                <th scope="col">Meeting_date</th>
                <th scope="col">Attendance</th>
            </tr>
            </thead>

            <%
                try
                {   Connection con;
                    PreparedStatement ps = null;
                    Class.forName("com.mysql.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mentorsys", "hello", "hello");
                    System.out.println("SL3 "+ "database successfully opened.");
                    String menid = (String)session.getAttribute("stud_name");
                    System.out.println(menid);

                    String sql = "select activity_id,activity_date from activity_list where activity_name=? and mentor_id=? order by activity_id;";

                    ps = con.prepareStatement(sql);
                    ps.setString(1,"meeting");
                    ps.setString(2,menid);
                    ResultSet rs = ps.executeQuery();
                    while (rs.next())
                    {
                        String activity_id=rs.getString("activity_id");
                        String activity_date=rs.getString("activity_date");
                        //System.out.println(student_id + student_name);
            %>
            <tbody>
            <tr class="table-primary">
                <td><%=activity_id%></td>
                <td><%=activity_date%></td>
                <td><a href="/jsp/mentor_updateattendance.jsp?id=<%=activity_id%>">Update Attendance</a></td>
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


</body>
</html>