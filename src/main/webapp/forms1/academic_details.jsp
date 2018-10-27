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
    <link rel="stylesheet" href="../css/stud_profile_navbar.css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.css" rel="stylesheet" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>


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
    PreparedStatement ps = null;
    Statement pss2 = null;
    Class.forName("com.mysql.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mentorsys", "hello", "hello");
    con2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/mentorsys", "hello", "hello");
    pss2=con2.createStatement();

    PreparedStatement preparedStatement = null;

    preparedStatement = con.prepareStatement("select * from StudentAcademicDetails where stud_mis_id=?");
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
            <form action="/EditAcademics"  method="POST" onsubmit="return validateReg()" name="formm">
                <h1>Academic Details</b> </h1><br>
                <div class="form-group">
                    <label>SSC school</label>
                    <input type="text" class="form-control" name="ssc_sch" placeholder="" value="<%=rs.getString("SSC_school")%>">
                    <label>SSC Percentage</label>
                    <input type="number" class="form-control" name="ssc_pc" placeholder="" value="<%=rs.getString("SSC_percentage")%>">
                    <label>HSC school</label>
                    <input type="text" class="form-control" name="hsc_sch" placeholder="" value="<%=rs.getString("HSC_school")%>">
                    <label>HSC Percentage</label>
                    <input type="number" class="form-control" name="hsc_pc" placeholder="" value="<%=rs.getString("HSC_percentage")%>">
                    <label>PCM</label>
                    <input type="number" class="form-control" name="pcm" placeholder="" value="<%=rs.getString("PCM_marks_total")%>">
                    <label>CET</label>
                    <input type="number" class="form-control" name="cet" placeholder="" value="<%=rs.getString("CET_marks")%>">
                    <label>JEE</label>
                    <input type="text" class="form-control" name="jee" placeholder="" value="<%=rs.getString("JEE_marks")%>">
                    <label>Diploma Percentage (For DSE)</label>
                    <input type="number" class="form-control" name="dip_pc" placeholder="" value="<%=rs.getString("diploma_percentage")%>">
                    <label>Admission category (CAP(Open)/CAP(Reserved)/Institute
                        Level/PIO?NRI/Foreign/J&K/GOI)</label>
                    <input type="text" class="form-control" name="adm_cat" placeholder="" value="<%=rs.getString("admission_category")%>">
                    <label>Subject area of interest</label>
                    <input type="text" class="form-control" name="sub_interest" placeholder="" value="<%=rs.getString("subject_area_interest")%>">
                    <label>Career Plan</label>
                    <input type="text" class="form-control" name="car_plan" placeholder="" value="<%=rs.getString("career_plan")%>">
                    <label>Preference Job/Business/Higher Studies</label>
                    <input type="text" class="form-control" name="preference" placeholder="" value="<%=rs.getString("preference")%>">
                    <label>Affinity R&D(Yes/No)</label>
                    <input type="text" class="form-control" name="affinity" placeholder="" value="<%=rs.getString("affinity")%>"><br><br>

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
