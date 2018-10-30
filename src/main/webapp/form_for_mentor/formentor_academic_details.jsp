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


    </style>
</head>
<body>
<%
    if (session.getAttribute("mentor_id") == null)
        response.sendRedirect("/index.jsp");

    String s_stud_mis_id = (String) request.getParameter("id");

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
    String SSC_percentage = null;
    String HSC_percentage = null;
    String PCM_marks_total = null;
    String CET_marks = null;
    String JEE_marks = null;
    String diploma_percentage = null;
    String admission_category = null;
    String subject_area_of_interest = null;
    String career_plan = null;
    String preference = null;
    String affinity = null;
    String SSC_school = null;
    String HSC_school = null;
    if (rs.next()) {
        SSC_percentage = rs.getString("SSC_percentage");
        HSC_percentage = rs.getString("HSC_percentage");
        PCM_marks_total = rs.getString("PCM_marks_total");
        CET_marks = rs.getString("CET_marks");
        JEE_marks = rs.getString("JEE_marks");
        diploma_percentage = rs.getString("diploma_percentage");
        admission_category = rs.getString("admission_category");
        subject_area_of_interest = rs.getString("subject_area_interest");
        career_plan = rs.getString("career_plan");
        preference = rs.getString("preference");
        affinity = rs.getString("affinity");
        SSC_school = rs.getString("SSC_school");
        HSC_school = rs.getString("HSC_school");
    }


%>

<div class="container-fluid">
    <div class="row">
        <div class="col-3 "></div>
        <div class="col-6 form">
            <form action="/EditAcademics"  method="POST">
                <h1>Academic Details</b> </h1><br>
                <div class="form-group">
                    <label>SSC school</label>
                    <input type="text" class="form-control" name="ssc_sch" placeholder="<%=SSC_school%>" readonly>
                    <label>SSC Percentage</label>
                    <input type="text" class="form-control" name="ssc_pc" placeholder="<%=SSC_percentage%>" readonly>
                    <label>HSC school</label>
                    <input type="text" class="form-control" name="hsc_sch" placeholder="<%=HSC_school%>" readonly>
                    <label>HSC Percentage</label>
                    <input type="text" class="form-control" name="hsc_pc" placeholder="<%=HSC_percentage%>" readonly>
                    <label>PCM</label>
                    <input type="text" class="form-control" name="pcm" placeholder="<%=PCM_marks_total%>" readonly>
                    <label>CET</label>
                    <input type="text" class="form-control" name="cet" placeholder="<%=CET_marks%>" readonly>
                    <label>JEE</label>
                    <input type="text" class="form-control" name="jee" placeholder="<%=JEE_marks%>" readonly>
                    <label>Diploma Percentage (For DSE)</label>
                    <input type="text" class="form-control" name="dip_pc" placeholder="<%=diploma_percentage%>" readonly>
                    <label>Admission category (CAP(Open)/CAP(Reserved)/Institute
                        Level/PIO?NRI/Foreign/J&K/GOI)</label>
                    <input type="text" class="form-control" name="adm-cat" placeholder="<%=admission_category%>" readonly>
                    <label>Subject area of interest</label>
                    <input type="text" class="form-control" name="sub_interest" placeholder="<%=subject_area_of_interest%>" readonly>
                    <label>Career Plan</label>
                    <input type="text" class="form-control" name="car_plan" placeholder="<%=career_plan%>" readonly>
                    <label>Preference Job/Business/Higher Studies</label>
                    <input type="text" class="form-control" name="preference" placeholder="<%=preference%>" readonly>
                    <label>Affinity R&D(Yes/No)</label>
                    <input type="text" class="form-control" name="affinity" placeholder="<%=affinity%>" readonly><br><br>

                </div>

            </form>


        </div>
        <div class="col-3 "></div>
    </div>
</div>

</body>
</html>
