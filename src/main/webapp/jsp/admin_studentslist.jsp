<%@ page import="com.pict.database.DatabaseConnection" %>
<%@ page import="java.sql.Connection" %>
<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="static java.lang.System.out" %>
<%@ page import="java.sql.DriverManager" %>
<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/css/bootstrap.min.css" integrity="sha384-Smlep5jCw/wG7hdkwQ/Z5nLIefveQRIY9nfy6xoR1uRYBtpZgI6339F5dgvm/e9B" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons"
          rel="stylesheet">
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/js/bootstrap.min.js" integrity="sha384-o+RDsa0aLu++PJvFqy8fFScvbHFLtbvScb8AjopnFD+iEQ7wo/CG0xlczd+2O/em" crossorigin="anonymous"></script><title>Register!!!</title>
    <style>
        body {
            font-family: "Lato", sans-serif;
        }

        .sidenav {
            height: 100%;
            width: 0;
            position: fixed;
            z-index: 1;
            top: 0;
            left: 0;
            background-color: #111;
            overflow-x: hidden;
            transition: 0.5s;
            padding-top: 60px;
        }

        .sidenav a {
            padding: 8px 8px 8px 32px;
            text-decoration: none;
            font-size: 25px;
            color: #818181;
            display: block;
            transition: 0.3s;
        }

        .sidenav a:hover {
            color: #f1f1f1;
        }

        .sidenav .closebtn {
            position: absolute;
            top: 0;
            right: 25px;
            font-size: 36px;
            margin-left: 50px;
        }

        @font-face {
            font-family: 'Material Icons';
            font-style: normal;
            font-weight: 400;
            src: url(https://example.com/MaterialIcons-Regular.eot); /* For IE6-8 */
            src: local('Material Icons'),
            local('MaterialIcons-Regular'),
            url(https://example.com/MaterialIcons-Regular.woff2) format('woff2'),
            url(https://example.com/MaterialIcons-Regular.woff) format('woff'),
            url(https://example.com/MaterialIcons-Regular.ttf) format('truetype');
        }

        .material-icons {
            font-family: 'Material Icons';
            font-weight: normal;
            font-style: normal;
            font-size: 24px;  /* Preferred icon size */
            /*display: inline-block;*/

            text-transform: none;
            letter-spacing: normal;
            word-wrap: normal;
            white-space: nowrap;
            direction: ltr;

            /* Support for all WebKit browsers. */
            -webkit-font-smoothing: antialiased;
            /* Support for Safari and Chrome. */
            text-rendering: optimizeLegibility;

            /* Support for Firefox. */
            -moz-osx-font-smoothing: grayscale;

            /* Support for IE. */
            font-feature-settings: 'liga';
        }


        @media screen and (max-height: 450px) {
            .sidenav {padding-top: 15px;}
            .sidenav a {font-size: 18px;}
        }

    </style>

</head>
<body>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="#"><span style="font-size:30px;cursor:pointer" onclick="openNav()">&#9776;</span></a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarColor03" aria-controls="navbarColor03" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarColor03">
        <ul class="navbar-nav mr-auto">

            <li class="nav-item ">
                <a class="nav-link" href="/jsp/admin_index.jsp">Home </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/jsp/admin_profile.jsp">Allot mentor to Student</a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="/jsp/admin_studentslist.jsp">View all Students<span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/jsp/admin_mentorlist.jsp">View all Mentors</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/jsp/admin_allotmentlist.jsp">View Allotments</a>
            </li>
        </ul>
        <a class="nav-link" href="#"><i class="material-icons">
            account_circle
        </i> signout</a>
    </div>

</nav>
<div class="row" style="margin-top: 100px">
    <div class="col-md-3"></div>
    <div class="col-md-6">
    <table class="table table-hover" style="width: 1200px">
        <thead>
        <tr>
            <th scope="col">rollno</th>

            <th scope="col">Name</th>
            <th scope="col">Student_Id</th>

        </tr>
        </thead>
        <%
            Connection databaseConnection = DatabaseConnection.getDatabaseConnection();
            Connection con;
            PreparedStatement ps = null;
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mentor_sys", "hello", "hello");


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
        <tbody>
        <tr class="table-primary">
            <td><%=frollint %></td>
            <td><%=fname %></td>

            <td><%=mis_id %></td>
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