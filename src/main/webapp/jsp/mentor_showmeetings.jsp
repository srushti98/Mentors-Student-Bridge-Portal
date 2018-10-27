<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.Writer" %>
<%@ page import="static java.util.Objects.equals" %>
<%@ page import="java.lang.String" %>
<%@ page import="com.pict.database.DatabaseConnection" %>
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

    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <script src="../js/bootstrap.js"></script>

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
    String mentor_id = (String)session.getAttribute("mentor_id");
    System.out.println(mentor_id);

    Connection databaseConnection = DatabaseConnection.getDatabaseConnection();
    Connection con1;
    int count = 0;
    try {
        Class.forName("com.mysql.jdbc.Driver");
        con1 = DriverManager.getConnection("jdbc:mysql://localhost:3306/mentorsys", "hello", "hello");
        System.out.println(count);
        PreparedStatement preparedStatement = null;
        preparedStatement = con1.prepareStatement("select count(id) as ccount from student_mentor_communication where seen=0 and emp_id=?");
        preparedStatement.setString(1, mentor_id);

        ResultSet rs = preparedStatement.executeQuery();
        if (rs.next()) {
            count = rs.getInt("ccount");
            System.out.println(count);
        }
        System.out.println(count);
    }catch (ClassNotFoundException e) {
        e.printStackTrace();
    }
    catch (SQLException e) {
        e.printStackTrace();
    }
%>
<body>
<nav class="navbar navbar-expand-lg " >
    <h1 class="navbar-brand"  style="color: white"><strong><b style="font-family: URW Chancery L, cursive ">Mentors' Portal</b></strong></h1>


    <div class="collapse navbar-collapse" id="navbarColor03" >
        <ul class="navbar-nav mr-auto">

            <li class="nav-item ">
                <a class="nav-link" style="color: white" href="/jsp/mentor_profile.jsp"><strong><b>Home</b></strong> </a>
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
                <a class="nav-link  active " style="color: white" href="/jsp/mentor_showmeetings.jsp"><strong><b>Track Students Attendance</b></strong></a>
            </li>
        </ul>
        <li class='last' style="float:right"><a href='student_mentor_contact.jsp'><span><i class="fa fa-bell"></i></span><% if (count!=0) {%><span class="badge badge-danger badge-pill"><%=count%></span><%}%></a></li>
        <a class="nav-link" href="../LogoutServlet" style="color: white"><i class="material-icons">
            account_circle
        </i> <strong><b>signout</b></strong></a>
    </div>

</nav>

<div class="col-4"></div>
<div class="col-4" style="margin-left: 670px ;margin-top: 40px">
    <h1 style="color: #0a8cc4"> MEETINGS LIST </h1>
</div>
<div class="container">
    <table class=".table-responsive" >
        <thead>
        <tr class=".table-responsive">
            <th >Meeting_id</th>
            <th >Meeting_date</th>
            <th >Update Attendance</th>
            <th> View Attendance</th>
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
        <tbody class=".table-responsive">
        <tr class=".table-responsive">
                <td style="color: #2f28d6"><%=activity_id%></td>
                <td style="color: #2f28d6"><%=activity_date%></td>
                <td><a  href="/jsp/mentor_updateattendance.jsp?id=<%=activity_id%>"><button class="button"><span style="font-size: x-large">Update </span></button></a></td>
                <td><a  href="/jsp/mentor_viewattendance.jsp?id=<%=activity_id%>"><button class="button"><span style="font-size: x-large">View </span></button></a></td>

        </tr>
        </tr

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