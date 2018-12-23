<%@ page import="com.pict.database.DatabaseConnection" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>new profile</title>

    <meta name="viewport" content="width=device-width,initial-scale=1.0"/>
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
    <script src="../js/bootstrap.js"></script>

    <style>
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

    </style>
</head>
<body>
<%
    if (session.getAttribute("mentor_id") == null)
        response.sendRedirect("/index.jsp");

    String s_stud_mis_id = (String) request.getParameter("id");

    Connection databaseConnection = DatabaseConnection.getDatabaseConnection();
    Connection con;
    Connection con2;
    PreparedStatement ps = null;
    Statement pss2 = null;
    Class.forName("com.mysql.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mentorsys", "root", "root@123");

    PreparedStatement preparedStatement = null;

    preparedStatement = con.prepareStatement("select * from student where stud_mis_id=?");
    preparedStatement.setString(1, s_stud_mis_id);

    ResultSet rs = preparedStatement.executeQuery();
    String stud_name = null;
    String stud_email = null;
    String srud_roll_no = null;
    String stud_batch = null;
    String stud_prn = null;
    String stud_contact_no = null;
    String stud_dob = null;
    String studblodgrp = null;
    String stud_gender = null;
    String stud_local_add = null;
    String stud_per_add = null;
    String stud_div = null;
    String stud_year = null;
    if (rs.next()) {
        stud_name = rs.getString("stud_name");
        stud_email = rs.getString("stud_email");
        srud_roll_no = rs.getString("stud_roll_no");
        stud_batch = rs.getString("stud_batch");
        stud_prn = rs.getString("stud_prn");
        stud_contact_no = rs.getString("stud_contact_no");
        stud_dob = rs.getString("stud_dob");
        studblodgrp = rs.getString("stud_blodgrp");
        stud_gender = rs.getString("stud_gender");
        stud_local_add = rs.getString("stud_local_add");
        stud_per_add = rs.getString("stud_per_add");
        stud_div = rs.getString("stud_div");
        stud_year = rs.getString("stud_year");
    }

%>
<div class="container-fluid">
<div class="row">
    <div class="col-3 "></div>
    <div class="col-6 form">
        <form action="../EditPersonal"  method="POST">
            <h1>Personal Details</b> </h1>
            <div class="form-group">
                <label>Student Name</label>
                <input type="text" class="form-control" placeholder="Full Name" value="<%=stud_name%>" readonly>
                <label>PRN</label>
                <input type="number" class="form-control" name="prn_no" placeholder="PR number" value="<%=stud_prn%>" readonly><br>
                <div class="form-group" style="color: black">
                    <label>Year</label>
                    <input type="number" class="form-control" name="prn_no" placeholder="Year" value="<%=stud_year%>" readonly><br>
                    <br>
                    <label>Division</label>
                    <input type="text" class="form-control" name="stud_div" placeholder="Division" value="<%=stud_div%>" readonly>
                    <label>Roll no.</label>
                    <input type="number" class="form-control" name="stud_roll" placeholder="Roll no" value="<%=srud_roll_no%>" readonly>
                    <label>Batch</label>
                    <input type="text" class="form-control" name="stud_batch" placeholder="Batch" value="<%=stud_batch%>" readonly>
                </div>
                <label>Contact no.</label>
                <input type="text" class="form-control" name="stud_contact" placeholder="Contact no." value="<%=stud_contact_no%>" readonly>
                <label>Email</label>
                <input type="email" class="form-control" name="stud_email" placeholder="Email id" value="<%=stud_email%>" readonly>
            </div>

            <div class="form-group">
                <div class="half">
                    <label>Date of birth</label>
                    <input type="date" class="form-control" name="stud_dob" placeholder="Birthday" value="<%=stud_dob%>" readonly>
                </div>
                <div class="half">
                    <label>Select Gender</label>
                    <input type="text" class="form-control" name="stud_contact" placeholder="Contact no." value="<%=stud_gender%>" readonly>
                </div>
            </div>
            <div class="form-group">
                <label>Blood Group</label>
                <input type="text" class="form-control" name="stud_bg" placeholder="Blood Group" value="<%=studblodgrp%>" readonly>
                <label>Local Address</label>
                <input type="text" class="form-control" name="stud_local_add" placeholder="Local Address" value="<%=stud_local_add%>" readonly>
                <label>Permanent Address</label>
                <input type="text" class="form-control" name="stud_per_add" placeholder="Permanent Address" value="<%=stud_per_add%>" readonly>
            </div>

        </form>


    </div>
    <div class="col-3 "></div>
</div>
</div>
</body>
</html>
