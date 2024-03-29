<%@ page import="com.pict.database.DatabaseConnection" %>
<%@ page import="java.sql.*" %>
<%@ page import="static java.lang.System.out" %>
<%@ page import="java.util.Base64" %>
<!doctype html>
<html lang=''>
<head>
    <meta charset='utf-8'>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="../css/stud_profile_navbar.css">
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <script src="../js/bootstrap.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.css" rel="stylesheet" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
    <!--<script src="script.js"></script>-->


    <style>

        body {
            font-size: inherit;
            line-height: 1.5;
        }

        html, body {
            height: 100%;
        }

        .banner {
            background: url('../img/books5.jpg');
            background-size: cover;
            padding-top: 25px;
            padding-bottom: 75px;
            height: 400px;
        }

        .banner .container {
            display: flex;
            align-items: center;
            justify-content: flex-start;
        }

        .container {
            width: 80%;
            max-width: 900px;
            margin: 0 auto;
            height: 100%;
            transition: width .5s ease;
        }

        .profile-pic {
            height: 100%;
            width: 250px;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            /*margin-top: 50px;*/
        }

        .avatar {
            background-color: #bbbbbb;
            height: 200px;
            min-width: 200px;
            /*border-radius: 80px;*/
        }

        .bio {
            margin-left: 40px;
        }

        @media all and (max-width: 768px){

            .container {
                width: 90%;
                transition: width .5s ease;
            }


            @media all and (max-width: 500px) {

                .banner {
                    height: auto;
                    padding-top: 20px;
                    padding-bottom: 70px;
                }

                .banner .container {
                    flex-direction: column;
                }

                .bio {
                    margin-left: 0;
                    width: 100%;
                    text-align: center;
                    margin-top: 20px;
                / / line-height: 1.15;
                }

            }}

        .title-arch {
            text-align: center;
            margin: 50px 0;
            font-size: 22px;
            letter-spacing: 2px;
            text-transform: uppercase;
        }
        .project {
            width: 420px;
            height: 400px;
            background-image: url(../img/star2.jpg);
            background-size: cover;
            background-position: center;
            padding: 0 !important;
            float:left;
            margin-left: 30px;
            box-shadow: #005cbf;

        }

        .project-2 {
            background-image: url(../img/meetings.jpg);
        }

        .project-3 {
            background-image: url(../img/editblue.jpeg);
        }

        .project-4 {
            background-image: url(../img/mail.png);
        }

        .project-hover {
            width: 100%;
            height: 100%;
            color: #fff;
            opacity: 0;
            -webkit-transition: all 0.5s ease;
            -moz-transition: all 0.5s ease;
            -o-transition: all 0.5s ease;
            transition: all 0.5s ease;
            background-color: rgba(186, 232, 2, 0.7);
            padding: 40% 30px !important;
        }

        .project-hover hr {
            height: 30px;
            width: 0;
            -webkit-transition: all 0.5s ease;
            -moz-transition: all 0.5s ease;
            -o-transition: all 0.5s ease;
            transition: all 0.5s ease;
            background-color: rgba(255, 255, 255, 1);
            border: 0;
        }

        .project-hover a {
            color: rgba(255, 255, 255, 1);
            padding: 2px 22px;
            line-height: 40px;
            border: 2px solid rgba(255, 255, 255, 1);
            -webkit-transition: all 0.5s ease-in-out;
            -moz-transition: all 0.5s ease-in-out;
            -o-transition: all 0.5s ease-in-out;
            transition: all 0.5s ease-in-out;
        }

        .project-hover a:hover {
            border-color: rgba(51, 51, 51, 1);
            color: rgba(51, 51, 51, 1);
            background-color: #FFF;
        }

        .project:hover .project-hover {
            opacity: 1;
        }

        .project:hover .project-hover hr {
            width: 100%;
            height: 5px;
        }



    </style>

    <title>Student Profile</title>
</head>
<body>

<%
    if (session.getAttribute("stud_name")==null)
        response.sendRedirect("/index.jsp");
    String s_stud_name = (String)session.getAttribute("stud_name");
    String s_stud_mis_id = (String)session.getAttribute("stud_mis_id");

    Connection databaseConnection = DatabaseConnection.getDatabaseConnection();
    Connection con;
    Connection con2;
    Connection con3;
    PreparedStatement ps = null;
    Statement pss = null;
    Statement pss2 = null;
    Statement pss4 = null;
    Class.forName("com.mysql.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mentorsys", "hello", "hello");
    con2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/mentorsys", "hello", "hello");
    con3 = DriverManager.getConnection("jdbc:mysql://localhost:3306/mentorsys", "hello", "hello");
    pss=con2.createStatement();
    pss2=con2.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,
            ResultSet.CONCUR_READ_ONLY);
    pss4=con2.createStatement();

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
    System.out.println(s_stud_mis_id);
    System.out.println(prn);
    System.out.println(roll);
    System.out.println(batch);
    System.out.println(div);
    //System.out.println(checkimg);

    String error = "";

    ResultSet rss4 = pss4.executeQuery("select e.mentorname from mentor e join studentmentorrel s on e.emp_id = s.emp_id where s.stud_mis_id='"+s_stud_mis_id+"'");
    String mentorname = "";
    if(rss4.next()) {
        mentorname = rss4.getString("mentorname");
    }
    ResultSet rss3 = pss2.executeQuery("select count(a.activity_id) as ccount from activity_list a join student_activity_list s on s.activity_id = a.activity_id where stud_mis_id='"+s_stud_mis_id+"' and is_seen= 0");
    int count=0;
    if(rss3.next()) {
        count = rss3.getInt("ccount");
//        rss3.last();
//        count = rss3.getRow() + 1;
//        rss3.beforeFirst();
        session.setAttribute("error",null);

        Statement upd = null;
        upd = con3.createStatement();
        ResultSet updd = upd.executeQuery("select s.updated,a.updated,p.updated,e.updated from student s join StudentAcademicDetails a on s.stud_mis_id = a.stud_mis_id join StudentExtraDetails e on s.stud_mis_id = e.stud_mis_id join Student_parent_details p on s.stud_mis_id = p.stud_mis_id where s.stud_mis_id='"+s_stud_mis_id+"'");
        updd.next();
        if (updd.getInt("s.updated")==0 || updd.getInt("a.updated")==0 || updd.getInt("p.updated")==0 || updd.getInt("e.updated")==0) {
            session.setAttribute("error","Please Update your Profile Forms");
        }
        error = (String) session.getAttribute("error");
    }
%>

<div id='cssmenu' class="sticky-top">
    <ul style="font-size: 25px">
        <li class="active"><a href='student_profile.jsp'><span></span><span><i class="fa fa-home"></i> </span></a></li>
        <li class='has-sub'><a href='#'><span>Forms</span></a>
            <ul>
                <li class='has-sub'><a href='#'><span>Edit</span></a>
                    <ul>
                        <li><a href='../forms1/personal_details.jsp'><span>Personal Details</span></a></li>
                        <li><a href='../forms1/academic_details.jsp'><span>Academic Details</span></a></li>
                        <li><a href='../forms1/parent_details.jsp'><span>Parents Details</span></a></li>
                        <li class='last'><a href='../forms1/extra_activities.jsp'><span>Extra Activities</span></a></li>
                    </ul>
                </li>
                <li class='has-sub'><a href='#'><span>Submit</span></a>
                    <ul>
                        <li class='last'><a href='../forms1/leave_app.jsp'><span>Leave Application</span></a></li>
                        <li class='last'><a href='../forms1/upload_docs.jsp'><span>Certificates / Undertaking</span></a></li>
                    </ul>
                </li>
            </ul>
        </li>
        <!--<li><a href='#'><span>Other</span></a></li>-->
        <li class='has-sub'><a href='#'><span>Other</span></a>
            <ul>
                <li class='has-sub'><a href='../forms1/contact_mentor.jsp'><span>Contact Mentor</span></a></li>
                <li class='has-sub'><a href='student_view_leaves.jsp'><span>View Leaves Taken</span></a></li>
                <li class='has-sub'><a href='student_view_meetings.jsp'><span>View Meetings</span></a></li>
            </ul>
        </li>

        <li style="float:right"><a href='/LogoutServlet'><span>Logout</span></a></li>
        <li style="float:right"><a href='student_profile.jsp'><span><%=s_stud_name%></span></a></li>
        <%

            //                pss = con2.prepareStatement("select * from activity_list a join student_activity_list s on s.activity_id = a.activity_id where stud_mis_id=? and is_seen=? order by activity_date desc ");
//                preparedStatement.setString(1, stud_mis_id);
//                preparedStatement.setInt(1, 0);
//                ResultSet rss = pss.executeQuery();

            ResultSet rss = pss.executeQuery("select * from activity_list a join student_activity_list s on s.activity_id = a.activity_id where stud_mis_id='"+s_stud_mis_id+"' and is_seen= 0 order by activity_date desc");


        %>

        <li class='last' style="float:right"><a href='student_view_meetings.jsp'><span><i class="fa fa-bell"></i> </span><% if (count!=0) {%><span class="badge badge-danger badge-pill"><%=count%></span><%}%></a></li>
    </ul>
</div>

<div class="banner">
    <div class="container" style="background: rgba(0,0,0,0.7); color: white">
        <div class="profile-pic">
            <div class="avatar">
                <%
                    if (checkimg!=null){
                %>
                <img class="card-img-top" style="height: 200px; width: 200px" src="data:image/png;base64,<%=Base64.getEncoder().encodeToString(rs.getBytes("stud_img"))%>" alt="Card image cap " style="width: 300px; height:300px; align-self: center ">
                <%
                } else {

                %>
                <img class="card-img-top" src=" " alt="Card image cap " style="width: 300px; height:300px; align-self: center ">
                <%
                    }

                %>

                <%--<img src="img/blank_profile.png" style="height: 200px; width: 200px">--%>

            </div>
        </div>
        <div class="bio" >
            <h1 class="heading-medium" style="font-size: 45px"><%=s_stud_name%></h1>
            <h2 style="font-size: 20px">Roll no.: <%=roll%></h2>
            <h2 style="font-size: 20px">Div: <%=div%>      Batch: <%=batch%></h2>
            <h2 style="font-size: 20px">Mentor: <%=mentorname%></h2>
            <%--<h2 style="font-size: 20px">CC: XYZ</h2>--%>
            <%
                if (session.getAttribute("error")!=null) {
            %>
            <div class="alert alert-danger">
                <%--<button type="button" class="close" data-dismiss="alert" aria-label="Close">&times;</button>--%>
                <a href="#" class="alert-link"><%=error%></a>
            </div>
            <%
                }
                if (checkimg==null){
            %>
            <form action="../FileUploadServlet"  method="POST" enctype="multipart/form-data">
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

<div class="container-fluid">
    <div class="title-arch" style="height: 100px">Welcome to Student Portal<p></p></div>

    <div class="col-xl-3 col-lg-3 col-md-3 col-sm-3 project wow animated animated4 fadeInLeft ">
        <a href="../forms1/upload_docs.jsp" style="text-decoration: none">
            <div class="project-hover">
                <h2>VEIW ACHIEVEMENTS</h2>
                <hr />
                <p>View the achievement certificates and undertakings you uploaded.</p>
            </div>
        </a>
    </div>
    <div class="col-xl-2 col-lg-2 col-md-2 col-sm-2 " style="width: 20px"></div>
    <div class="col-xl-3 col-lg-3 col-md-3 col-sm-3 project project-2 wow animated animated3 fadeInLeft">
        <a href="student_view_meetings.jsp" style="text-decoration: none">
            <div class="project-hover">
                <h2>VIEW MEETINGS</h2>
                <hr />
                <p>View the conducted and scheduled meetings till now.</p>
            </div>
        </a>
    </div>
    <div class="col-xl-3 col-lg-3 col-md-3 col-sm-3 project project-3 wow animated animated2 fadeInLeft">
        <a href="../forms1/leave_app.jsp" style="text-decoration: none">
            <div class="project-hover">
                <h2>LEAVE APPLICATION</h2>
                <hr />
                <p>Submit Leave application form.</p>
            </div>
        </a>
    </div>
    <div class="col-xl-3 col-lg-3 col-md-3 col-sm-3 project project-4 wow animated fadeInLeft">
        <a href="../forms1/contact_mentor.jsp" style="text-decoration: none">
            <div class="project-hover">
                <h2>CONTACT MENTOR</h2>
                <hr />
                <p>Contact your mentor for guidance and any questions.</p>
            </div>
        </a>
    </div>
    <div class="clearfix"></div>
    <div class="container-fluid" style="background: rgba(0,0,0,0.8)">
        <div class="title-arch" style="height: 150px; color: white"><br>Mentor-Student-Portal<p>Pune Institute of Computer Technology, Dhankawadi, Pune-Satara road, Pune</p></div>

    </div>
</div>
<script type="text/javascript">
    var Msg ='<%=session.getAttribute("getAlert")%>';
    if (Msg != "null") {
        function alertName(){
            swal("SUCCESS", Msg, "success")
        }

        <%session.setAttribute("getAlert",null);%>
    }
</script>
<script type="text/javascript"> window.onload = alertName; </script>
</body>
</html>
