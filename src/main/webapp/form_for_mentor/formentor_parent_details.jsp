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

    preparedStatement = con.prepareStatement("select * from Student_parent_details where stud_mis_id=?");
    preparedStatement.setString(1, s_stud_mis_id);

    ResultSet rs = preparedStatement.executeQuery();
    String father_name = null;
    String father_edu = null;
    String father_occ = null;
    String father_contact = null;
    String father_email = null;
    String father_add = null;
    String mother_name = null;
    String mother_edu = null;
    String mother_occ = null;
    String mother_contact = null;
    String mother_email = null;
    String mother_add = null;
    String siblings = null;
    String sibling_academics = null;
    if (rs.next()) {
        father_name = rs.getString("father_name");
        father_edu = rs.getString("father_edu");
        father_occ = rs.getString("father_occ");
        father_contact = rs.getString("father_contact");
        father_email = rs.getString("father_email");
        father_add = rs.getString("father_add");
        mother_name = rs.getString("mother_name");
        mother_edu = rs.getString("mother_edu");
        mother_occ = rs.getString("mother_occ");
        mother_contact = rs.getString("mother_contact");
        mother_email = rs.getString("mother_email");
        mother_add = rs.getString("mother_add");
        siblings = rs.getString("siblings");
        sibling_academics = rs.getString("sibling_academics");
    }

%>

<div class="container-fluid">
    <div class="row">
        <div class="col-3 "></div>
        <div class="col-6 form">
            <form action="../EditParentDetails" accept-charset=utf-8 method="POST" name="formm">
                <h1>Parent Details</b> </h1>
                <div class="form-group">
                    <label>Father Name</label>
                    <input type="text" class="form-control" name="father_name" placeholder="Full Name" value="<%=father_name%>" readonly>
                    <label>Education</label>
                    <input type="text" class="form-control" name="father_edu" placeholder="" value="<%=father_edu%>" readonly>
                    <label>Occupation</label>
                    <input type="text" class="form-control" name="father_occ" placeholder="" value="<%=father_occ%>" readonly>
                    <label>Contact no.</label>
                    <input type="text" class="form-control" name="father_contact" placeholder="Contact no." value="<%=father_contact%>" readonly>
                    <label>Email</label>
                    <input type="email" class="form-control" name="father_email" placeholder="Email id" value="<%=father_email%>" readonly>
                    <label>Permanent Address</label>
                    <input type="text" class="form-control" name="father_add" placeholder="Permanent Address" value="<%=father_add%>" readonly>
                </div>

                <div class="form-group">
                    <label>Mother Name</label>
                    <input type="text" class="form-control" name="mother_name" placeholder="Full Name" value="<%=mother_name%>" readonly>
                    <label>Education</label>
                    <input type="text" class="form-control" name="mother_edu" placeholder="" value="<%=mother_edu%>" readonly>
                    <label>Occupation</label>
                    <input type="text" class="form-control" name="mother_occ" placeholder="" value="<%=mother_occ%>" readonly>
                    <label>Contact no.</label>
                    <input type="text" class="form-control" name="mother_contact" placeholder="Contact no." value="<%=mother_contact%>" readonly>
                    <label>Email</label>
                    <input type="email" class="form-control" name="mother_email" placeholder="Email id" value="<%=mother_email%>" readonly>
                    <label>Permanent Address</label>
                    <input type="text" class="form-control" name="mother_add" placeholder="Permanent Address" value="<%=mother_add%>" readonly>
                </div>

                <div class="form-group">
                    <label>Siblings</label>
                    <input type="text" class="form-control" name="siblings" placeholder="Number of siblings" value="<%=siblings%>" readonly>
                    <label>Academics</label>
                    <input type="text" class="form-control" name="sib_academics" placeholder="" value="<%=sibling_academics%>" readonly>
                </div>

            </form>


        </div>
        <div class="col-3 "></div>
    </div>
</div>
</body>

</html>
