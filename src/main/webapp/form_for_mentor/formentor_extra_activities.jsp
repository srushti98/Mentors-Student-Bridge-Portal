<%@ page import="com.pict.database.DatabaseConnection" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>new profile</title>

    <meta name="viewport" content="width=device-width,initial-scale=1.0"/>
    <link rel="stylesheet" href="../css/bootstrap.min.css">
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

    String s_stud_mis_id = (String) request.getParameter("id");

    Connection databaseConnection = DatabaseConnection.getDatabaseConnection();
    Connection con;
    PreparedStatement ps = null;
    Class.forName("com.mysql.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mentorsys", "hello", "hello");

    PreparedStatement preparedStatement = null;

    preparedStatement = con.prepareStatement("select * from student where stud_name=?");
    preparedStatement.setString(1, s_stud_mis_id);

    ResultSet rs = preparedStatement.executeQuery();
    String stud_hobbies = null;
    String stud_extra_activities = null;
    String stud_sports = null;
    String stud_achievements = null;
    String stud_scholarships = null;
    if (rs.next()) {
        stud_hobbies = rs.getString("stud_hobbies");
        stud_extra_activities = rs.getString("stud_extra_activities");
        stud_sports = rs.getString("stud_sports");
        stud_achievements = rs.getString("stud_achievements");
        stud_scholarships = rs.getString("stud_scholarships");
    }

%>

<div class="container-fluid">
    <div class="row">
        <div class="col-3 "></div>
        <div class="col-6 form">
            <form action="../EditExtraDetails"  method="POST">
                <h1>Extra</b> </h1>
                <div class="form-group">
                    <label>Hobbies</label>
                    <input type="text" class="form-control" name="stud_hobbies" placeholder="" value="<%=stud_hobbies%>" readonly>
                    <label>Extra/Co curricular Activities</label>
                    <input type="text" class="form-control" name="stud_extra_activities" placeholder="" value="<%=stud_extra_activities%>" readonly>
                    <label>Sports</label>
                    <input type="text" class="form-control" name="stud_sports" placeholder="" value="<%=stud_sports%>" readonly>
                    <label>Any Special Achievements</label>
                    <input type="text" class="form-control" name="stud_achievements" placeholder="" value="<%=stud_achievements%>" readonly>
                    <label>Scholarships</label>
                    <input type="text" class="form-control" name="stud_scholarships" placeholder="" value="<%=stud_scholarships%>" readonly>
                </div>

            </form>

        </div>
        <div class="col-3 "></div>
    </div>
</div>

</body>
</html>
