<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Student Profile</title>

    <meta name="viewport" content="width=device-width,initial-state=1"/>
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
            font-size: 25px;
            color: #2196F3;
            display: block;
        }

        .sidenav a:hover {
            color: #064579;
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
            background-color: #2f28d6;


        }

        ul{
            text-decoration: none;
            font-size: 30px;
            padding-bottom: 20px;
        }

        .side_bar{
            background-color: aliceblue;
            width: 350px;
            height: 900px;
        }

        .top-nav a {
            float: right;
            color: white;
            text-align: center;
            padding: 14px 16px;
            font-size: 20px;

            text-decoration: none;
        }

        .top-nav a:hover{
            background-color: #221b94;

        }


        @media screen and (max-width: 800px) {
            .sidenav {padding-top: 15px;}
            .sidenav a {font-size: 18px;}
        }
    </style>

</head>
<body>
<div class="top-nav">
    <%
        if (session.getAttribute("stud_name")==null)
            response.sendRedirect("/index.jsp");
        String stud_name = (String)session.getAttribute("stud_name");
        String stud_prn = (String)session.getAttribute("stud_prn");%>
    <a class="active" href="LogoutServlet">LogOut</a>
    <a href="#"><%=stud_name%></a>
</div>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-3 col-sm-3 col-xs-12" >
            <div class="side_bar">
                <img src="../img/blank_profile.png" id="profile_pic" class="img">

                <ul>
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
            <iframe name="profile_display" style="height: 900px; width: 900px">

            </iframe>
        </div>

    </div>
</div>



<div class="main">

</div>

</body>
</html>