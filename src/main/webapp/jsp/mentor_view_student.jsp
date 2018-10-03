<%--
  Created by IntelliJ IDEA.
  User: suhani
  Date: 3/10/18
  Time: 3:52 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.pict.database.DatabaseConnection" %>
<%@ page import="java.sql.*" %>
<%@ page import="static java.lang.System.out" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Student_Profile</title>

    <meta name="viewport" content="width=device-width,initial-scale=1.0"/>
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <script src="../js/bootstrap.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.css" rel="stylesheet" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>

    <style>
        .navbar-collapse a:hover {
            background-color: #2f28d6;
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
    <%
        if (session.getAttribute("stud_name")==null)
            response.sendRedirect("/index.jsp");
        String stud_mis_id = (String)request.getParameter("id");
        Connection databaseConnection = DatabaseConnection.getDatabaseConnection();
        Connection con;
        PreparedStatement ps = null;
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mentorsys", "hello", "hello");
        PreparedStatement preparedStatement = null;
        preparedStatement = con.prepareStatement("select * from student where stud_mis_id=?");
        preparedStatement.setString(1, stud_mis_id);
        ResultSet rs = preparedStatement.executeQuery();
        String name = null;
        String prn = null;
        String roll = null;
        String batch = null;
        String div = null;
        String checkimg = null;
        if (rs.next()) {
            name = rs.getString("stud_name") ;
            prn = rs.getString("stud_prn");
            roll = rs.getString("stud_roll_no");
            batch = rs.getString("stud_batch");
            div = rs.getString("stud_div");
            checkimg = rs.getString("stud_img");
        }
        System.out.println(stud_mis_id);
        System.out.println(prn);
        System.out.println(roll);
        System.out.println(batch);
        System.out.println(div);
    %>
<div class="container-fluid">
    <div class="row">
        <div class="col-4"></div>
        <div class="col-6" >
            <div class="card" style="width: 18rem; width:700px; margin-top: 50px">
                <img class="card-img-top" src="/data:image/jpg;base64,${pro.base64Image}" alt="Card image cap " style="width: 300px; height:300px; align-self: center ">
                <div class="card-body">
                    <h5 class="card-title" style="color: black">NAME : <%=name%></h5>

                </div>
                <ul class="list-group list-group-flush" style="color: black">
                    <li class="list-group-item">Department : </li>
                    <li class="list-group-item">PRN : <%=prn%></li>
                    <li class="list-group-item">Year : <%=prn%></li>
                    <li class="list-group-item">Division : <%=div%></li>
                    <li class="list-group-item">Batch : <%=batch%></li>
                    <li class="list-group-item">Roll no : <%=roll%></li>
                </ul>
                <div class="card-body" style="color: black">
                    <a href="#" class="card-link"></a>
                    <a href="#" class="card-link"></a>
                </div>
            </div>
        </div>
        <div class="col-3 "></div>

    </div>
</div>
</body>
</html>
