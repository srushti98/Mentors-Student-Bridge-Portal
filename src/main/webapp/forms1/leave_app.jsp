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
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
    <script src="../js/bootstrap.js"></script>

    <style>
        #cssmenu > ul,
        #cssmenu > ul li,
        #cssmenu > ul ul {
            list-style: none;
            margin: 0;
            padding: 0;
        }
        #cssmenu > ul {
            position: relative;
            z-index: 597;
            height: 60px;

        }
        #cssmenu > ul li {
            float: left;
            min-height: 1px;
            line-height: 1.3em;
            vertical-align: middle;
        }
        #cssmenu > ul li.hover,
        #cssmenu > ul li:hover {
            position: relative;
            z-index: 599;
            cursor: default;
        }
        #cssmenu > ul ul {
            visibility: hidden;
            position: absolute;
            top: 100%;
            left: 0;
            z-index: 598;
            width: 100%;
        }
        #cssmenu > ul ul li {
            float: none;
        }
        #cssmenu > ul ul ul {
            top: 1px;
            left: 99%;
        }
        #cssmenu > ul li:hover > ul {
            visibility: visible;
        }
        /* Align last drop down RTL */
        #cssmenu > ul > li.last ul ul {
            left: auto !important;
            right: 99%;
        }
        #cssmenu > ul > li.last ul {
            left: auto;
            right: 0;
        }
        #cssmenu > ul > li.last {
            text-align: right;
        }
        /* Theme Styles */
        #cssmenu > ul {
            border-top: 4px solid #3f28f8;
            /*border-top: 4px solid #40bbd6;*/
            font-family: Calibri, Tahoma, Arial, sans-serif;
            font-size: 14px;
            background: #442ec7;
            /*background: #109eac;*/
            /*background: -moz-linear-gradient(top, #1e1e1e 0%, #2f9ed6 100%);*/
            /*background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #1e1e1e), color-stop(100%, #2f9ed6));*/
            /*background: -webkit-linear-gradient(top, #1e1e1e 0%, #2f9ed6 100%);*/
            /*background: linear-gradient(top, #1e1e1e 0%, #2f9ed6 100%);*/
            background: -moz-linear-gradient(top, #1e1e1e 0%, #436bd6 100%);
            background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #1e1e1e), color-stop(100%, #3c7ad6));
            background: -webkit-linear-gradient(top, #1e1e1e 0%, #3c7ad6 100%);
            background: linear-gradient(top, #1e1e1e 0%, #3c7ad6 100%);
            width: auto;
            zoom: 1;
        }
        #cssmenu > ul:before {
            content: '';
            display: block;
        }
        #cssmenu > ul:after {
            content: '';
            display: table;
            clear: both;
        }
        #cssmenu > ul li a {
            display: inline-block;
            padding: 10px 22px;
        }
        #cssmenu > ul > li.active,
        #cssmenu > ul > li.active:hover {
            /*background-color: #3f28f8;*/
            /*background-color: #40bbd6;*/
            background-color: #3c7ad6;
        }
        #cssmenu > ul > li > a:link,
        #cssmenu > ul > li > a:active,
        #cssmenu > ul > li > a:visited {
            color: #ffffff;
        }
        #cssmenu > ul > li > a:hover {
            color: #ffffff;
        }
        #cssmenu > ul ul ul {
            top: 0;
        }
        #cssmenu > ul li li {
            background-color: #ffffff;
            border-bottom: 1px solid #ebebeb;
            font-size: 20px;

        }
        #cssmenu > ul li.hover,
        #cssmenu > ul li:hover {
            background-color: #F5F5F5;
        }
        #cssmenu > ul > li.hover,
        #cssmenu > ul > li:hover {
            background-color: #3c7ad6;
            /*background-color: #40bbd6;*/
            -webkit-box-shadow: inset 0 -3px 0 rgba(0, 0, 0, 0.15);
            -moz-box-shadow: inset 0 -3px 0 rgba(0, 0, 0, 0.15);
            box-shadow: inset 0 -3px 0 rgba(0, 0, 0, 0.15);
        }
        #cssmenu > ul a:link,
        #cssmenu > ul a:visited {
            color: #9a9a9a;
            text-decoration: none;
        }
        #cssmenu > ul a:hover {
            color: #9a9a9a;
        }
        #cssmenu > ul a:active {
            color: #9a9a9a;
        }
        #cssmenu > ul ul {
            border: 1px solid #CCC \9;
            -webkit-box-shadow: 0 0px 2px 1px rgba(0, 0, 0, 0.15);
            -moz-box-shadow: 0 0px 2px 1px rgba(0, 0, 0, 0.15);
            box-shadow: 0 0px 2px 1px rgba(0, 0, 0, 0.15);
            width: 150px;
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
                <li class='has-sub'><a href='#'><span>Contact Mentor</span></a></li>
                <li class='has-sub'><a href='#'><span>View Students</span></a></li>
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
                    <input type="text" class="form-control" name="reason" required>
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
