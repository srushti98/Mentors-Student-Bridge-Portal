<%--
  Created by IntelliJ IDEA.
  User: madhura
  Date: 8/10/18
  Time: 8:22 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.pict.database.DatabaseConnection" %>
<%@ page import="java.sql.*" %>
<%@ page import="static java.lang.System.out" %>
<%@ page import="java.util.Base64" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Meetings</title>

    <meta name="viewport" content="width=device-width,initial-scale=1.0"/>
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <script src="../js/bootstrap.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.css" rel="stylesheet" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>

    <style>
        .navbar-collapse a:hover {
            background-color: #2f28d6;
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

<nav class="navbar navbar-expand-lg navbar-light bg-primary">
    <a class="navbar-brand" href="#" style="color: white">Mentor-Student</a>
    <%
        if (session.getAttribute("stud_name")==null)
            response.sendRedirect("/index.jsp");
        String s_stud_name = (String)session.getAttribute("stud_name");
        String s_stud_mis_id = (String)session.getAttribute("stud_mis_id");

        Connection databaseConnection = DatabaseConnection.getDatabaseConnection();
        Connection con;
        Connection con2;
        Connection con3;
        PreparedStatement ps = null;
        PreparedStatement preparedStatement = null;
        Statement pss = null;
        Statement pss2 = null;
        Statement pss3 = null;
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mentorsys", "hello", "hello");
        con2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/mentorsys", "hello", "hello");
        con3 = DriverManager.getConnection("jdbc:mysql://localhost:3306/mentorsys", "hello", "hello");
        pss=con2.createStatement();
        pss2=con3.createStatement();
        pss3=con3.createStatement();

        preparedStatement = con.prepareStatement("select * from activity_list a join student_activity_list s on s.activity_id = a.activity_id where stud_mis_id=? order by activity_date desc ");
        preparedStatement.setString(1, s_stud_mis_id);

        ResultSet rs = preparedStatement.executeQuery();

        int rss = pss.executeUpdate("update student_activity_list set is_seen=1 where stud_mis_id='"+s_stud_mis_id+"'");
        if (rss>0)
            System.out.println("Table updated!!!");

    %>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNavDropdown">
        <ul class="navbar-nav">
            <li class="nav-item active">
                <a class="nav-link" href="student_profile.jsp" style="color: white" >Home <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink1" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="color: white">
                    Edit Profile
                </a>
                <div class="dropdown-content" aria-labelledby="navbarDropdownMenuLink">
                    <a class="dropdown-item" href="../forms1/personal_details.jsp">Personal Details</a>
                    <a class="dropdown-item" href="../forms1/academic_details.jsp">Academic Details </a>
                    <a class="dropdown-item" href="../forms1/parent_details.jsp">Parent Details</a>
                    <a class="dropdown-item" href="../forms1/extra_activities.jsp">Extra Activities</a>
                </div>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="color: white">
                    Submit
                </a>
                <div class="dropdown-content" aria-labelledby="navbarDropdownMenuLink">
                    <a class="dropdown-item" href="../forms1/leave_app.jsp">Leave Application</a>
                    <a class="dropdown-item" href="#">Undertaking</a>
                    <a class="dropdown-item" href="#">View Meetings</a>
                    <a class="dropdown-item" href="#">Meet Mentor</a>
                </div>
            </li>
            <%

                ResultSet rss2 = pss2.executeQuery("select * from activity_list a join student_activity_list s on s.activity_id = a.activity_id where stud_mis_id='"+s_stud_mis_id+"' and is_seen= 0 order by activity_date desc");
                ResultSet rss3 = pss3.executeQuery("select count(a.activity_id) from activity_list a join student_activity_list s on s.activity_id = a.activity_id where stud_mis_id='"+s_stud_mis_id+"' and is_seen= 0");
                int count=rss3.getRow();
//                while (rss3.next()) {
//                    count +=1;
//                }

            %>

            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="color: white">
                    Notifications <% if (count!=0) { %> <span class="badge badge-danger badge-pill"><%=count%></span> <% } %>
                </a>
                <div class="dropdown-content" aria-labelledby="navbarDropdownMenuLink">
                    <%

                        while (rss2.next()) {
                    %>
                    <a class="dropdown-item" href="student_view_meetings.jsp"><%=rss2.getString("activity_id")%> : <%=rss2.getString("activity_type")%></a>
                    <%--<a class="dropdown-item" href="#">note 2</a>--%>
                    <%--<a class="dropdown-item" href="#">note 3</a>--%>
                    <%--<a class="dropdown-item" href="#">note 4</a>--%>
                    <%
                        }
                    %>
                </div>
            </li>
        </ul>

    </div>
    <div class="toright">
        <a class="nav-link" href="/LogoutServlet" style="float: right; color: white">LogOut</a>
        <a class="nav-link" href="student_profile.jsp" style="float: right; color: white" ><%=s_stud_name%></a>

    </div>

</nav>
<div class="row" style="margin-top: 100px">

    <div class="col-md-3"></div>
    <div class="col-md-6">

        <%--<%--%>

            <%--while (rs.next()) {--%>

        <%--%>--%>


        <table class="table table-hover" style="width: 1200px">
            <thead>
            <tr>
                <th scope="col">Sr. no</th>
                <th scope="col">Name</th>
                <th scope="col">Description</th>
                <th scope="col">Date</th>

            </tr>
            </thead>
            <%
                while(rs.next())
                {
                    String act_id = rs.getString("activity_id");
                    String act_name = rs.getString("activity_type");
                    String act_desc = rs.getString("activity_details");
                    String act_date = rs.getString("activity_date");

            %>
            <tbody>
            <tr class="table-primary">
                <td><%=act_id %></td>
                <td><%=act_name %></td>
                <td><%=act_desc %></td>
                <td><%=act_date %></td>
            </tr>
            <%
                }
            %>




            </tbody>
        </table>

        <%--<%--%>
            <%--}--%>
        <%--%>--%>



    </div>
</div>



</body>
</html>
