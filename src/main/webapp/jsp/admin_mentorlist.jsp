<%@ page import="com.pict.database.DatabaseConnection" %>
<%@ page import="static java.lang.System.out" %>
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/css/bootstrap.min.css" integrity="sha384-Smlep5jCw/wG7hdkwQ/Z5nLIefveQRIY9nfy6xoR1uRYBtpZgI6339F5dgvm/e9B" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons"
          rel="stylesheet">


    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/js/bootstrap.min.js" integrity="sha384-o+RDsa0aLu++PJvFqy8fFScvbHFLtbvScb8AjopnFD+iEQ7wo/CG0xlczd+2O/em" crossorigin="anonymous"></script><title>Register!!!</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.css" rel="stylesheet" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
    <link rel="stylesheet" href="/css/viewtrail.css">

    <title>Title</title>
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
        if (session.getAttribute("stud_name")==null)
            response.sendRedirect("/index.jsp");
        String stud_name = (String)session.getAttribute("stud_name");
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
<div class="col-4"></div>
<div class="col-4" style="margin-left: 670px ;margin-top: 40px">
    <h1 style="color: #0a8cc4"> MENTORS   LIST </h1>

</div>
<div class="col-4" style="margin-left: 670px ;margin-top: 40px">

    <form action="admin_search_mentor_list.jsp">
        <input type="text" class="textbox" placeholder="Search" name="Name">
        <input title="Search" value="&#128269" type="submit" class="button">
    </form>
</div>
<div class="container" style="margin-top: 100px;margin-left: 500px">
    <table class=".table-responsive" >
        <thead>
        <tr class=".table-responsive">
            <th >Name</th>
            <th >Mentorid</th>

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
            <tbody class=".table-responsive">
            <tr class=".table-responsive">
                <td style="color: #2f28d6"><%=fname %></td>
                <td style="color: #2f28d6"><%=emp_id %></td>
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