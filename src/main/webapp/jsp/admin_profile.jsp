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
            <li class="nav-item active">
                <a class="nav-link" href="/jsp/admin_profile.jsp">Allot mentor to Student</a>
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
        <a class="nav-link" href="#"><i class="material-icons">
            account_circle
        </i> signout</a>
    </div>

</nav>

<h1 align="center" style="color: black;"><em><strong>MENTOR ALLOCATION</strong></em><br><br><br><br></h1>
<form action="../AdminServlet" method="post" >
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
                            String sql = "SELECT mentorname FROM mentor where mentor_flag=0";
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
            <label>Starting roll_no:</label>
            <input class="form-control" name="startingrollno" type="text" value="">

        </div>
        <div class="col-md-1"></div>
        <div class="col-md-2 form">
            <label>Ending roll_no:</label>
            <input class="form-control" name="endingrollno" type="text" value="">
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
    }
</script>

</body>

<script type="text/javascript"> window.onload = alertName; </script>

</html>

