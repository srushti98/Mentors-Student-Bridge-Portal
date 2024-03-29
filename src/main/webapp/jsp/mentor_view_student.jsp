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
<%@ page import="java.util.Base64" %>
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
    <link rel="stylesheet" href="/css/one_profile.css">

    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <script src="../js/bootstrap.js"></script>

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
    String mentor_id = (String)session.getAttribute("mentor_id");
    String stud_mis_id = (String)request.getParameter("id");
    Connection databaseConnection = DatabaseConnection.getDatabaseConnection();
    Connection con;
    PreparedStatement ps = null;
    Class.forName("com.mysql.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mentorsys", "hello", "hello");
    int ccount = 0;
    try {
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mentorsys", "hello", "hello");
        System.out.println(ccount);
        PreparedStatement preparedStatement = null;
        preparedStatement = con.prepareStatement("select count(id) as ccount from student_mentor_communication where seen=0 and emp_id=?");
        preparedStatement.setString(1, mentor_id);

        ResultSet rs = preparedStatement.executeQuery();
        if (rs.next()) {
            ccount = rs.getInt("ccount");
            System.out.println(ccount);
        }
        System.out.println(ccount);
    }catch (ClassNotFoundException e) {
        e.printStackTrace();
    }
    catch (SQLException e) {
        e.printStackTrace();
    }
    PreparedStatement preparedStatement = null;
    preparedStatement = con.prepareStatement("select * from student where stud_mis_id=?");
    preparedStatement.setString(1, stud_mis_id);
    ResultSet rs = preparedStatement.executeQuery();
    String name = null;
    String prn = null;
    String roll = null;
    String fileid=null;
    String batch = null;
    String div = null;
     int year= 0;
    String checkimg = null;
    int count=1;
    if (rs.next()) {
        name = rs.getString("stud_name") ;
        prn = rs.getString("stud_prn");
        roll = rs.getString("stud_roll_no");
        batch = rs.getString("stud_batch");
        div = rs.getString("stud_div");
        year = rs.getInt("stud_year");

        checkimg = rs.getString("stud_img");
    }
    System.out.println(stud_mis_id);
    System.out.println(prn);
    System.out.println(roll);
    System.out.println(batch);
    System.out.println(div);

//    Statement pss =null;
//    Connection con2;
//    con2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/mentorsys", "hello", "hello");
//
//    pss = con2.prepareStatement("select stud_");
//    preparedStatement.setString(1, s_stud_name);

%>
<nav class="navbar navbar-expand-lg " >
    <h1 class="navbar-brand"  style="color: white"><strong><b style="font-family: URW Chancery L, cursive ">Mentors' Portal</b></strong></h1>


    <div class="collapse navbar-collapse" id="navbarColor03" >
        <ul class="navbar-nav mr-auto">

            <li class="nav-item ">
                <a class="nav-link" style="color: white" href="/jsp/mentor_profile.jsp"><strong><b>Home</b></strong> </a>
            </li>
            <li class="nav-item ">
                <a class="nav-link  active " style="color: white " href="/jsp/mentor_studentlist.jsp"><strong><b>View Students Profile</b></strong></a>
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
        <li class='last' style="float:right"><a href='student_mentor_contact.jsp'><span><i class="fa fa-bell"></i></span><% if (ccount!=0) {%><span class="badge badge-danger badge-pill"><%=count%></span><%}%></a></li>
        <a class="nav-link" href="../LogoutServlet" style="color: white"><i class="material-icons-account_circle">
        </i> <strong><b>signout</b></strong></a>
    </div>

</nav>
<%--style="background-image: url(https://storage.googleapis.com/chydlx/codepen/blog-cards/image-1.jpg)"--%>
<div class="blog-card">
    <div class="meta">
        <%  if (checkimg==null) {%>
        <div class="photo" >
            <img style="height: 200px; width: 200px" alt="Photo not uploaded " >

        </div>
        <%  } else { %>
        <div class="photo" >
            <img style="height: 200px; width: 200px" src="data:image/png;base64,<%=Base64.getEncoder().encodeToString(rs.getBytes("stud_img"))%>" alt="Photo not uploaded " >

        </div>
        <%  } %>
        <ul class="details">
            <li class="author" style="font-size: larger">NAME:<%=name%></li>
            <li class="date" style="font-size: larger">ROLL NO:<%=roll%></li>

        </ul>
    </div>
    <div class="description">
        <h1>GENERAL DETAILS</h1>


        <p>PRN : <%=prn%></p>
        <p>Year : <%=year%></p>
        <p>Division : <%=div%></p>
        <p>Batch : <%=batch%></p>
        <p>Roll no : <%=roll%></p>

    </div>
</div>
<div class="blog-card">

    <div class="description">
        <h1>VIEW UPLOADS</h1>

        <%  String filetype="certificates";
            preparedStatement = con.prepareStatement("select stud_file_id from stud_documents where file_type=? and stud_mis_id=?");
            preparedStatement.setString(1,filetype);
            preparedStatement.setString(2, stud_mis_id);
            ResultSet resultSet2 = preparedStatement.executeQuery();
            count=1;

            if(!resultSet2.first())
            {
                System.out.print(resultSet2.first());

        %>
        <p>View cetificates::<h6 style="color: red">NO UPLOADS</h6></p>

        <%

        }

        else
        {
            resultSet2.previous();
            while (resultSet2.next())
            {

                fileid=resultSet2.getString("stud_file_id");

        %>
        <p class="read-more">View certificate no ::<%=count%>::<a href="../MentorfileDownload?id=<%=stud_mis_id%>&fileid=<%=fileid%>" target="_blank">View</a></p>

        <%
                    count++;  }}%>

        <%  String filetype1="undertaking";
            preparedStatement = con.prepareStatement("select stud_file_id from stud_documents where file_type=? and stud_mis_id=?");
            preparedStatement.setString(1,filetype1);
            preparedStatement.setString(2, stud_mis_id);
            ResultSet resultSet1 = preparedStatement.executeQuery();
            count=1;

            if(!resultSet1.first())
            {
                System.out.print(resultSet1.first());

        %>
        <p>View undertaking::<h6 style="color: red">NO UPLOADS</h6></p>

        <%

        }

        else
        {
            resultSet1.previous();
            while (resultSet1.next())
            {

                fileid=resultSet1.getString("stud_file_id");

        %>
        <p class="read-more">View undertaking no ::<%=count%>::<a href="../MentorfileDownload?id=<%=stud_mis_id%>&fileid=<%=fileid%>" target="_blank">View</a></p>

        <%
                    count++;  }}%>


    </div>
</div>
<div class="blog-card">

    <div class="description">
        <h1>OTHER DETAILS</h1>


        <p class="read-more">PERSONAL DETAILS : <a href="../form_for_mentor/formentor_personal_details.jsp?id=<%=stud_mis_id%>">view</a></p>
        <p class="read-more">PARENT DETAILS : <a href="../form_for_mentor/formentor_parent_details.jsp?id=<%=stud_mis_id%>">view</a></p>
        <p class="read-more">ACADEMIC DETAILS : <a href="../form_for_mentor/formentor_academic_details.jsp?id=<%=stud_mis_id%>">view</a></p>
        <p class="read-more">EXTRA CURRICULAR DETAILS : <a href="../form_for_mentor/formentor_extra_activities.jsp?id=<%=stud_mis_id%>">view</a></p>
        <p class="read-more">LEAVE APPLICATIONS : <a href="mentor_view_leaves.jsp?id=<%=stud_mis_id%>">view</a></p>


    </div>
</div>


</div>

</body>
</html>
