<%@ page import="java.sql.*" %>
<html>

<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/css/bootstrap.min.css" integrity="sha384-Smlep5jCw/wG7hdkwQ/Z5nLIefveQRIY9nfy6xoR1uRYBtpZgI6339F5dgvm/e9B" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons"
          rel="stylesheet">


    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/js/bootstrap.min.js" integrity="sha384-o+RDsa0aLu++PJvFqy8fFScvbHFLtbvScb8AjopnFD+iEQ7wo/CG0xlczd+2O/em" crossorigin="anonymous"></script><title>Register!!!</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.css" rel="stylesheet" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
    <link rel="stylesheet" href="/css/trailallocate.css">
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


<body >
<nav class="navbar navbar-expand-lg " >
    <h1 class="navbar-brand"  style="color: white"><strong><b style="font-family: URW Chancery L, cursive ">Mentors' Portal</b></strong></h1>


    <div class="collapse navbar-collapse" id="navbarColor03" >
        <ul class="navbar-nav mr-auto">

            <li class="nav-item ">
                <a class="nav-link  " style="color: white" href="/jsp/mentor_profile.jsp"><strong><b>Home</b></strong> </a>
            </li>
            <li class="nav-item ">
                <a class="nav-link" style="color: white " href="/jsp/mentor_studentlist.jsp"><strong><b>View Students Profile</b></strong></a>
            </li>
            <li class="nav-item ">
                <a class="nav-link active" style="color: white" href="/jsp/mentor_meeting.jsp"><strong><b>Arrange a meeting</b></strong></a>
            </li>
            <li class="nav-item">
                <a class="nav-link " style="color: white" href="/jsp/meeting_mom.jsp"><strong><b>Send MOM</b></strong></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" style="color: white" href="/jsp/mentor_showmeetings.jsp"><strong><b>Track Students Attendance</b></strong></a>
            </li>
        </ul>
        <a class="nav-link" href="../LogoutServlet" style="color: white"><i class="material-icons">
            account_circle
        </i> <strong><b>signout</b></strong></a>
    </div>

</nav>
<div id="container" style="padding: 2px;margin-top: 90px">
    <h1 style="margin-top: 50px">&bull; Enter Details of Meeting &bull;</h1>
    <div class="underline">
    </div>
    <div class="icon_wrapper">

    </div>
    <form action="#" method="post" id="contact_form">
        <div class="name">

            <input type="text" placeholder="TITLE OF MEETING" name="name" id="name_input" required>
        </div>
        <div class="meeting_date">

            <input type="date" placeholder="DATE OF MEETING" name="meeting_date" id="date_input" required>
        </div>
        <div class="meeting_agenda">

            <input type="text" placeholder="AGENDA OF MEETING" name="meeting_agenda" id="agenda_input" required>
        </div>

        <div class="submit">
            <input type="submit" value="Send Message" id="form_button" />
        </div>
    </form><!-- // End form -->

</div><!-- // End #container -->


</body>
<%--<div class="container">--%>

<%--<div class="row"><div class="col-md-4"></div>--%>
<%--<div class="col-md-4" >--%>

<%--<form style="margin-top: 500px;border: solid; border-color: #1b1e21; padding: 10px">--%>

<%--<div class="form-group">--%>
<%--<label for="exampleInputEmail1">Email address</label>--%>
<%--<input class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email" type="email">--%>
<%--</div>--%>

<%--<div class="form-group">--%>
<%--<label for="exampleSelect1">Example select</label>--%>
<%--<select class="form-control" id="exampleSelect1">--%>
<%--<option>1</option>--%>
<%--<option>2</option>--%>
<%--<option>3</option>--%>
<%--<option>4</option>--%>
<%--<option>5</option>--%>
<%--</select>--%>
<%--</div>--%>




<%--<button type="submit" class="btn btn-primary">Submit</button>--%>

<%--</form>--%>
<%--</div>--%>
<%--<div class="col-md-4"></div>--%>
<%--</div>--%>

<%--</div>--%>



<%--</div>--%>
</html>