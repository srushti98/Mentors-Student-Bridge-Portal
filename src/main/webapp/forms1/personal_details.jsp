<%@ page import="com.pict.database.DatabaseConnection" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>new profile</title>

    <meta name="viewport" content="width=device-width,initial-scale=1.0"/>
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <script src="../js/bootstrap.js"></script>

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

        .form{
            background-color: rgba(86, 86, 86.0.8);
            margin-top: 50px;
            border: solid;
            border-color: black;
            border-radius: 50px;
            padding: 50px 40px;
        }

        h1{
            font-size: 40px;
            font-family: "Javanese Text";
            margin-top: 40px;
            text-align: center;
            color: black;
        }

        label{
            font-size: 20px;
            color: black;
        }


        .btn-danger,.btn-primary{
            border-radius: 0px;
            width: 48%;
            height: 50px;
        }
    </style>
</head>
<body>
<%
    if (session.getAttribute("stud_name") == null)
        response.sendRedirect("/index.jsp");

    String s_stud_name = (String) session.getAttribute("stud_name");

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
    if (rs.next()) {
        prn = rs.getString("stud_prn");
        roll = rs.getString("stud_roll_no");
        batch = rs.getString("stud_batch");
        div = rs.getString("stud_div");
    }
    int prn_int = Integer.parseInt(prn);
    int roll_int = Integer.parseInt(roll);

%>

<nav class="navbar navbar-expand-lg navbar-light bg-primary">
    <a class="navbar-brand" href="#" style="color: white">Mentor-Student</a>
    <%
        if (session.getAttribute("stud_name")==null)
            response.sendRedirect("/index.jsp");
        String stud_name = (String)session.getAttribute("stud_name");
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
                    <a class="dropdown-item" href="academic_details.jsp">Academic Details </a>
                    <a class="dropdown-item" href="parent_details.jsp">Parent Details</a>
                    <a class="dropdown-item" href="extra_activities.jsp">Extra Activities</a>
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
                <a class="nav-link" href="../jsp/student_profile.jsp" style="float: right; color: white" ><%=stud_name%></a>
            </li>
        </ul>
    </div>
</nav>
<div class="container-fluid">
<div class="row">
    <div class="col-3 "></div>
    <div class="col-6 form">
        <form action="../EditPersonal"  method="POST">
            <h1>Personal Details</b> </h1>
            <div class="form-group">
                <label>Student Name</label>
                <input type="text" class="form-control" placeholder="Full Name" value="<%=s_stud_name%>" readonly>
                <label>PRN</label>
                <input type="number" class="form-control" name="prn_no" placeholder="PR number" value="<%=prn_int%>" readonly><br>
                <div class="form-group" style="color: black">
                    <label>Year</label>
                    <input type="radio" name="stud_year" value="2">SE
                    <input type="radio" name="stud_year" value="3">TE
                    <input type="radio" name="stud_year" value="4">BE<br>
                    <label>Division</label>
                    <input type="text" class="form-control" name="stud_div" placeholder="Division" value="<%=div%>">
                    <label>Roll no.</label>
                    <input type="number" class="form-control" name="stud_roll" placeholder="Roll no" value="<%=roll_int%>">
                    <label>Batch</label>
                    <input type="text" class="form-control" name="stud_batch" placeholder="Batch" value="<%=batch%>">
                </div>
                <label>Contact no.</label>
                <input type="text" class="form-control" name="stud_contact" placeholder="Contact no." value="<%=rs.getString("stud_contact_no")%>">
                <label>Email</label>
                <input type="email" class="form-control" name="stud_email" placeholder="Email id" value="<%=rs.getString("stud_email")%>">
            </div>

            <div class="form-group">
                <div class="half">
                    <label>Date of birth</label>
                    <input type="date" class="form-control" name="stud_dob" placeholder="Birthday" value="<%=rs.getString("stud_dob")%>">
                </div>
                <div class="half">
                    <label>Select Gender</label>
                    <select class="form-control" name="stud_gender" value="<%=rs.getString("stud_gender")%>">
                        <option value="Male">Male</option>
                        <option value="Female">Female</option>
                    </select>
                </div>
            </div>
            <div class="form-group">
                <label>Blood Group</label>
                <input type="text" class="form-control" name="stud_bg" placeholder="Blood Group" value="<%=rs.getString("stud_blodgrp")%>">
                <label>Local Address</label>
                <textarea class="form-control" rows="3" name="stud_local_add" placeholder="Local Address"></textarea>
                <label>Permanent Address</label>
                <textarea class="form-control" rows="3" name="stud_per_add" placeholder="Permanent Address"></textarea>
            </div>

            <div class="form-group">
                <input type="submit" class="btn-primary" value="submit">
                <input type="reset" class="btn-danger" value="reset">
            </div>



        </form>


    </div>
    <div class="col-3 "></div>
</div>
</div>

<%--<script>--%>
    <%--/* When the user clicks on the button,--%>
    <%--toggle between hiding and showing the dropdown content */--%>
    <%--function myFunction1() {--%>
        <%--document.getElementById("myDropdown1").classList.toggle("show");--%>
    <%--}--%>

    <%--// Close the dropdown if the user clicks outside of it--%>
    <%--window.onclick = function(e) {--%>
        <%--if (!e.target.matches('.dropbtn')) {--%>
            <%--var myDropdown = document.getElementById("myDropdown1");--%>
            <%--if (myDropdown.classList.contains('show')) {--%>
                <%--myDropdown.classList.remove('show');--%>
            <%--}--%>
        <%--}--%>
    <%--}--%>

    <%--function myFunction2() {--%>
        <%--document.getElementById("myDropdown2").classList.toggle("show");--%>
    <%--}--%>

    <%--// Close the dropdown if the user clicks outside of it--%>
    <%--window.onclick = function(e) {--%>
        <%--if (!e.target.matches('.dropbtn')) {--%>
            <%--var myDropdown = document.getElementById("myDropdown2");--%>
            <%--if (myDropdown.classList.contains('show')) {--%>
                <%--myDropdown.classList.remove('show');--%>
            <%--}--%>
        <%--}--%>
    <%--}--%>
<%--</script>--%>
</body>
</html>
