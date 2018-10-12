<%--
  Created by IntelliJ IDEA.
  User: suhani
  Date: 7/10/18
  Time: 8:01 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.Writer" %>
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
    <style>
        .navbar-collapse a:hover {
            background-color: #ddd;
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

        .navbar-nav .toright {
            float: right;
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

            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink1" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="color: black">
                    Allot mentor to Student
                </a>
                <div class="dropdown-content" aria-labelledby="navbarDropdownMenuLink">
                    <a class="dropdown-item" href="/jsp/admin_allotsingle.jsp">Allot single Student</a>
                    <a class="dropdown-item" href="/jsp/admin_profile.jsp">Allot Multiple Students </a>
                </div>
            </li>

            <li class="nav-item ">
                <a class="nav-link" href="/jsp/admin_studentslist.jsp">View all Students<span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
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

<h1 align="center" style="color: black;"><em><strong>MENTOR ALLOCATION</strong></em><br><br><br><br></h1>
<form action="../AdminSingleAllotment" method="post" >
    <div class="row">
        <div class="col-md-1"></div>
        <div class="col-md-3 form">
            <div class="half">
                <div class="form-group">
                    <label>Select Name of Mentor:</label>
                    <%
                        try
                        {   Connection con;
                            PreparedStatement ps = null;
                            Class.forName("com.mysql.jdbc.Driver");
                            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mentorsys", "hello", "hello");
                            System.out.println("SL3 "+ "database successfully opened.");
                            String sql = "SELECT mentorname FROM mentor ";
                            ps = con.prepareStatement(sql);
                            ResultSet rs = ps.executeQuery();
                    %>
                    <select class="form-control" name="mentorselected">
                        <option value="" selected="selected">--SELECT--</option>
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
            </div>
        </div>


        <!-- Method can be set as POST for hiding values in URL-->
        <div class="col-md-1"></div>
        <div class="col-md-2 form">
            <label>Roll No.:</label>
            <input class="form-control" name="startingrollno" type="text" value="">
            <%
                String Startingroll=request.getParameter("startingrollno");
                System.out.println(Startingroll);
            %>
        </div>

    </div>
    <%--<input class="submit" name="submit" type="submit" value="Insert">--%>
    <br><br><br><br>
    <div class="form-group" style="text-align: center">
        <input class="submit" name="submit" type="submit" value="ALLOCATE" style="width: 300px; height: 50px; margin: 0 auto;">
    </div>
</form>
<%
    }
    catch(SQLException sqe)
    {
        System.out.println(sqe);
    }
%>


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
