<%@ page import="com.pict.database.DatabaseConnection" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <script src="../js/bootstrap.js"></script>
    <link rel="stylesheet" href="../css/stud_profile_navbar.css">
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
    <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
    <script src="http://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
    <title>Undertaking</title>

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

    preparedStatement = con.prepareStatement("select * from student where stud_name=?");
    preparedStatement.setString(1, s_stud_name);

    ResultSet rs = preparedStatement.executeQuery();
    String prn = null;
    String roll = null;
    String batch = null;
    String div = null;
    String fileid=null;
    if (rs.next()) {
        prn = rs.getString("stud_prn");
        roll = rs.getString("stud_roll_no");
        batch = rs.getString("stud_batch");
        div = rs.getString("stud_div");
    }


    ResultSet rss3 = pss2.executeQuery("select count(a.activity_id) as ccount from activity_list a join student_activity_list s on s.activity_id = a.activity_id where stud_mis_id='"+s_stud_mis_id+"' and is_seen= 0");
    int ccount=0;
    rss3.next();
    ccount=rss3.getInt("ccount");

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
        <li style="float:right"><a href='#'><span><%=s_stud_name%></span></a></li>
        <li class='last' style="float:right"><a href='../jsp/student_view_meetings.jsp'><span><i class="fa fa-bell"></i> </span><% if (ccount!=0) {%><span class="badge badge-danger badge-pill"><%=ccount%></span><%}%></a></li>
    </ul>
</div>
<div class="container-fluid">
    <div class="row" style="margin-top: 50px">
        <div class="col-md-2 "></div>
        <div class="col-md-8">
            <div class="jumbotron">
                <h2>Certificates</h2>

                <%  String filetype="certificates";
                    preparedStatement = con.prepareStatement("select stud_file_id from stud_documents where file_type=? and stud_mis_id=?");
                    preparedStatement.setString(1,filetype);
                    preparedStatement.setString(2, s_stud_mis_id);
                    ResultSet resultSet2 = preparedStatement.executeQuery();
                    int count=1;

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
                <p class="read-more">View certificate no ::<%=count%>::<a href="../MentorfileDownload?id=<%=s_stud_mis_id%>&fileid=<%=fileid%>" target="_blank">View</a></p>

                <%
                            count++;  }}%>


                <p class="lead">Upload your achievement certificates for competitions and extra activities here.</p>
                <hr class="my-4">
                <p class="lead">upload certificates.
                <form method="post" action="../FileCertificateUploadDBServlet" enctype="multipart/form-data">
                    <%--<input type="file" name="File" multiple="multiple" onchange="readURL(this);">--%>
                    <input type="file" name="File" id="file">
                    <a href="#" target="_blank" class="preview">View</a>
                    <button type="submit">
                        upload
                    </button>

                </form>
                </p>
            </div>


            <div class="jumbotron">
                <h2>Parent Undertaking</h2>
                <p class="lead">Download Undertaking. Get it signed by parents. Upload it here.</p>
                <%  String filetype1="undertaking";
                    preparedStatement = con.prepareStatement("select stud_file_id from stud_documents where file_type=? and stud_mis_id=?");
                    preparedStatement.setString(1,filetype1);
                    preparedStatement.setString(2, s_stud_mis_id);
                    ResultSet resultSet3 = preparedStatement.executeQuery();
                    int count1=1;

                    if(!resultSet3.first())
                    {
                        System.out.print(resultSet3.first());

                %>
                <p>View undertaking::<h6 style="color: red">NO UPLOADS</h6></p>

                <%

                }

                else
                {
                    resultSet3.previous();
                    while (resultSet3.next())
                    {

                        fileid=resultSet3.getString("stud_file_id");

                %>
                <p class="read-more">View undertaking no ::<%=count1%>::<a href="../MentorfileDownload?id=<%=s_stud_mis_id%>&fileid=<%=fileid%>" target="_blank">View</a></p>

                <%
                            count1++;
                        }}%>


                <hr class="my-4">
                <p class="lead">upload undertaking from here.
                <form action="../data/Undertaking.pdf" method="get" target="_blank">
                    <div class="form-group">

                        <input type="submit" class="btn btn-primary btn-lg" value="Download"><br><br><br>
                    </div>
                </form>
                <%--<div class="btn btn-primary btn-lg" href="#" role="button">Download</div><br><br><br>--%>
                <form method="post" action="../FileUploadDBServlet" enctype="multipart/form-data">
                    <%--<input type="file" name="File" multiple="multiple" onchange="readURL(this);">--%>
                    <input type="file" name="File" id="file">
                    <a href="#" target="_blank" class="preview">View</a>
                    <button type="submit">
                        upload
                    </button>

                </form>
                </p>
            </div>

        </div>
        <div class="col-md-2"></div>
    </div>
</div>
</body>
<script>
    var $preview = $(".preview");
    $preview.hide();

    $("input").on("change", function(){

        var files = this.files;
        var fileReader = new FileReader();

        fileReader.onload = function(e){
            $preview.attr("href", e.target.result);
            $preview.show();
        };

        fileReader.readAsDataURL(files[0]);
    });
</script>
</html>






