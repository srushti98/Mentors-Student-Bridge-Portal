<%@ page import="java.sql.*" %>
<%@ page import="com.pict.database.DatabaseConnection" %>

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

    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <script src="../js/bootstrap.js"></script>
    <link rel="stylesheet" type="text/css" href="/css/loading.css"/>
    <link rel="stylesheet" type="text/css"
          href="/css/loadingbutton.css"/>



    <style>
        @import url(//netdna.bootstrapcdn.com/font-awesome/3.2.1/css/font-awesome.min.css);

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
    <%
    if (session.getAttribute("stud_name")==null)
        response.sendRedirect("/index.jsp");
    String mentor_id = (String)session.getAttribute("stud_name");
    System.out.println(mentor_id);

    Connection databaseConnection = DatabaseConnection.getDatabaseConnection();
    Connection con;
    int count = 0;
    try {
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mentorsys", "hello", "hello");
        System.out.println(count);
        PreparedStatement preparedStatement = null;
        preparedStatement = con.prepareStatement("select count(id) as ccount from student_mentor_communication where seen=0 and emp_id=?");
        preparedStatement.setString(1, mentor_id);

        ResultSet rs = preparedStatement.executeQuery();
        if (rs.next()) {
            count = rs.getInt("ccount");
            System.out.println(count);
        }
        System.out.println(count);
    }catch (ClassNotFoundException e) {
        e.printStackTrace();
    }
    catch (SQLException e) {
        e.printStackTrace();
    }
%>
<body>
<nav class="navbar navbar-expand-lg " >
    <h1 class="navbar-brand" style="color: white;" ><strong><b style="font-family: URW Chancery L, cursive ">Mentors' Portal</b> </strong></h1>


    <div class="collapse navbar-collapse" id="navbarColor03" >
        <ul class="navbar-nav mr-auto">

            <li class="nav-item ">
                <a class="nav-link" style="color: white" href="/jsp/mentor_profile.jsp"><strong><b>Home</b></strong> </a>
            </li>
            <li class="nav-item ">
                <a class="nav-link" style="color: white " href="/jsp/mentor_studentlist.jsp"><strong><b>View Students Profile</b></strong></a>
            </li>
            <li class="nav-item ">
                <a class="nav-link active" style="color: white" href="/jsp/mentor_meeting.jsp"><strong><b>Arrange a meeting</b></strong></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" style="color: white" href="/jsp/meeting_mom.jsp"><strong><b>Send MOM</b></strong></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" style="color: white" href="/jsp/mentor_showmeetings.jsp"><strong><b>Track Students Attendance</b></strong></a>
            </li>
        </ul>
        <li class='last' style="float:right"><a href='student_mentor_contact.jsp'><span><i class="fa fa-bell"></i></span><% if (count!=0) {%><span class="badge badge-danger badge-pill"><%=count%></span><%}%></a></li>
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
    <%--<form action="../arrangeMeetServlet" method="post" id="contact_form" onsubmit="myFunction()">--%>
    <form action="../arrangeMeetServlet" method="post" id="contact_form" onsubmit="this.classList.add('running');">
        <div class="name">

            <input type="text" placeholder="TITLE OF MEETING" name="name" id="name_input" required>
        </div>
        <div class="meeting_date">

            <input type="date" placeholder="DATE OF MEETING" name="meeting_date" id="date_input" required>
        </div>
        <div class="meeting_agenda">

            <input type="text" placeholder="AGENDA OF MEETING" name="meeting_agenda" id="agenda_input" required>
        </div>

        <%--<div class="submit">--%>
        <%--<div >--%>
            <%--<input type="submit" class="btn ld-ext-right" value="Send Message" id="submit" />--%>
            <%--<div class="ld ld-ball ld-bounce"></div>--%>
        <%--</div>--%>
        <button  class=" ld-ext-right submit" type="submit" value="Send Message" id="form_button" onclick="this.classList.add('running');">

            SEND MESSAGE
            <div class="ld ld-ball ld-bounce"></div>
        </button>


    </form><!-- // End form -->

</div><!-- // End #container -->


</body>
    <script type="text/javascript">
        var Msg ='<%=session.getAttribute("getAlert")%>';
        <%String Msg=(String) session.getAttribute("getAlert");
        System.out.print(Msg);%>
        if (Msg != "null") {
            function alertName(){
                swal("success",Msg,"success");
            }
        }
        <%session.setAttribute("getAlert",null);%>


    </script>

    <%--<form id="setupform" action="post">--%>
        <%--&lt;%&ndash;<div id="loading2" style="display:none;"><img src="http://article.onlinewebtool.com/wp-content/images/loading.gif" alt="" />Loading!</div>&ndash;%&gt;--%>
        <%--&lt;%&ndash;<input id="submit" value="Click!" type="submit" />&ndash;%&gt;--%>
    <%--</form>--%>
    <script type="text/javascript"> window.onload = alertName; </script>

</html>