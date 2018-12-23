        <%@ page import="com.mysql.jdbc.PreparedStatement" %>
<%@ page import="com.pict.database.DatabaseConnection" %>
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
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

    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <script src="../js/bootstrap.js"></script>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/css/bootstrap.min.css" integrity="sha384-Smlep5jCw/wG7hdkwQ/Z5nLIefveQRIY9nfy6xoR1uRYBtpZgI6339F5dgvm/e9B" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons"
          rel="stylesheet">


    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/js/bootstrap.min.js" integrity="sha384-o+RDsa0aLu++PJvFqy8fFScvbHFLtbvScb8AjopnFD+iEQ7wo/CG0xlczd+2O/em" crossorigin="anonymous"></script><title>Register!!!</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.css" rel="stylesheet" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
    <link rel="stylesheet" href="/css/viewtrail.css">

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
        if (session.getAttribute("mentor_id") == null)
            response.sendRedirect("/index.jsp");
        String mentor_id = (String) session.getAttribute("mentor_id");
        System.out.println(mentor_id);

        Connection databaseConnection = DatabaseConnection.getDatabaseConnection();
        Connection con;
        int count = 0;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mentorsys", "root", "root@123");
            System.out.println(count);
            PreparedStatement preparedStatement = null;
            preparedStatement = (PreparedStatement) con.prepareStatement("select count(id) as ccount from student_mentor_communication where seen=0 and emp_id=?");
            preparedStatement.setString(1, mentor_id);

            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                count = rs.getInt("ccount");
                System.out.println(count);
            }
            System.out.println(count);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
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
        <li class='last' style="float:right"><a href='student_view_meetings.jsp'><span><i class="fa fa-bell"></i></span><% if (count != 0) {
        %><span class="badge badge-danger badge-pill"><%=count%></span><%}%></a></li>
        <a class="nav-link" href="../LogoutServlet" style="color: white"><i class="material-icons">
            account_circle
        </i> <strong><b>signout</b></strong></a>
    </div>

</nav>
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-3"></div>
            <div class="col-md-6 new_user_form" >
                <form action="#" method="post">
                    <h1 style="color: #0a8cc4" align="center"><u>Contact Mentor</u></h1>
                    <br>
                    <div class="form-group">
                        <label>Reason:</label>
                        <%
                            String title = null;
                            String description = null;
                            try {
                                PreparedStatement ps = null;
                                Class.forName("com.mysql.jdbc.Driver");
                                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mentorsys", "root", "root@123");
                                System.out.println("SL3 " + "database successfully opened.");
                                int id = Integer.parseInt(request.getParameter("id"));

                                ps = (PreparedStatement) con.prepareStatement("update student_mentor_communication set seen=1 where id=?");
                                ps.setInt(1, id);
                                ps.executeUpdate();

                                title = "";
                                description = "";

                                PreparedStatement ps1 = (PreparedStatement) con.prepareStatement("select title, description from student_mentor_communication where id=?");
                                ps1.setInt(1, id);

                                ResultSet rs = ps1.executeQuery();
                                if (rs.next()) {
                                    title = rs.getString("title");
                                    description = rs.getString("description");
                                }
                            } catch (SQLException sqe) {
                                System.out.println(sqe);
                            }
                        %>
                        <input type="text" class="form-control" name="reason" readonly value="<%=title%>">
                    </div>
                    <div class="form-group">
                        <label>Description: </label>
                        <%--<input type="tex" class="form-control" name="description" required>--%>
                        <textarea name="description"  class="form-control" cols="30" rows="10" readonly><%=description%></textarea>
                    </div>

                </form>
            </div>
            <div class="col-md-3"></div>
        </div>

    </div>
</body>

</html>
