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

        *, *:before, *:after{
            box-sizing:border-box;
        }
        body{
            font-family: 'Lato', sans-serif;
        ;
        }
        div.foo{
            width: 90%;
            margin: 0 auto;
            text-align: center;
        }
        .letter{
            display: inline-block;
            font-weight: 900;
            font-size: 4em;
            margin: 0.2em;
            position: relative;
            color: #0b2e13;
            transform-style: preserve-3d;
            perspective: 400;
            z-index: 1;
        }
        .letter:before, .letter:after{
            position:absolute;
            content: attr(data-letter);
            transform-origin: top left;
            top:0;
            left:0;
        }
        .letter, .letter:before, .letter:after{
            transition: all 0.3s ease-in-out;
        }
        .letter:before{
            color: #0b2e13;
            text-shadow:
                    -1px 0px 1px rgba(255,255,255,.8),
                    1px 0px 1px rgba(0,0,0,.8);
            z-index: 3;
            transform:
                    rotateX(0deg)
                    rotateY(-15deg)
                    rotateZ(0deg);
        }
        .letter:after{
            color: rgba(0,0,0,.11);
            z-index:2;
            transform:
                    scale(1.08,1)
                    rotateX(0deg)
                    rotateY(0deg)
                    rotateZ(0deg)
                    skew(0deg,1deg);
        }
        .letter:hover:before{
            color: #fafafa;
            transform:
                    rotateX(0deg)
                    rotateY(-40deg)
                    rotateZ(0deg);
        }
        .letter:hover:after{
            transform:
                    scale(1.08,1)
                    rotateX(0deg)
                    rotateY(40deg)
                    rotateZ(0deg)
                    skew(0deg,22deg);
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
                    <a class="dropdown-item" href="/jsp/admin_changementor.jsp">Change mentor of student </a>
                </div>
            </li>
            <li class="nav-item">
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
    <h1 style="color: #0a8cc4"> ALLOTMENTS   LIST </h1>
</div>
<div class="container">
    <table class=".table-responsive" >
        <thead>
        <tr class=".table-responsive">
            <th >Mentor Name</th>
            <th >Student Name</th>
            <th >Student Roll No.</th>
            <th><form action="admin_search_allotment_list.jsp">
                <input type="text" class="textbox" placeholder="Search" name="Name">
                <input title="Search" value="&#128269" type="submit" class="button">
            </form></th>
        </tr>
        </thead>

                <%
                try
                {   Connection con;
                    PreparedStatement ps = null;
                    Class.forName("com.mysql.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mentorsys", "hello", "hello");
                    System.out.println("SL3 "+ "database successfully opened.");
                    String sql = "select s.stud_name , m.mentorname, s.stud_roll_no from student s, mentor m, studentmentorrel sm where s.stud_mis_id=sm.stud_mis_id and m.emp_id=sm.emp_id and sm.changeflag=? order by s.stud_roll_no ;";
                    ps = con.prepareStatement(sql);
                    ps.setInt(1,0);
                    ResultSet rs = ps.executeQuery();
                    String m1="   ";
                    while (rs.next())
                        {
                            String mentor_name=rs.getString("m.mentorname");
                            String student_name=rs.getString("s.stud_name");
                            int student_roll_no=rs.getInt("s.stud_roll_no");
                %>
            <tbody class=".table-responsive">
                <%
                    if(!m1.equals(mentor_name))
                    {
                        m1=mentor_name;
                %>
                        <td style="color: #2f28d6"><%=mentor_name%></td>
                <%
                    }
                    else
                    {
                %>
                <td>    </td>
                <%
                    }
                %>
                <td style="color: #2f28d6"><%=student_name%></td>
                <td style="color: #2f28d6"><%=student_roll_no%></td>
                <%
                        }
                        }
                        catch(SQLException sqe)
                        {
                            System.out.println(sqe);
                        }
                %>
            </tbody>
        </table>
    </div>
</div>
</body>
</html>
