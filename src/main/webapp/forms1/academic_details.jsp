<%@ page import="com.pict.database.DatabaseConnection" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>new profile</title>

    <meta name="viewport" content="width=device-width,initial-scale=1.0"/>
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


    <style>
        #cssmenu > ul,
        #cssmenu > ul li,
        #cssmenu > ul ul {
            list-style: none;
            margin: 0;
            padding: 0;
        }
        #cssmenu > ul {
            position: relative;
            z-index: 597;
            height: 60px;

        }
        #cssmenu > ul li {
            float: left;
            min-height: 1px;
            line-height: 1.3em;
            vertical-align: middle;
        }
        #cssmenu > ul li.hover,
        #cssmenu > ul li:hover {
            position: relative;
            z-index: 599;
            cursor: default;
        }
        #cssmenu > ul ul {
            visibility: hidden;
            position: absolute;
            top: 100%;
            left: 0;
            z-index: 598;
            width: 100%;
        }
        #cssmenu > ul ul li {
            float: none;
        }
        #cssmenu > ul ul ul {
            top: 1px;
            left: 99%;
        }
        #cssmenu > ul li:hover > ul {
            visibility: visible;
        }
        /* Align last drop down RTL */
        #cssmenu > ul > li.last ul ul {
            left: auto !important;
            right: 99%;
        }
        #cssmenu > ul > li.last ul {
            left: auto;
            right: 0;
        }
        #cssmenu > ul > li.last {
            text-align: right;
        }
        /* Theme Styles */
        #cssmenu > ul {
            border-top: 4px solid #3f28f8;
            /*border-top: 4px solid #40bbd6;*/
            font-family: Calibri, Tahoma, Arial, sans-serif;
            font-size: 14px;
            background: #442ec7;
            /*background: #109eac;*/
            /*background: -moz-linear-gradient(top, #1e1e1e 0%, #2f9ed6 100%);*/
            /*background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #1e1e1e), color-stop(100%, #2f9ed6));*/
            /*background: -webkit-linear-gradient(top, #1e1e1e 0%, #2f9ed6 100%);*/
            /*background: linear-gradient(top, #1e1e1e 0%, #2f9ed6 100%);*/
            background: -moz-linear-gradient(top, #1e1e1e 0%, #436bd6 100%);
            background: -webkit-gradient(linear, left top, left bottom, color-stop(0%, #1e1e1e), color-stop(100%, #3c7ad6));
            background: -webkit-linear-gradient(top, #1e1e1e 0%, #3c7ad6 100%);
            background: linear-gradient(top, #1e1e1e 0%, #3c7ad6 100%);
            width: auto;
            zoom: 1;
        }
        #cssmenu > ul:before {
            content: '';
            display: block;
        }
        #cssmenu > ul:after {
            content: '';
            display: table;
            clear: both;
        }
        #cssmenu > ul li a {
            display: inline-block;
            padding: 10px 22px;
        }
        #cssmenu > ul > li.active,
        #cssmenu > ul > li.active:hover {
            /*background-color: #3f28f8;*/
            /*background-color: #40bbd6;*/
            background-color: #3c7ad6;
        }
        #cssmenu > ul > li > a:link,
        #cssmenu > ul > li > a:active,
        #cssmenu > ul > li > a:visited {
            color: #ffffff;
        }
        #cssmenu > ul > li > a:hover {
            color: #ffffff;
        }
        #cssmenu > ul ul ul {
            top: 0;
        }
        #cssmenu > ul li li {
            background-color: #ffffff;
            border-bottom: 1px solid #ebebeb;
            font-size: 20px;

        }
        #cssmenu > ul li.hover,
        #cssmenu > ul li:hover {
            background-color: #F5F5F5;
        }
        #cssmenu > ul > li.hover,
        #cssmenu > ul > li:hover {
            background-color: #3c7ad6;
            /*background-color: #40bbd6;*/
            -webkit-box-shadow: inset 0 -3px 0 rgba(0, 0, 0, 0.15);
            -moz-box-shadow: inset 0 -3px 0 rgba(0, 0, 0, 0.15);
            box-shadow: inset 0 -3px 0 rgba(0, 0, 0, 0.15);
        }
        #cssmenu > ul a:link,
        #cssmenu > ul a:visited {
            color: #9a9a9a;
            text-decoration: none;
        }
        #cssmenu > ul a:hover {
            color: #9a9a9a;
        }
        #cssmenu > ul a:active {
            color: #9a9a9a;
        }
        #cssmenu > ul ul {
            border: 1px solid #CCC \9;
            -webkit-box-shadow: 0 0px 2px 1px rgba(0, 0, 0, 0.15);
            -moz-box-shadow: 0 0px 2px 1px rgba(0, 0, 0, 0.15);
            box-shadow: 0 0px 2px 1px rgba(0, 0, 0, 0.15);
            width: 150px;
        }

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
    PreparedStatement ps = null;
    Statement pss2 = null;
    Class.forName("com.mysql.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mentorsys", "hello", "hello");
    con2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/mentorsys", "hello", "hello");
    pss2=con2.createStatement();

    PreparedStatement preparedStatement = null;

    preparedStatement = con.prepareStatement("select * from student where stud_name=?");
    preparedStatement.setString(1, s_stud_name);

    ResultSet rs = preparedStatement.executeQuery();
    String prn = null;
    String roll = null;
    String batch = null;
    String div = null;
    if (rs.next()) {
        prn = rs.getString("stud_prn");
        roll = rs.getString("stud_roll_no");
        batch = rs.getString("stud_batch");
        div = rs.getString("stud_div");
    }
    int prn_int = Integer.parseInt(prn);
    int roll_int = Integer.parseInt(roll);

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
                <li class='has-sub'><a href='#'><span>Contact Mentor</span></a></li>
                <li class='has-sub'><a href='#'><span>View Students</span></a></li>
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
            <form action="/EditAcademics"  method="POST" onsubmit="validateReg()" name="formm">
                <h1>Academic Details</b> </h1><br>
                <div class="form-group">
                    <label>SSC school</label>
                    <input type="text" class="form-control" name="ssc_sch" placeholder="">
                    <label>SSC Percentage</label>
                    <input type="number" class="form-control" name="ssc_pc" placeholder="">
                    <label>HSC school</label>
                    <input type="text" class="form-control" name="hsc_sch" placeholder="">
                    <label>HSC Percentage</label>
                    <input type="number" class="form-control" name="hsc_pc" placeholder="">
                    <label>PCM</label>
                    <input type="number" class="form-control" name="pcm" placeholder="">
                    <label>CET</label>
                    <input type="number" class="form-control" name="cet" placeholder="">
                    <label>JEE</label>
                    <input type="text" class="form-control" name="jee" placeholder="">
                    <label>Diploma Percentage (For DSE)</label>
                    <input type="number" class="form-control" name="dip_pc" placeholder="">
                    <label>Admission category (CAP(Open)/CAP(Reserved)/Institute
                        Level/PIO?NRI/Foreign/J&K/GOI)</label>
                    <input type="text" class="form-control" name="adm_cat" placeholder="">
                    <label>Subject area of interest</label>
                    <input type="text" class="form-control" name="sub_interest" placeholder="">
                    <label>Career Plan</label>
                    <textarea class="form-control" rows="3" name="car_plan" placeholder=""></textarea>
                    <label>Preference Job/Business/Higher Studies</label>
                    <input type="text" class="form-control" name="preference" placeholder="">
                    <label>Affinity R&D(Yes/No)</label>
                    <input type="text" class="form-control" name="affinity" placeholder=""><br><br>

                    <%--<div class="form-group" style="margin-top: 10px" >--%>
                        <%--<label>Upload Documents</label>--%>
                        <%--<input type="file" name="file">--%>
                    <%--</div>--%>
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

<script type="text/javascript">
    function validateReg() {

        console.log("hello");

        if (document.formm.ssc_sch.value == "") {
            alert("Please provide your ssc school!");
            document.formm.ssc_sch.focus();
            return false;
        }
        if (document.formm.hsc_sch.value == "") {
            alert("Please provide your hsc school!");
            document.formm.hsc_sch.focus();
            return false;
        }
        if (document.formm.ssc_pc.value == "" ||
            isNaN(document.formm.ssc_pc.value)
        ) {
            //out.println("mobile length "+document.regForm.mobile.value.length);
            // System.out.print(document.regForm.mobile.value.length);
            alert("Please provide only digit in marks");
            document.formm.ssc_pc.focus();
            return false;
        }
        if (document.formm.hsc_pc.value == "" ||
            isNaN(document.formm.hsc_pc.value)
        ) {
            //out.println("mobile length "+document.regForm.mobile.value.length);
            // System.out.print(document.regForm.mobile.value.length);
            alert("Please provide only digit in marks");
            document.formm.hsc_pc.focus();
            return false;
        }
        if (document.formm.pcm.value == "" ||
            isNaN(document.formm.pcm.value)
        ) {
            //out.println("mobile length "+document.regForm.mobile.value.length);
            // System.out.print(document.regForm.mobile.value.length);
            alert("Please provide only digit in marks");
            document.formm.pcm.focus();
            return false;
        }
        if (document.formm.cet.value == "" ||
            isNaN(document.formm.cet.value)
        ) {
            //out.println("mobile length "+document.regForm.mobile.value.length);
            // System.out.print(document.regForm.mobile.value.length);
            alert("Please provide only digit in marks");
            document.formm.cet.focus();
            return false;
        }
        if (document.formm.jee.value == "" ||
            isNaN(document.formm.jee.value)
        ) {
            //out.println("mobile length "+document.regForm.mobile.value.length);
            // System.out.print(document.regForm.mobile.value.length);
            alert("Please provide only digit in marks");
            document.formm.jee.focus();
            return false;
        }
        if (document.formm.dip_pc.value == "" ||
            isNaN(document.formm.dip_pc.value)
        ) {
            //out.println("mobile length "+document.regForm.mobile.value.length);
            // System.out.print(document.regForm.mobile.value.length);
            alert("Please provide only digit in marks");
            document.formm.dip_pc.focus();
            return false;
        }
        if (document.formm.adm_cat.value == "") {
            alert("Please provide your admission category!");
            document.formm.adm_cat.focus();
            return false;
        }
        if (document.formm.sub_interest.value == "") {
            alert("Please provide your subject interest!");
            document.formm.sub_interest.focus();
            return false;
        }
        if (document.formm.preference.value == "") {
            alert("Please provide your preference!");
            document.formm.preference.focus();
            return false;
        }
        if (document.formm.affinity.value == "") {
            //out.println("mobile length "+document.regForm.mobile.value.length);
            // System.out.print(document.regForm.mobile.value.length);
            alert("Please provide affinity");
            document.formm.affinity.focus();
            return false;
        }
        if (document.formm.car_plan.value == "") {
            //out.println("mobile length "+document.regForm.mobile.value.length);
            // System.out.print(document.regForm.mobile.value.length);
            alert("Please provide your career plan");
            document.formm.car_plan.focus();
            return false;
        }
    }

</script>
</body>
</html>
