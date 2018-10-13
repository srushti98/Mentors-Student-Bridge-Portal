<%@ page import="com.pict.database.DatabaseConnection" %>
<%@ page import="static java.lang.System.out" %>
<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/css/bootstrap.min.css" integrity="sha384-Smlep5jCw/wG7hdkwQ/Z5nLIefveQRIY9nfy6xoR1uRYBtpZgI6339F5dgvm/e9B" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons"
          rel="stylesheet">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/js/bootstrap.min.js" integrity="sha384-o+RDsa0aLu++PJvFqy8fFScvbHFLtbvScb8AjopnFD+iEQ7wo/CG0xlczd+2O/em" crossorigin="anonymous"></script><title>Register!!!</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.css" rel="stylesheet" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
    <link rel="stylesheet" href="/css/trailallocate.css">

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

<body >
<div id="container" style="padding: 2px;margin-top: 90px">
    <h1 style="margin-top: 50px">&bull; Allot mentor to student &bull;</h1>
    <div class="underline">
    </div>
    <div class="icon_wrapper">

    </div>
    <form action="../AdminServlet" method="post" id="contact_form">
        <div class="name">

            <input type="text" placeholder="SElect Starting rollno" name="startingrollno"  required>

        </div>
        <div class="endroll">

            <input type="text" placeholder="SElect Ending rollno" name="endingrollno"  required>
        </div>
        <div class="subject">
            <%
                try
                {

                    Connection con;
                    PreparedStatement ps = null;
                    Class.forName("com.mysql.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mentorsys", "hello", "hello");
                    System.out.println("SL3 "+ "database successfully opened.");
                    String sql = "SELECT mentorname FROM mentor where mentor_flag=0";
                    ps = con.prepareStatement(sql);
                    ResultSet rs = ps.executeQuery();
            %>
            <select placeholder="SELECT Mentor" name="mentorselected" id="subject_input" required>
                <option value="" selected="selected">--SELECT MENTOR--</option>
                <%
                    while(rs.next())
                    {
                        String fname = rs.getString("mentorname");
                %>
                <option value="<%=fname %>"><%=fname %></option>
                <%
                    }
                %>

            </select>

        </div>

        <div class="submit">
            <input type="submit" value="ALLOCATE" id="form_button" />
        </div>
    </form><!-- // End form -->
    <%
        }
        catch(SQLException sqe)
        {
            System.out.println(sqe);
        }
    %>
</div><!-- // End #container -->






<%--<h1 align="center" style="color: black;"><em><strong>MENTOR ALLOCATION</strong></em><br><br><br><br></h1>--%>
<%--<form action="../AdminServlet" method="post" >--%>
    <%--<div class="row">--%>
        <%--<div class="col-md-1"></div>--%>
        <%--<div class="col-md-3 form">--%>
            <%--<div class="half">--%>
                <%--<div class="form-group">--%>
                    <%--<label>Select Name of Mentor:</label>--%>
                    <%--<%--%>
                        <%--try--%>
                        <%--{   Connection con;--%>
                            <%--PreparedStatement ps = null;--%>
                            <%--Class.forName("com.mysql.jdbc.Driver");--%>
                            <%--con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mentorsys", "hello", "hello");--%>
                            <%--System.out.println("SL3 "+ "database successfully opened.");--%>
                            <%--String sql = "SELECT mentorname FROM mentor where mentor_flag=0";--%>
                            <%--ps = con.prepareStatement(sql);--%>
                            <%--ResultSet rs = ps.executeQuery();--%>
                    <%--%>--%>
                    <%--
                        <%--<option value="<%=fname %>"><%=fname %></option>--%>
                        <%--<%--%>
                            <%--}--%>
                        <%--%><select class="form-control" name="mentorselected">&ndash;%&gt;--%>
    <%--<option value="" selected="selected">--SELECT--</option>--%>
    <%--<%--%>
    <%--while(rs.next())--%>
    <%--{--%>
    <%--String fname = rs.getString("mentorname");--%>
    <%--%>--%>
                    <%--</select>--%>
                <%--</div>--%>
            <%--</div>--%>
        <%--</div>--%>


        <%--<!-- Method can be set as POST for hiding values in URL-->--%>
        <%--<div class="col-md-1"></div>--%>
        <%--<div class="col-md-2 form">--%>
            <%--<label>Starting roll_no:</label>--%>
            <%--<input class="form-control" name="startingrollno" type="text" value="">--%>

        <%--</div>--%>
        <%--<div class="col-md-1"></div>--%>
        <%--<div class="col-md-2 form">--%>
            <%--<label>Ending roll_no:</label>--%>
            <%--<input class="form-control" name="endingrollno" type="text" value="">--%>
            <%--<%--%>
                <%--String Startingroll=request.getParameter("startingrollno");--%>
                <%--System.out.println(Startingroll);--%>
            <%--%>--%>

        <%--</div>--%>



    <%--</div>--%>
    <%--&lt;%&ndash;<input class="submit" name="submit" type="submit" value="Insert">&ndash;%&gt;--%>
    <%--<br><br><br><br>--%>
    <%--<div class="form-group" style="text-align: center">--%>
        <%--<input class="submit" name="submit" type="submit" value="ALLOCATE" style="width: 300px; height: 50px; margin: 0 auto;">--%>
    <%--</div>--%>
<%--</form>--%>


<script type="text/javascript">
    var Msg ='<%=session.getAttribute("getAlert")%>';
    if (Msg != "null") {
        function alertName(){
            swal("error",Msg,"error");
        }
        Msg=null;
        <%session.setAttribute("getAlert",null);%>
    }
</script>

</body>

<script type="text/javascript"> window.onload = alertName; </script>

</html>














