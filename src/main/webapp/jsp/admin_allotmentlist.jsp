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
    <style>
    .navbar-collapse a:hover {
    background-color: #ddd;
    }

    .navbar-collapse .toright {
    float: right;
    }

    .dropdown-content {
    display: none;
    position: absolute;
    background-color: #f9f9f9;
    min-width: 160px;
    box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
    z-index: 1;
    }

    .dropdown-content a {
    float: none;
    color: black;
    padding: 12px 16px;
    text-decoration: none;
    display: block;
    text-align: left;
    }

    .dropdown-content a:hover {
    background-color: #ddd;
    }

    .dropdown:hover .dropdown-content {
    display: block;
    }

    .navbar-nav .toright {
    float: right;
    }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <%
        if (session.getAttribute("stud_name")==null)
            response.sendRedirect("/index.jsp");
        String stud_name = (String)session.getAttribute("stud_name");
    %>
    <a class="navbar-brand" href="#">WELCOME <%=stud_name%></a>


    <div class="collapse navbar-collapse" id="navbarColor03">
        <ul class="navbar-nav mr-auto">

            <li class="nav-item ">
                <a class="nav-link" href="/jsp/admin_index.jsp">Home </a>
            </li>
            <%--<li class="nav-item">--%>
                <%--<a class="nav-link" href="/jsp/admin_profile.jsp">Allot mentor to Student</a>--%>
            <%--</li>--%>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink1" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="color: black">
                    Allot mentor to Student
                </a>
                <div class="dropdown-content" aria-labelledby="navbarDropdownMenuLink">
                    <a class="dropdown-item" href="/jsp/admin_allotsingle.jsp">Allot single Student</a>
                    <a class="dropdown-item" href="/jsp/admin_profile.jsp">Allot Multiple Students </a>
                </div>
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
                    String sql = "select s.stud_name , m.mentorname, s.stud_roll_no from student s, mentor m, studentmentorrel sm where s.stud_mis_id=sm.stud_mis_id and m.emp_id=sm.emp_id order by s.stud_roll_no;";
                    ps = con.prepareStatement(sql);
                    ResultSet rs = ps.executeQuery();
                    String m1="   ";
                    while (rs.next())
                        {
                            String mentor_name=rs.getString("m.mentorname");
                            String student_name=rs.getString("s.stud_name");
                            int student_roll_no=rs.getInt("s.stud_roll_no");
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
