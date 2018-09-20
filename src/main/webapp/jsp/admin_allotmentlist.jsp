<%--
  Created by IntelliJ IDEA.
  User: vipul
  Date: 18/9/18
  Time: 9:59 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.Writer" %>
<%@ page import="static java.util.Objects.equals" %>
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
    <a class="navbar-brand" href="#"><span style="font-size:30px;cursor:pointer" onclick="openNav()">&#9776;</span></a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor03" aria-controls="navbarColor03" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarColor03">
        <ul class="navbar-nav mr-auto">

            <li class="nav-item ">
                <a class="nav-link" href="/jsp/admin_index.jsp">Home </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/jsp/admin_profile.jsp">Allot mentor to Student</a>
            </li>
            <li class="nav-item ">
                <a class="nav-link" href="/jsp/admin_studentslist.jsp">View all Students<span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/jsp/admin_mentorlist.jsp">View all Mentors</a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="/jsp/admin_allotmentlist.jsp">View Allotments</a>
            </li>
        </ul>
        <a class="nav-link" href="#"><i class="material-icons">
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
                    <th>Mentor Name</th>
                    <th>Student Name</th>
                    <th>Student Roll No.</th>
                </tr>
            </thead>
                <%
                try
                {   Connection con;
                    PreparedStatement ps = null;
                    Class.forName("com.mysql.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mentorsys", "hello", "hello");
                    System.out.println("SL3 "+ "database successfully opened.");
                    String sql = "select s.name , m.name, s.roll_no from student s, mentor m, studentmentorrel sm where s.mis_id=sm.mis_id and m.emp_id=sm.emp_id order by s.roll_no;";
                    ps = con.prepareStatement(sql);
                    ResultSet rs = ps.executeQuery();
                    String m1="   ";
                    while (rs.next())
                        {
                            String mentor_name=rs.getString("m.name");
                            String student_name=rs.getString("s.name");
                            int student_roll_no=rs.getInt("s.roll_no");
                %>
            <tbody>
                <%
                    if(!m1.equals(mentor_name))
                    {
                        m1=mentor_name;
                %>
                        <th><%=mentor_name%></th>
                <%
                    }
                    else
                    {
                %>
                <th>    </th>
                <%
                    }
                %>
                <th><%=student_name%></th>
                <th><%=student_roll_no%></th>
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
