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
    </style>
</head>
<body>


<%
    if (session.getAttribute("mentor_id")==null)
        response.sendRedirect("/index.jsp");
%>


<nav class="navbar navbar-expand-lg " >
    <h1 class="navbar-brand"  style="color: white"><strong><b style="font-family: URW Chancery L, cursive ">Mentors' Portal</b></strong></h1>


    <div class="collapse navbar-collapse" id="navbarColor03" >
        <ul class="navbar-nav mr-auto">

            <li class="nav-item ">
                <a class="nav-link " style="color: white" href="/jsp/mentor_profile.jsp"><strong><b>Home</b></strong> </a>
            </li>
            <li class="nav-item ">
                <a class="nav-link" style="color: white " href="/jsp/mentor_studentlist.jsp"><strong><b>View Students Profile</b></strong></a>
            </li>
            <li class="nav-item ">
                <a class="nav-link" style="color: white" href="/jsp/mentor_meeting.jsp"><strong><b>Arrange a meeting</b></strong></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" style="color: white" href="/jsp/meeting_mom.jsp"><strong><b>Send MOM</b></strong></a>
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
<div class="col-4"></div>
<div class="col-4" style="margin-left: 670px ;margin-top: 40px">
    <h1 style="color: #0a8cc4"> LEAVES APPLICATIONS </h1>
</div>
<div class="container">
    <table class=".table-responsive" >
        <thead>
        <tr class=".table-responsive">
            <th >Sr. No</th>
            <th >Title</th>
            <th >Description</th>
            <th >Date</th>
        </tr>
        </thead>

        <%
            try
            {   Connection con;
                PreparedStatement ps = null;
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mentorsys", "hello", "hello");
                System.out.println("SL3 "+ "database successfully opened.");
                String menid = (String)session.getAttribute("mentor_id");
                String s_stud_mis_id = (String)request.getParameter("id");
                //String menid="P123456787";
                //System.out.println(menid);
                String sql = "select * from activity_list where  mentor_id=? and activity_name='mom' order by activity_date desc ;";
                int count =1;
                ps = con.prepareStatement(sql);
                ps.setString(1,menid);
                ResultSet rs = ps.executeQuery();
                while (rs.next())
                {
                    System.out.print("hello");
                    String act_id = rs.getString("activity_id");
                    String act_desc = rs.getString("activity_content");
                    String act_date = rs.getString("activity_date");
                    String act_title = rs.getString("activity_title");

        %>
        <tbody class=".table-responsive">
        <tr class=".table-responsive">
            <td style="color: #2f28d6"><%=act_id%></td>
            <td style="color: #2f28d6"><%=act_title%></td>
            <td style="color: #2f28d6"><%=act_desc%></td>
            <td style="color: #2f28d6"><%=act_date%></td>
        </tr>

        <%
                }
            }
            catch(SQLException sqe)
            {
                System.out.println(sqe);
            }
        %>
        </tr>
        </tbody>
    </table>
</div>
</body>
</html>
