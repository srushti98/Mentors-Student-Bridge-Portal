<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Student Profile</title>

    <meta name="viewport" content="width=device-width,initial-scale=1.0"/>
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <script src="../js/bootstrap.js"></script>
    <style>
        body {
            font-family: "Lato", sans-serif;
        }

        .sidenav {
            width: 300px;
            position: fixed;
        <!---z-index: 1;-->
            top: 10px;
            left: 10px;
            background: #eee;
        <!---overflow-x: scroll;-->
            padding: 30px 0;
            height: auto;

        }

        .sidenav1{
            height: 100%;
            width: 160px;
            position: fixed;
            z-index: 1;
            top: 0;
            left: 0;
            background-color: #111;
            overflow-x: hidden;
            padding-top: 20px;
        }

        .sidenav a {
            padding: 10px 30px ;
            text-decoration: none;
            text-space: 30px;
            font-size: 25px;
            color: white;
            display: block;
        }

        .sidenav a:hover {
            color: white;
            text-decoration: underline;
        }

        #profile_pic{
            padding: 10px;
            width: 200px;
            height: 200px;
            margin-left: 50px;
        }

        .main {
            margin-left: 140px; /* Same width as the sidebar + left position in px */
            font-size: 28px; /* Increased text to enable scrolling */
            padding: 0px 10px;
        }

        .top-nav{
            overflow: hidden;
            background-color: #545454;


        }

        .side_bar{
            /*background-color: rgba(109, 83, 214, 0.4);*/
            width: 350px;
            height: 900px;
        }

        .activitylist{
            text-decoration: none;
            font-size: 30px;
            padding-bottom: 20px;
            color: white;
        }

        .activitylist a {
            text-decoration: none;
            color: black;
        }

        .activitylist a:hover {
            text-decoration: underline;
        }

        .top-nav a {
            float: right;
            color: white;
            text-align: center;
            padding: 14px 16px;
            font-size: 30px;
            text-decoration: none;
        }

        .top-nav a:hover{
            background-color: #221b94;

        }

        .navbar-text {
            color: white;
            margin-left: 20px;
        }


        @media screen and (max-width: 800px) {
            .sidenav {padding-top: 15px;}
            .sidenav a {font-size: 18px;}
        }
    </style>

</head>
<body>
<div class="top-nav sticky-top">
    <span class="navbar-text"><h2>Mentor System</h2></span>
    <%
        if (session.getAttribute("stud_name")==null)
            response.sendRedirect("/index.jsp");
        String stud_name = (String)session.getAttribute("stud_name");
        String stud_prn = (String)session.getAttribute("stud_prn");%>
    <a class="active" href="../LogoutServlet">LogOut</a>
    <a href="#"><%=stud_name%></a>
</div>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-3 col-sm-3 col-xs-12" style="background-color: rgba(229,229,229,0.88);" >
            <div class="side_bar">
                <img src="../img/blank_profile.png" id="profile_pic" class="img">

                <ul class="activitylist">
                    <li><a href="#">View Profile</a></li>
                    <li><a href="../forms/mentor_form.jsp">Edit Profile</a></li>
                    <li><a href="#">Moments of meetings</a></li>
                    <li><a href="../forms/leave_app.jsp" target="profile_display">Leave Application</a></li>
                    <li><a href="#">Meet Mentor</a></li>
                    <li> <a href="#">Submit Undertaking</a></li>
                    <li> <a href="#">Track Attendance</a></li>
                    <li><a href="#">Submission Ticket</a></li>
                </ul>
            </div>

        </div>


        <div class="col-md-9 col-sm-9 col-xs-12 no-gutters">
            <iframe name="profile_display" style="height: 900px; width: 1400px;margin-left: 0px">

            </iframe>
        </div>

    </div>
</div>



<div class="main">

</div>

</body>
</html>