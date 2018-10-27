<%@ page import="com.pict.database.DatabaseConnection" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>new profile</title>

    <meta name="viewport" content="width=device-width,initial-scale=1.0"/>
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <link rel="stylesheet" href="../css/stud_profile_navbar.css">
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
    <script src="../js/bootstrap.js"></script>

    <style>

        .form{
            background-color: rgba(86, 86, 86.0.8);
            margin-top: 50px;
            border: solid;
            border-color: black;
            border-radius: 50px;
            padding: 50px 40px;
        }

        h1{
            font-size: 40px;
            font-family: "Javanese Text";
            margin-top: 40px;
            text-align: center;
            color: black;
        }

        label{
            font-size: 20px;
            color: black;
        }


        .btn-danger,.btn-primary{
            border-radius: 0px;
            width: 48%;
            height: 50px;
        }
    </style>
</head>
<body>
<%
    if (session.getAttribute("stud_name") == null)
        response.sendRedirect("/index.jsp");

    String s_stud_name = (String) session.getAttribute("stud_name");
    String s_stud_mis_id = (String) session.getAttribute("stud_mis_id");

    Connection databaseConnection = DatabaseConnection.getDatabaseConnection();
    Connection con;
    Connection con2;
    Statement pss2 = null;
    PreparedStatement ps = null;
    Class.forName("com.mysql.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mentorsys", "hello", "hello");
    con2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/mentorsys", "hello", "hello");
    pss2=con2.createStatement();

    PreparedStatement preparedStatement = null;

    preparedStatement = con.prepareStatement("select * from StudentExtraDetails where stud_mis_id=?");
    preparedStatement.setString(1, s_stud_mis_id);

    ResultSet rs = preparedStatement.executeQuery();
    rs.next();

    ResultSet rss3 = pss2.executeQuery("select count(a.activity_id) as ccount from activity_list a join student_activity_list s on s.activity_id = a.activity_id where stud_mis_id='"+s_stud_mis_id+"' and is_seen= 0");
    int count=0;
    rss3.next();
    count=rss3.getInt("ccount");

%>

<div id='cssmenu' class="sticky-top">
    <ul style="font-size: 25px">
        <li class="active"><a href='../jsp/student_profile.jsp'><span></span><span><i class="fa fa-home"></i> </span></a></li>
        <li class='has-sub'><a href='#'><span>Forms</span></a>
            <ul>
                <li class='has-sub'><a href='#'><span>Edit</span></a>
                    <ul>
                        <li><a href='personal_details.jsp'><span>Personal Details</span></a></li>
                        <li><a href='parent_details.jsp'><span>Parent Details</span></a></li>
                        <li><a href='academic_details.jsp'><span>Academic Details</span></a></li>
                        <li class='last'><a href='extra_activities.jsp'><span>Extra Activities</span></a></li>
                    </ul>
                </li>
                <li class='has-sub'><a href='#'><span>Submit</span></a>
                    <ul>
                        <li class='last'><a href='leave_app.jsp'><span>Leave Application</span></a></li>
                        <li class='last'><a href='upload_docs.jsp'><span>Certificates / Undertaking</span></a></li>
                    </ul>
                </li>
            </ul>
        </li>
        <!--<li><a href='#'><span>Other</span></a></li>-->
        <li class='has-sub'><a href='#'><span>Other</span></a>
            <ul>
                <li class='has-sub'><a href='contact_mentor.jsp'><span>Contact Mentor</span></a></li>
                <li class='has-sub'><a href='../jsp/student_view_leaves.jsp'><span>View Leaves Taken</span></a></li>
                <li class='has-sub'><a href='../jsp/student_view_meetings.jsp'><span>View Meetings</span></a></li>
            </ul>
        </li>

        <li style="float:right"><a href='/LogoutServlet'><span>LogOut</span></a></li>
        <li style="float:right"><a href='../jsp/student_profile.jsp'><span><%=s_stud_name%></span></a></li>
        <li class='last' style="float:right"><a href='../jsp/student_view_meetings.jsp'><span><i class="fa fa-bell"></i> </span><% if (count!=0) {%><span class="badge badge-danger badge-pill"><%=count%></span><%}%></a></li>
    </ul>
</div>
<div class="container-fluid">
    <div class="row">
        <div class="col-3 "></div>
        <div class="col-6 form">
            <form action="../EditExtraDetails" name="formm" method="POST" onsubmit="validateReg()">
                <h1>Extra</b> </h1>
                <div class="form-group">
                    <label>Hobbies</label>
                    <input type="text" class="form-control" name="stud_hobbies" placeholder="" value="<%=rs.getString("stud_hobbies")%>">
                    <label>Extra/Co curricular Activities</label>
                    <input type="text" class="form-control" name="stud_extra_activities" placeholder="" value="<%=rs.getString("stud_extra_activities")%>">
                    <label>Sports</label>
                    <input type="text" class="form-control" name="stud_sports" placeholder="" value="<%=rs.getString("stud_sports")%>">
                    <label>Any Special Achievements</label>
                    <input type="text" class="form-control" name="stud_achievements" placeholder="" value="<%=rs.getString("stud_achievements")%>">
                    <label>Scholarships</label>
                    <input type="text" class="form-control" name="stud_scholarships" placeholder="" value="<%=rs.getString("stud_scholarships")%>">
                </div>


                <div class="form-group">
                    <input type="submit" class="btn-primary" value="Submit">
                    <input type="reset" class="btn-danger" value="Reset">
                </div>
            </form>

        </div>
        <div class="col-3 "></div>
    </div>
</div>
</body>
<script type="text/javascript">
    function validateReg() {

        console.log("hello");

        if (document.formm.stud_hobbies.value == "") {
            alert("Please provide your hobbies!");
            document.formm.stud_hobbies.focus();
            return false;
        }
        if (document.formm.stud_extra_activities.value == "") {
            alert("Please provide your extra activities!");
            document.formm.stud_extra_activities.focus();
            return false;
        }
        if (document.formm.stud_sports.value == "") {
            alert("Please provide your sports details!");
            document.formm.stud_sports.focus();
            return false;
        }
        if (document.formm.stud_achievements.value == "") {
            alert("Please provide your achievements!");
            document.formm.stud_achievements.focus();
            return false;
        }
        if (document.formm.stud_scholarships.value == "") {
            alert("Please provide your father email!");
            document.formm.stud_scholarships.focus();
            return false;
        }
    }

</script>
</html>
