<!DOCTYPE html>
<html lang="en">

<?php
include_once '../include/connect.php';
?>

<head>
    <meta charset="UTF-8">
    <title>Form</title>
    <meta name="viewport" content="width=device-width,initial-state=1"/>
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <script src="../js/bootstrap.js"></script>

    <style>
        .row{

            margin-top: 50px;

        }
        .card{
            margin-left: 10px;
        }

        a:hover{
            text-decoration: none;
        }

        iframe{
            width: 100%;
            height: 900px;
            margin-left: 70px;
            margin-right: 10px;
            border: none;
        }

        .top-nav{
            overflow: hidden;
            background-color: #2f28d6;


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
            .col-2, .col-6 {
                -ms-flex: 100%;
                flex: 100%;
                max-width: 100%;
            }
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
        <div class="col-2 xs-12 no-gutters">
        <a href="personal_details.jsp" target="form_display">
        <div class="card text-white bg-primary mb-3" id="card1" style="max-width: 300px">
            <div class="card-header">Part 1</div>
            <div class="card-body">
                <h5 class="card-title">Personal Details</h5>
                <p class="card-text">Fill out your personal details like add ,blood group,etc</p>
            </div>
        </div>
        </a>

        <a href="Parent_details.jsp" target="form_display">
        <div class="card text-white bg-success mb-3" id="card2" style="max-width: 300px">
            <div class="card-header">Part 3</div>
            <div class="card-body">
                <h5 class="card-title">Parent Details</h5>
                <p class="card-text">Fill out parents' details ,name, education, occupation, etc.</p>
            </div>
        </div>
        </a>

    </div>


        <div class="col-2 xs-12 no-gutters">
            <a href="academic_details.jsp" target="form_display">
        <div class="card text-white bg-danger mb-3" id="card3" style="max-width: 300px">
            <div class="card-header">Part 2</div>
            <div class="card-body">
                <h5 class="card-title">Academic Details</h5>
                <p class="card-text">Fill out academic details ,SSC details, HSC details, CET score, etc.</p>
            </div>
        </div>
        </a>

            <a href="extra.jsp" target="form_display">
        <div class="card text-white bg-warning mb-3" id="card4" style="max-width: 300px">
            <div class="card-header">Part 4</div>
            <div class="card-body">
                <h5 class="card-title">Extra Details</h5>
                <p class="card-text">About your hobbies, co-curricular activities, career plans, etc.</p>
            </div>
        </div>
            </a>
        </div>


        <div class="col-6 xs-12 no-gutters">
            <iframe name="form_display" src="personal_details.jsp">
            </iframe>
        </div>
    </div>
</div>


</div>


</body>
</html>