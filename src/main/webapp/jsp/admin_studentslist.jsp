<%@ page import="com.pict.database.DatabaseConnection" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="static java.lang.System.out" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/css/bootstrap.min.css" integrity="sha384-Smlep5jCw/wG7hdkwQ/Z5nLIefveQRIY9nfy6xoR1uRYBtpZgI6339F5dgvm/e9B" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons"
          rel="stylesheet">

    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/js/bootstrap.min.js" integrity="sha384-o+RDsa0aLu++PJvFqy8fFScvbHFLtbvScb8AjopnFD+iEQ7wo/CG0xlczd+2O/em" crossorigin="anonymous"></script><title>Register!!!</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.css" rel="stylesheet" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
    <link rel="stylesheet" href="/css/viewtrail.css">

    <title>Title</title>
    <style>
        @import url(https://fonts.googleapis.com/css?family=Open+Sans);

        .navbar,.navbar-expand-lg{
            background: linear-gradient(to right, #25c481, #25b7c4);
        }
        .active{
            background-color: #2699c4;
        }
        .navbar-expand-lg a:hover {
            background-color: #0d8ec4;
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

        body{
            background: #f2f2f2;
            font-family: 'Open Sans', sans-serif;
        }
        form {
            outline: 0;
            float: left;
            -webkit-box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12), 0 1px 2px rgba(0, 0, 0, 0.24);
            box-shadow: 0 1px 3px rgba(0, 0, 0, 0.12), 0 1px 2px rgba(0, 0, 0, 0.24);
            -webkit-border-radius: 4px;
            border-radius: 4px;
        }

        form > .textbox {
            outline: 0;
            height: 42px;
            width: 244px;
            line-height: 42px;
            padding: 0 16px;
            background-color: rgba(255, 255, 255, 0.8);
            color: #212121;
            border: 0;
            float: left;
            -webkit-border-radius: 4px 0 0 4px;
            border-radius: 4px 0 0 4px;
        }

        form > .textbox:focus {
            outline: 0;
            background-color: #FFF;
        }

        form > .button {
            outline: 0;
            background: none;
            background-color: rgba(38, 50, 56, 0.8);
            float: left;
            height: 42px;
            width: 42px;
            text-align: center;
            line-height: 42px;
            border: 0;
            color: #FFF;
            font: normal normal normal 14px/1 FontAwesome;
            font-size: 16px;
            text-rendering: auto;
            text-shadow: 0 1px 1px rgba(0, 0, 0, 0.2);
            -webkit-transition: background-color .4s ease;
            transition: background-color .4s ease;
            -webkit-border-radius: 0 4px 4px 0;
            border-radius: 0 4px 4px 0;
        }

        form > .button:hover {
            background-color: rgba(0, 150, 136, 0.8);
        }

    </style>
</head>

<body>
<nav class="navbar navbar-expand-lg">
    <%
        if (session.getAttribute("admin_id")==null)
            response.sendRedirect("/index.jsp");
        String stud_name = (String)session.getAttribute("admin_id");
    %>
    <%--<a class="navbar-brand" href="#">WELCOME <%=stud_name%></a>--%>
    <h1 class="navbar-brand"  style="color: white"><strong><b style="font-family: URW Chancery L, cursive ">Admin' Portal</b></strong></h1>
    <div class="collapse navbar-collapse" id="navbarColor03" >
        <ul class="navbar-nav mr-auto">

            <li class="nav-item ">
                <a class="nav-link" style="color: white" href="/jsp/admin_index.jsp"><strong><b>Home</b></strong> </a>
            </li>
            <%--<li class="nav-item">--%>
            <%--<a class="nav-link" href="/jsp/admin_profile.jsp">Allot mentor to Student</a>--%>
            <%--</li>--%>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" style="color: white" href="#" id="navbarDropdownMenuLink1" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="color: black">
                    <strong><b>Allot mentor to Student</b></strong>
                </a>
                <div class="dropdown-content" aria-labelledby="navbarDropdownMenuLink">
                    <a class="dropdown-item" href="/jsp/admin_allotsingle.jsp">Allot single Student</a>
                    <a class="dropdown-item" href="/jsp/admin_profile.jsp">Allot Multiple Students </a>
                    <a class="dropdown-item" href="/jsp/admin_changementor.jsp">Change mentor of student </a>
                </div>
            </li>
            <li class="nav-item ">
                <a class="nav-link" style="color: white" href="/jsp/admin_studentslist.jsp"><strong><b>View all Students</b></strong><span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" style="color: white" href="/jsp/admin_mentorlist.jsp"><strong><b>View all Mentors</b></strong></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" style="color: white" href="/jsp/admin_allotmentlist.jsp"><strong><b>View Allotments</b></strong></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" style="color: white" href="/jsp/admin_excelsheet.jsp"><strong><b>Import Excelsheets</b></strong></a>
            </li>
        </ul>
        <a class="nav-link" href="../LogoutServlet" style="color: white"><i class="material-icons">
            account_circle
        </i> <strong><b>signout</b></strong></a>
    </div>

</nav>
<%--<form action="admin_student_search_list.jsp">--%>
    <%--<input type="text" class="textbox" placeholder="Search" name="Name">--%>
    <%--<input title="Search" value="" type="submit" class="button">--%>
<%--</form>--%>
<div class="col-4" style="margin-left: 670px ;margin-top: 40px">
    <h1 style="color: #0a8cc4"> STUDENTS   LIST </h1>
</div>
<div class="col-4" style="margin-left: 670px ;margin-top: 40px">
    <form action="admin_student_search_list.jsp">
        <input type="text" class="textbox" placeholder="Search" name="Name">
        <input title="Search" value="&#128269" type="submit" class="button">
    </form>

</div>
<div class="container" style="margin-top: 100px;margin-left: 500px">
    <table  style="margin-top:100px; margin-left:10px;">
        <thead>
        <tr >
            <th >ROllno</th>
            <th >Name</th>
            <th >MISID</th>

        </tr>
        </thead>

        <%
            Connection databaseConnection = DatabaseConnection.getDatabaseConnection();
            Connection con;
            PreparedStatement ps = null;
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mentorsys", "root", "root@123");


            PreparedStatement preparedStatement = null;

            preparedStatement = con.prepareStatement("select stud_mis_id,stud_name,stud_roll_no from student order by stud_roll_no");

            ResultSet rs = preparedStatement.executeQuery();

            while(rs.next())
            {
                String fname = rs.getString("stud_name");
                String froll=rs.getString("stud_roll_no");
                int frollint=Integer.parseInt(froll);
                String mis_id=rs.getString("stud_mis_id");

        %>
        <tbody class=".table-responsive">
        <tr class=".table-responsive">
            <td style="color: #2f28d6"><%=frollint %></td>
            <td style="color: #2f28d6"><%=fname %></td>

            <td style="color: #2f28d6"><%=mis_id %></td>
        </tr>
        <%
            }
        %>




        </tbody>
    </table>


</div>
</div>





</body>
</html>