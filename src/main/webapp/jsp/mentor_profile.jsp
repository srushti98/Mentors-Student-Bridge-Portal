<%@ page import="java.sql.*" %>
<%@ page import="java.io.Writer" %>
<%@ page import="com.pict.database.DatabaseConnection" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Drop Downlist</title>

    <meta name="viewport" content="width=device-width,initial-state=1"/>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.min.css">
    <script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.css" rel="stylesheet" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
    <link rel="stylesheet" href="/css/mentorprofile.css">

    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <script src="../js/bootstrap.js"></script>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
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
        body{
            background-image: url("/img/mentorback.jpg");
            background-repeat: no-repeat;
            background-position: center;
            background-size: cover;
        }
    </style>
</head>

<%
    if (session.getAttribute("mentor_id")==null)
        response.sendRedirect("/index.jsp");
    String mentor_id = (String)session.getAttribute("mentor_id");
    System.out.println(mentor_id);


    Connection databaseConnection = DatabaseConnection.getDatabaseConnection();
    Connection con;
    int count = 0;
    int tempcount=0;
    try {
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mentorsys", "hello", "hello");
        System.out.println(count);
        PreparedStatement preparedStatement = null;
        Statement preparedStatement1 = null;

        preparedStatement = con.prepareStatement("select count(id) as ccount from student_mentor_communication where seen=0 and emp_id=?");
        preparedStatement.setString(1, mentor_id);

        preparedStatement1 = con.createStatement();
        ResultSet rs1=preparedStatement1.executeQuery("select count(stud_mis_id) as tempcount from studentmentorrel where emp_id='"+mentor_id+"'");


        ResultSet rs = preparedStatement.executeQuery();

        if (rs1.next()) {
            tempcount = rs1.getInt("tempcount");
            System.out.println(count);
        }
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
    <h1 class="navbar-brand"  style="color: white"><strong><b style="font-family: URW Chancery L, cursive ">Mentors' Portal</b></strong></h1>


    <div class="collapse navbar-collapse" id="navbarColor03" >
        <ul class="navbar-nav mr-auto">

            <li class="nav-item ">
                <a class="nav-link  active " style="color: white" href="/jsp/mentor_profile.jsp"><strong><b>Home</b></strong> </a>
            </li>
            <li class="nav-item ">
                <a class="nav-link" style="color: white " href="/jsp/mentor_studentlist.jsp"><strong><b>View Students Profile</b></strong></a>
            </li>
            <%
                if(tempcount==0)
                {
            %>
            <li class="nav-item ">
                <a class="nav-link" style="color: white" onclick="alertallot()"><strong><b>Arrange a meeting</b></strong></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" style="color: white"  onclick="alertallot()"><strong><b>Send MOM</b></strong></a>
            </li>
            <%
                session.setAttribute("allotalert","You dont have any student under you");
                System.out.println(tempcount);
            %>


            <%
            }

            else
            {
            %>

            <li class="nav-item ">
                <a class="nav-link" style="color: white" href="/jsp/mentor_meeting.jsp"><strong><b>Arrange a meeting</b></strong></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" style="color: white" href="/jsp/meeting_mom.jsp"><strong><b>Send MOM</b></strong></a>
            </li>

            <%
                }
            %>

            <li class="nav-item">
                <a class="nav-link" style="color: white" href="/jsp/mentor_showmeetings.jsp"><strong><b>Track Students Attendance</b></strong></a>
            </li>
        </ul>
        <li class='last' style="float:right"><a href='student_mentor_contact.jsp'><span><i class="fa fa-bell"></i></span><% if (count!=0) {%><span class="badge badge-danger badge-pill"><%=count%></span><%}%></a></li>
        <a class="nav-link" href="../LogoutServlet" style="color: white"><i class="material-icons-account_circle">
        </i> <strong><b>signout</b></strong></a>
    </div>

</nav>

<div style="margin-top: 200px;margin-left: 450px;max-width: 1200px;height: 400px;background-color: rgba(0, 0, 0, 0.7);">
    <h1 style="color: white;padding-left: 300px;padding-top: 150px">Welcome to Mentor Portal</h1>

</div>
</body>
<script type="text/javascript">
    var Msg ='<%=session.getAttribute("allotalert")%>';
    if (Msg != "null") {
        function alertallot(){
            swal("error",Msg,"error");
        }

        <%session.setAttribute("getAlert",null);%>
    }
</script>


</html>




