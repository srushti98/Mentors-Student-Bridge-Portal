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
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mentorsys", "root", "root@123");
    con2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/mentorsys", "root", "root@123");
    pss2=con2.createStatement();


    PreparedStatement preparedStatement = null;

    preparedStatement = con.prepareStatement("select * from Student_parent_details where stud_mis_id=?");
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
            <form action="../EditParentDetails" accept-charset=utf-8 method="POST" name="formm" onsubmit="return validateReg()">
                <h1>Parent Details</b> </h1>
                <div class="form-group">
                    <label>Father Name</label>
                    <input type="text" class="form-control" name="father_name" placeholder="Full Name" value="<%=rs.getString("father_name")%>">
                    <label>Education</label>
                    <input type="text" class="form-control" name="father_edu" placeholder="" value="<%=rs.getString("father_edu")%>">
                    <label>Occupation</label>
                    <input type="text" class="form-control" name="father_occ" placeholder="" value="<%=rs.getString("father_occ")%>">
                    <label>Contact no.</label>
                    <input type="text" class="form-control" name="father_contact" placeholder="Contact no." value="<%=rs.getString("father_contact")%>">
                    <label>Email</label>
                    <input type="email" class="form-control" name="father_email" placeholder="Email id" value="<%=rs.getString("father_email")%>">
                    <label>Permanent Address</label>
                    <input type="text" class="form-control" name="father_add" placeholder="Permanent Address" value="<%=rs.getString("father_add")%>">
                </div>

                <div class="form-group">
                    <label>Mother Name</label>
                    <input type="text" class="form-control" name="mother_name" placeholder="Full Name" value="<%=rs.getString("mother_name")%>">
                    <label>Education</label>
                    <input type="text" class="form-control" name="mother_edu" placeholder="" value="<%=rs.getString("mother_edu")%>">
                    <label>Occupation</label>
                    <input type="text" class="form-control" name="mother_occ" placeholder="" value="<%=rs.getString("mother_occ")%>">
                    <label>Contact no.</label>
                    <input type="text" class="form-control" name="mother_contact" placeholder="Contact no." value="<%=rs.getString("mother_contact")%>">
                    <label>Email</label>
                    <input type="email" class="form-control" name="mother_email" placeholder="Email id" value="<%=rs.getString("mother_email")%>">
                    <label>Permanent Address</label>
                    <input type="text" class="form-control" name="mother_add" placeholder="Permanent Address" value="<%=rs.getString("mother_add")%>">
                </div>

                <div class="form-group">
                    <label>Siblings</label>
                    <input type="text" class="form-control" name="siblings" placeholder="Number of siblings" value="<%=rs.getString("siblings")%>">
                    <label>Academics</label>
                    <input type="text" class="form-control" name="sib_academics" placeholder="" value="<%=rs.getString("sibling_academics")%>">
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

        if (document.formm.father_name.value == "") {
            alert("Please provide your father's name!");
            document.formm.father_name.focus();
            return false;
        }
        if (document.formm.father_edu.value == "") {
            alert("Please provide your father's education!");
            document.formm.father_edu.focus();
            return false;
        }
        if (document.formm.father_occ.value == "") {
            alert("Please provide your father's education!");
            document.formm.father_occ.focus();
            return false;
        }
        if (document.formm.father_add.value == "") {
            alert("Please provide your father's education!");
            document.formm.father_add.focus();
            return false;
        }
        if (document.formm.father_email.value == "") {
            alert("Please provide your father email!");
            document.formm.father_email.focus();
            return false;
        } else {
            var NumLetter = "(.*@.*\\..*)|(.*@\\..*\\..*)";
            if (!document.formm.father_email.value.match(NumLetter)) {
                alert("Please enter valid E-Mail ID !!");
                document.formm.father_email.focus();
                return false;
            }
        }
        if (document.formm.father_contact.value == "" ||
            isNaN(document.formm.father_contact.value)
        ) {
            //out.println("mobile length "+document.regForm.mobile.value.length);
            // System.out.print(document.regForm.mobile.value.length);
            alert("Please provide only digit in mobile number");
            document.formm.father_contact.focus();
            return false;
        }
        else {
            if (document.formm.father_contact.value.length != 10) {

                alert(" Your Mobile Number must be 1 to 10 Integers");
                document.formm.father_contact.select();
                return false;
            }

        }
        if (document.formm.mother_name.value == "") {
            alert("Please provide your father's name!");
            document.formm.mother_name.focus();
            return false;
        }
        if (document.formm.mother_edu.value== "") {
            alert("Please provide your father's education!");
            document.formm.mother_edu.focus();
            return false;
        }
        if (document.formm.mother_occ.value == "") {
            alert("Please provide your father's education!");
            document.formm.mother_occ.focus();
            return false;
        }
        if (document.formm.mother_add.value == "") {
            alert("Please provide your father's education!");
            document.formm.mother_add.focus();
            return false;
        }
        if (document.formm.mother_email.value == "") {
            alert("Please provide your father email!");
            document.formm.mother_email.focus();
            return false;
        } else {
            var NumLetter = "(.*@.*\\..*)|(.*@\\..*\\..*)";
            if (!document.formm.mother_email.value.match(NumLetter)) {
                alert("Please enter valid E-Mail ID !!");
                document.formm.father_email.focus();
                return false;
            }
        }
        if (document.formm.mother_contact.value == "" ||
            isNaN(document.formm.mother_contact.value)
        ) {
            //out.println("mobile length "+document.regForm.mobile.value.length);
            // System.out.print(document.regForm.mobile.value.length);
            alert("Please provide only digit in mobile number");
            document.formm.mother_contact.focus();
            return false;
        }
        else {
            console.log(document.formm.mother_contact.length);
            if (document.formm.mother_contact.value.length != 10) {

                alert(" Your mother Mobile Number must be 1 to 10 Integers");
                document.formm.mother_contact.select();
                return false;
            }

        }
    }

</script>

</html>
