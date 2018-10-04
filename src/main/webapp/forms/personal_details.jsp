        <%@ page import="com.pict.database.DatabaseConnection" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">


<head>
    <meta charset="UTF-8">
    <title>Personal Details</title>

    <meta name="viewport" content="width=device-width,initial-scale=1.0"/>
    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <script src="../js/bootstrap.min.js"></script>
</head>

<style>
    .form{
        background-color: rgb(86, 86, 86);
        }

    h1{
        font-size: 40px;
        font-family: "Javanese Text";
        margin-top: 40px;
        text-align: center;
        color: snow;
    }

    label{
        font-size: 20px;
        color: snow;
    }


    .btn-danger,.btn-primary{
        border-radius: 0px;
        width: 48%;
    }
</style>
<body>
<%
    if (session.getAttribute("stud_name") == null)
        response.sendRedirect("/index.jsp");

    String s_stud_name = (String) session.getAttribute("stud_name");

    Connection databaseConnection = DatabaseConnection.getDatabaseConnection();
    Connection con;
    PreparedStatement ps = null;
    Class.forName("com.mysql.jdbc.Driver");
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mentor_sys", "hello", "hello");


    PreparedStatement preparedStatement = null;

    preparedStatement = con.prepareStatement("select * from student where stud_name=?");
    preparedStatement.setString(1, s_stud_name);

    ResultSet rs = preparedStatement.executeQuery();
    String prn = null;
    String roll = null;
    String batch = null;
    if (rs.next()) {
        prn = rs.getString("stud_prn");
        roll = rs.getString("stud_roll_no");
        batch = rs.getString("stud_batch");
    }
    int prn_int = Integer.parseInt(prn);
    int roll_int = Integer.parseInt(roll);

%>

<div class="container-fluid">
    <div class="row">
        <div class="col-md-12 form"><!--</div>-->
        <!--<div class="col-md-6 form">-->
            <form action="/EditPersonal"  method="POST">
                <h1>Personal Details</b> </h1>
                <div class="form-group">
                    <label>Student Name</label>
                    <input type="text" class="form-control" placeholder="Full Name" value="<%=s_stud_name%>">
                    <label>PRN</label>
                    <input type="number" class="form-control" name="prn_no" placeholder="PR number" value="<%=prn_int%>">
                    <div class="half">
                        <label>Division</label>
                        <input type="text" class="form-control" name="stud_div" placeholder="Division">
                        <label>Roll no.</label>
                        <input type="number" class="form-control" name="stud_roll" placeholder="Roll no" value="<%=roll_int%>">
                        <label>Batch</label>
                        <input type="text" class="form-control" name="stud_batch" placeholder="Batch" value="<%=batch%>">
                    </div>
                    <label>Contact no.</label>
                    <input type="text" class="form-control" name="stud_contact" placeholder="Contact no." value="<%=rs.getString("stud_contact_no")%>">
                    <label>Email</label>
                    <input type="email" class="form-control" name="stud_email" placeholder="Email id">
                </div>

                <div class="form-group">
                    <div class="half">
                        <label>Date of birth</label>
                        <input type="date" class="form-control" name="stud_dob" placeholder="Birthday" value="<%=rs.getString("stud_dob")%>">
                    </div>
                    <div class="half">
                        <label>Select Gender</label>
                        <select class="form-control" name="stud_gender">
                            <option value="Male">Male</option>
                            <option value="Female">Female</option>
                        </select>
                    </div>
                </div>
                <div class="form-group">
                    <label>Blood Group</label>
                    <input type="text" class="form-control" name="stud_bg" placeholder="Blood Group">
                    <label>Local Address</label>
                    <textarea class="form-control" rows="3" name="stud_local_add" placeholder="Local Address"></textarea>
                    <label>Permanent Address</label>
                    <textarea class="form-control" rows="3" name="stud_per_add" placeholder="Permanent Address"></textarea>
                </div>

                <div class="form-group">
                    <input type="submit" class="btn-primary" value="submit">
                    <input type="reset" class="btn-danger" value="reset">
                </div>



            </form>


        </div>
    </div>
</div>

</body>
</html>