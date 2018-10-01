<%@ page import="com.pict.database.DatabaseConnection" %>
<%@ page import="static java.lang.System.out" %>
<%@ page import="java.sql.*" %>
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
    <%
        if (session.getAttribute("stud_name")==null)
            response.sendRedirect("/index.jsp");
        String stud_name = (String)session.getAttribute("stud_name");
    %>
    <a class="navbar-brand" href="#">WELCOME <%=stud_name%></a>

    <div class="collapse navbar-collapse" id="navbarColor03">
        <ul class="navbar-nav mr-auto">

            <li class="nav-item ">
                <a class="nav-link" href="/jsp/admin_index.jsp">Home </a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/jsp/admin_profile.jsp">Allot mentor to Student</a>
            </li>
            <li class="nav-item ">
                <a class="nav-link" href="/jsp/admin_studentslist.jsp">View all Students<span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item active">
                <a class="nav-link" href="/jsp/admin_mentorlist.jsp">View all Mentors</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/jsp/admin_allotmentlist.jsp">View Allotments</a>
            </li>
        </ul>
        <a class="nav-link" href="../LogoutServlet"><i class="material-icons">
            account_circle
        </i> signout</a>
    </div>

</nav>
<div class="row" style="margin-top: 100px">
    <div class="col-md-4"></div>
    <div class="col-md-4">
        <table class="table table-hover" style="width: 1200px">
            <thead>
            <tr>


                <th scope="col">Name</th>

                <th scope="col">Mentor ID</th>


            </tr>
            </thead>
            <%
                Connection databaseConnection = DatabaseConnection.getDatabaseConnection();
                Connection con;
                PreparedStatement ps = null;
                Class.forName("com.mysql.jdbc.Driver");
                try {
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mentorsys", "hello", "hello");
                } catch (SQLException e) {
                    e.printStackTrace();
                }


                PreparedStatement preparedStatement = null;

                try {
                    preparedStatement = databaseConnection.prepareStatement("select emp_id,mentorname from mentor order by mentorname");
                } catch (SQLException e) {
                    e.printStackTrace();
                }

                ResultSet rs = null;
                try {
                    rs = preparedStatement.executeQuery();
                } catch (SQLException e) {
                    e.printStackTrace();
                }

                while(rs.next())
                {
                    String fname = null;
                    try {
                        fname = rs.getString("mentorname");
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                    String emp_id= null;
                    try {
                        emp_id = rs.getString("emp_id");
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }

            %>
            <tbody>
            <tr class="table-primary">

                <td><%=fname %></td>

                <td><%=emp_id %></td>
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