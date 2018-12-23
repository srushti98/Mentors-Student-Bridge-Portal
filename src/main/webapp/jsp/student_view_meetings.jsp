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
    <link rel="stylesheet" href="../css/stud_profile_navbar.css">
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
    <script src="../js/bootstrap.js"></script>

</head>
<body>
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
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mentorsys", "root", "root@123");
    con2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/mentorsys", "root", "root@123");
    con3 = DriverManager.getConnection("jdbc:mysql://localhost:3306/mentorsys", "root", "root@123");
    pss=con2.createStatement();
    pss2=con3.createStatement();
    pss3=con3.createStatement();

    preparedStatement = con.prepareStatement("select * from activity_list a join student_activity_list s on s.activity_id = a.activity_id where stud_mis_id=? order by activity_date desc ");
    preparedStatement.setString(1, s_stud_mis_id);

    ResultSet rs = preparedStatement.executeQuery();

    int rss = pss.executeUpdate("update student_activity_list set is_seen=1 where stud_mis_id='"+s_stud_mis_id+"'");
    if (rss>0)
        System.out.println("Table updated!!!");

    ResultSet rss3 = pss2.executeQuery("select count(a.activity_id) as ccount from activity_list a join student_activity_list s on s.activity_id = a.activity_id where stud_mis_id='"+s_stud_mis_id+"' and is_seen= 0");
    int count=0;
    rss3.next();
    count=rss3.getInt("ccount");

%>

<div id='cssmenu' class="sticky-top">
    <ul style="font-size: 25px">
        <li class="active"><a href='student_profile.jsp'><span></span><span><i class="fa fa-home"></i> </span></a></li>
        <li class='has-sub'><a href='#'><span>Forms</span></a>
            <ul>
                <li class='has-sub'><a href='#'><span>Edit</span></a>
                    <ul>
                        <li><a href='../forms1/personal_details.jsp'><span>Personal Details</span></a></li>
                        <li><a href='../forms1/parent_details.jsp'><span>Parent Details</span></a></li>
                        <li><a href='../forms1/academic_details.jsp'><span>Academic Details</span></a></li>
                        <li class='last'><a href='../forms1/extra_activities.jsp'><span>Extra Activities</span></a></li>
                    </ul>
                </li>
                <li class='has-sub'><a href='#'><span>Submit</span></a>
                    <ul>
                        <li class='last'><a href='../forms1/leave_app.jsp'><span>Leave Application</span></a></li>
                        <li class='last'><a href='../forms1/upload_docs.jsp'><span>Certificates / Undertaking</span></a></li>
                    </ul>
                </li>
            </ul>
        </li>
        <!--<li><a href='#'><span>Other</span></a></li>-->
        <li class='has-sub'><a href='#'><span>Other</span></a>
            <ul>
                <li class='has-sub'><a href='../forms1/contact_mentor.jsp'><span>Contact Mentor</span></a></li>
                <li class='has-sub'><a href='student_view_leaves.jsp'><span>View Leaves Taken</span></a></li>
                <li class='has-sub'><a href='student_view_meetings.jsp'><span>View Meetings</span></a></li>
            </ul>
        </li>

        <li style="float:right"><a href='/LogoutServlet'><span>LogOut</span></a></li>
        <li style="float:right"><a href='student_profile.jsp'><span><%=s_stud_name%></span></a></li>
        <li class='last' style="float:right"><a href='student_view_meetings.jsp'><span><i class="fa fa-bell"></i> </span><% if (count!=0) {%><span class="badge badge-danger badge-pill"><%=count%></span><%}%></a></li>
    </ul>
</div>
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
                    String act_name = rs.getString("activity_name");
                    String act_desc = rs.getString("activity_content");
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
