<%@ page import="com.pict.database.DatabaseConnection" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %><%--
  Created by IntelliJ IDEA.
  User: madhura
  Date: 14/9/18
  Time: 7:00 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Leave_Application</title>
    <meta name="viewport" content="width=device-width,initial-state=1"/>
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

        .new_user_form{
            border: 2px solid black;
            padding: 50px 40px;
            margin-top: 50px;
            margin-bottom: 50px;
            border-radius: 10px;
        }

        .button1 {
            color: white;
            font-family: "Comic Sans MS";
            background-color: #3cb22c;
            border-top-color: #337e29;
            width: 48%;
        }
        .button2 {
            color: white;
            font-family: "Comic Sans MS";
            background-color:#e31e0e ;
            border-top-color: #a9281d;
            width: 48%;
        }
        .button4 {border-radius: 12px;}


    </style>
</head>

<body>
<nav class="navbar navbar-expand-lg navbar-light bg-primary">
    <a class="navbar-brand" href="#" style="color: white">Mentor-Student</a>
    <%
        if (session.getAttribute("stud_name")==null)
            response.sendRedirect("/index.jsp");
        String s_stud_name = (String)session.getAttribute("stud_name");
        String stud_mis_id = (String)session.getAttribute("stud_mis_id");

        Connection databaseConnection = DatabaseConnection.getDatabaseConnection();
        Connection con;
        PreparedStatement ps = null;
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mentorsys", "hello", "hello");


        PreparedStatement preparedStatement = null;

        preparedStatement = con.prepareStatement("select * from student where stud_name=?");
        preparedStatement.setString(1, s_stud_name);

        ResultSet rs = preparedStatement.executeQuery();
        String prn = null;
        String roll = null;
        String batch = null;
        String div = null;
        String checkimg = null;
        if (rs.next()) {
            prn = rs.getString("stud_prn");
            roll = rs.getString("stud_roll_no");
            batch = rs.getString("stud_batch");
            div = rs.getString("stud_div");
            checkimg = rs.getString("stud_img");
        }

        System.out.println(s_stud_name);
        System.out.println(prn);
        System.out.println(roll);
        System.out.println(batch);
        System.out.println(div);
        //System.out.println(checkimg);

    %>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNavDropdown">
        <ul class="navbar-nav">
            <li class="nav-item active">
                <a class="nav-link" href="../jsp/student_profile.jsp" style="color: white" >Home <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink1" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="color: white">
                    Edit Profile
                </a>
                <div class="dropdown-content" aria-labelledby="navbarDropdownMenuLink">
                    <a class="dropdown-item" href="personal_details.jsp">Personal Details</a>
                    <a class="dropdown-item" href="#">Academic Details </a>
                    <a class="dropdown-item" href="#">Parent Details</a>
                    <a class="dropdown-item" href="#">Extra Activities</a>
                </div>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="color: white">
                    Submit
                </a>
                <div class="dropdown-content" aria-labelledby="navbarDropdownMenuLink">
                    <a class="dropdown-item" href="leave_app.jsp">Leave Application</a>
                    <a class="dropdown-item" href="#">Undertaking</a>
                    <a class="dropdown-item" href="#">Minutes of Meeting</a>
                    <a class="dropdown-item" href="#">Meet Mentor</a>
                </div>
            </li>
        </ul>
        <ul class="navbar-nav toright">
            <li class="nav-item ">
                <a class="nav-link" href="/LogoutServlet" style="float: right; color: white">LogOut</a>
            </li>
            <li class="nav-item ">
                <a class="nav-link" href="../jsp/student_profile.jsp" style="float: right; color: white" ><%=s_stud_name%></a>
            </li>
        </ul>
    </div>
</nav>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-3"></div>
        <div class="col-md-6 new_user_form" >
            <form action="#" method="post">
                <h1 align="center"><u>Leave application</u></h1>
                <br>
                <div class="form-group">
                    <label>Name :</label>
                    <input type="text" class="form-control" name="student_name" required>
                </div>
                <div class="form-group">
                    <label>Division :</label>
                    <input type="text" class="form-control" name="student_div" required>
                </div>
                <div class="form-group">
                    <label>Roll no :</label>
                    <input type="number" class="form-control" name="student_roll_no" required>
                </div>
                <div class="form-group">
                    <label>Attendance prior to this leave :</label>
                    <input type="text" class="form-control" name="attendance" required>
                </div>
                <div class="form-group" align="left">
                    <label>Leave Start Date :</label>
                    <input type="date" name="dateFrom"  required />
                </div>
                <div class="form-group" align="left">
                    <label>Leave End Date :</label>
                    <input type="date" name="dateTo"  required />
                </div>
                <div class="form-group">
                    <label>Number of working hours falling in the leave period :</label>
                    <input type="number" class="form-control" name="leave_hrs" required>
                </div>


                <div class="form-group">
                    <label>Reason for this leave :</label>
                    <br>
                    <textarea name="leave_reason" placeholder="Reason for leave" style="width:75%;height:100px;margin-top:6px;resize: horizontal" required></textarea>
                </div>
                <div class="blockquote-footer">
                    <button type="submit" class="button1 button4" style="width:100px;height:50px; ">Request</button>
                    <button type="submit"  class="button2 button4" style="width:100px;height:50px;">Cancel</button>
                </div>

            </form>
        </div>
        <div class="col-md-3"></div>
        </div>

    </div>
</div>
</body>

</html>
