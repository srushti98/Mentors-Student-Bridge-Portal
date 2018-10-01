<%@ page import="com.pict.database.DatabaseConnection" %>
<%@ page import="java.sql.*" %>
<%@ page import="static java.lang.System.out" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>new profile</title>

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
<nav class="navbar navbar-expand-lg navbar-light bg-primary">
    <a class="navbar-brand" href="#" style="color: white">Mentor-Student</a>
    <%
        if (session.getAttribute("stud_name")==null)
            response.sendRedirect("/index.jsp");
        String s_stud_name = (String)session.getAttribute("stud_name");
        String stud_mis_id = (String)session.getAttribute("stud_mis_id");

        Connection databaseConnection = DatabaseConnection.getDatabaseConnection();
        Connection con;
        PreparedStatement ps = null;
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mentorsys", "hello", "hello");


        PreparedStatement preparedStatement = null;

        preparedStatement = con.prepareStatement("select * from student where stud_name=?");
        preparedStatement.setString(1, s_stud_name);

        ResultSet rs = preparedStatement.executeQuery();
        String prn = null;
        String roll = null;
        String batch = null;
        String div = null;
        String checkimg = null;
        if (rs.next()) {
            prn = rs.getString("stud_prn");
            roll = rs.getString("stud_roll_no");
            batch = rs.getString("stud_batch");
            div = rs.getString("stud_div");
            checkimg = rs.getString("stud_img");
        }

        System.out.println(s_stud_name);
        System.out.println(prn);
        System.out.println(roll);
        System.out.println(batch);
        System.out.println(div);
        //System.out.println(checkimg);

    %>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNavDropdown">
        <ul class="navbar-nav">
            <li class="nav-item active">
                <a class="nav-link" href="student_profile.jsp" style="color: white" >Home <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink1" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="color: white">
                    Edit Profile
                </a>
                <div class="dropdown-content" aria-labelledby="navbarDropdownMenuLink">
                    <a class="dropdown-item" href="../forms1/personal_details.jsp">Personal Details</a>
                    <a class="dropdown-item" href="#">Academic Details </a>
                    <a class="dropdown-item" href="#">Parent Details</a>
                    <a class="dropdown-item" href="#">Extra Activities</a>
                </div>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdownMenuLink" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" style="color: white">
                    Submit
                </a>
                <div class="dropdown-content" aria-labelledby="navbarDropdownMenuLink">
                    <a class="dropdown-item" href="#">Leave Application</a>
                    <a class="dropdown-item" href="#">Undertaking</a>
                    <a class="dropdown-item" href="#">Minutes of Meeting</a>
                    <a class="dropdown-item" href="#">Meet Mentor</a>
                </div>
            </li>
        </ul>
        <ul class="navbar-nav toright">
            <li class="nav-item ">
                <a class="nav-link" href="/LogoutServlet" style="float: right; color: white">LogOut</a>
            </li>
            <li class="nav-item ">
                <a class="nav-link" href="student_profile.jsp" style="float: right; color: white" ><%=s_stud_name%></a>
            </li>
        </ul>
    </div>
</nav>
<div class="container-fluid">
    <div class="row">
        <div class="col-4"></div>
        <div class="col-6" >
            <div class="card" style="width: 18rem; width:700px; margin-top: 50px">
                <img class="card-img-top" src="/data:image/jpg;base64,${book.base64Image}" alt="Card image cap " style="width: 300px; height:300px; align-self: center ">
                <div class="card-body">
                    <h5 class="card-title" style="color: black">NAME : <%=s_stud_name%></h5>

                </div>
                <ul class="list-group list-group-flush" style="color: black">
                    <li class="list-group-item">Department : </li>
                    <li class="list-group-item">Year : <%=s_stud_name%></li>
                    <li class="list-group-item">Division : <%=div%></li>
                    <li class="list-group-item">Batch : <%=batch%></li>
                    <li class="list-group-item">Roll no : <%=roll%></li>
                    <li class="list-group-item">Mentor : <%=s_stud_name%></li>
                </ul>
                <div class="card-body" style="color: black">
                    <a href="#" class="card-link"></a>
                    <a href="#" class="card-link"></a>
                    <%
                        if (checkimg==null){
                            %>
                            <form action="/FileUploadServlet"  method="POST" enctype="multipart/form-data">
                        <div class="form-group" style="margin-top: 10px" >
                        <label>Upload Picture</label>
                        <input type="file" name="photo">
                        <input type="submit" class="btn-primary" value="submit">


                        </div>
                        </form>
                    <%
                        }

                    %>

                </div>
            </div>
        </div>
        <div class="col-3 "></div>

    </div>
</div>
<script type="text/javascript">
    var Msg ='<%=session.getAttribute("getAlert")%>';
    if (Msg != "null") {
        function alertName(){
            swal("Profile Updated", Msg, "success")
        }
    }
</script>
</body>
<script type="text/javascript"> window.onload = alertName; </script>

</html>


