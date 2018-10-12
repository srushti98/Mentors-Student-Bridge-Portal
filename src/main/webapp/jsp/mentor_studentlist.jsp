<%--
  Created by IntelliJ IDEA.
  User: suhani
  Date: 3/10/18
  Time: 12:23 AM
  To change this template use File | Settings | File Templates.
--%>

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
                <a class="nav-link" href="#">Send MOM</a>
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
                <th scope="col">MIS-ID</th>
                <th scope="col">Name</th>
                <th scope="col">Profile</th>
            </tr>
            </thead>

            <%
                try
                {   Connection con;
                    PreparedStatement ps = null;
                    Class.forName("com.mysql.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mentor_sys", "hello", "hello");
                    System.out.println("SL3 "+ "database successfully opened.");
                    String menid = (String)session.getAttribute("stud_name");
                    System.out.println(menid);
                    String sql = "select s.stud_mis_id,s.stud_name from student s,studentmentorrel sm where  s.stud_mis_id=sm.stud_mis_id and sm.emp_id=? order by s.stud_roll_no;";

                    ps = con.prepareStatement(sql);
                    ps.setString(1,menid);
                    ResultSet rs = ps.executeQuery();
                    while (rs.next())
                    {
                        String student_id=rs.getString("s.stud_mis_id");
                        String student_name=rs.getString("s.stud_name");
                        System.out.println(student_id + student_name);
            %>
            <tbody>
            <tr class="table-primary">
            <td><%=student_id%></td>
            <td><%=student_name%></td>
                <td><a href="/jsp/mentor_view_student.jsp?id=<%=student_id%>">View Profile</a></td>
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