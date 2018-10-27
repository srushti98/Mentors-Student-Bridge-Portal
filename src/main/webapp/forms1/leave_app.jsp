<%@ page import="com.pict.database.DatabaseConnection" %>
<%@ page import="java.sql.*" %><%--
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
    <link rel="stylesheet" href="../css/stud_profile_navbar.css">
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
    <script src="../js/bootstrap.js"></script>

    <style>

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
<%
    if (session.getAttribute("stud_name")==null)
        response.sendRedirect("/index.jsp");
    String s_stud_name = (String)session.getAttribute("stud_name");
    String s_stud_mis_id = (String)session.getAttribute("stud_mis_id");

    Connection databaseConnection = DatabaseConnection.getDatabaseConnection();
    Connection con;
    Connection con2;
    Statement pss2 = null;
    PreparedStatement ps = null;
    Class.forName("com.mysql.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mentorsys", "hello", "hello");
    con2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/mentorsys", "hello", "hello");
    pss2=con2.createStatement();

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

    ResultSet rss3 = pss2.executeQuery("select count(a.activity_id) as ccount from activity_list a join student_activity_list s on s.activity_id = a.activity_id where stud_mis_id='"+s_stud_mis_id+"' and is_seen= 0");
    int count=0;
    rss3.next();
    count=rss3.getInt("ccount");


%>
<div id='cssmenu' class="sticky-top">
    <ul style="font-size: 25px">
        <li class="active"><a href='../jsp/student_profile.jsp'><span></span><span><i class="fa fa-home"></i> </span></a></li>
        <li class='has-sub'><a href='#'><span>Forms</span></a>
            <ul>
                <li class='has-sub'><a href='#'><span>Edit</span></a>
                    <ul>
                        <li><a href='personal_details.jsp'><span>Personal Details</span></a></li>
                        <li><a href='parent_details.jsp'><span>Parent Details</span></a></li>
                        <li><a href='academic_details.jsp'><span>Academic Details</span></a></li>
                        <li class='last'><a href='extra_activities.jsp'><span>Extra Activities</span></a></li>
                    </ul>
                </li>
                <li class='has-sub'><a href='#'><span>Submit</span></a>
                    <ul>
                        <li class='last'><a href='leave_app.jsp'><span>Leave Application</span></a></li>
                        <li class='last'><a href='upload_docs.jsp'><span>Certificates / Undertaking</span></a></li>
                    </ul>
                </li>
            </ul>
        </li>
        <!--<li><a href='#'><span>Other</span></a></li>-->
        <li class='has-sub'><a href='#'><span>Other</span></a>
            <ul>
                <li class='has-sub'><a href='contact_mentor.jsp'><span>Contact Mentor</span></a></li>
                <li class='has-sub'><a href='../jsp/student_view_leaves.jsp'><span>View Leaves Taken</span></a></li>
                <li class='has-sub'><a href='../jsp/student_view_meetings.jsp'><span>View Meetings</span></a></li>
            </ul>
        </li>

        <li style="float:right"><a href='/LogoutServlet'><span>LogOut</span></a></li>
        <li style="float:right"><a href='#'><span><%=s_stud_name%></span></a></li>
        <li class='last' style="float:right"><a href='../jsp/student_view_meetings.jsp'><span><i class="fa fa-bell"></i> </span><% if (count!=0) {%><span class="badge badge-danger badge-pill"><%=count%></span><%}%></a></li>
    </ul>
</div>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-3"></div>
        <div class="col-md-6 new_user_form" >
            <form action="/LeaveApps" method="post">
                <h1 align="center"><u>Leave application</u></h1>
                <br>
                <div class="form-group">
                    <label>Attendance prior to this leave :</label>
                    <input type="text" class="form-control" name="attendance_prior" required>
                </div>
                <div class="form-group" align="left">
                    <label>Leave Start Date :</label>
                    <input type="date" name="start_date"  required />
                </div>
                <div class="form-group" align="left">
                    <label>Leave End Date :</label>
                    <input type="date" name="end_date"  required />
                </div>
                <div class="form-group">
                    <label>Number of working hours falling in the leave period :</label>
                    <input type="number" class="form-control" name="no_of_hrs" required>
                </div>


                <div class="form-group">
                    <label>Reason for this leave :</label>
                    <%--<input type="text" class="form-control" name="reason" required>--%>
                    <textarea name="reason" class="form-control" cols="30" rows="10"required></textarea>
                </div>
                <div class="blockquote-footer">
                    <button type="submit" class="button1 button4" style="width:100px;height:50px; ">Request</button>
                    <button type="Reset"  class="button2 button4" style="width:100px;height:50px;">Cancel</button>
                </div>

            </form>
        </div>
        <div class="col-md-3"></div>
    </div>

</div>
</div>
</body>

</html>
