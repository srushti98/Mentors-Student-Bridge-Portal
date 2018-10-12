<%@ page import="java.sql.*" %>
<html>

<head>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/css/bootstrap.min.css" integrity="sha384-Smlep5jCw/wG7hdkwQ/Z5nLIefveQRIY9nfy6xoR1uRYBtpZgI6339F5dgvm/e9B" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons"
          rel="stylesheet">


    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/js/bootstrap.min.js" integrity="sha384-o+RDsa0aLu++PJvFqy8fFScvbHFLtbvScb8AjopnFD+iEQ7wo/CG0xlczd+2O/em" crossorigin="anonymous"></script><title>Register!!!</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.css" rel="stylesheet" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
    <link rel="stylesheet" href="/css/trailallocate.css">



</head>


<body >
<div id="container" style="padding: 2px;margin-top: 90px">
    <h1 style="margin-top: 50px">&bull; Allot mentor to student &bull;</h1>
    <div class="underline">
    </div>
    <div class="icon_wrapper">

    </div>
    <form action="#" method="post" id="contact_form">
        <div class="name">

            <input type="text" placeholder="SElect Starting rollno" name="name" id="name_input" required>
        </div>
        <div class="email">

            <input type="email" placeholder="SElect Ending rollno" name="email" id="email_input" required>
        </div>
        <div class="subject">
        <%
            try
            {

                Connection con;
                PreparedStatement ps = null;
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mentorsys", "hello", "hello");
                System.out.println("SL3 "+ "database successfully opened.");
                String sql = "SELECT mentorname FROM mentor where mentor_flag=0";
                ps = con.prepareStatement(sql);
                ResultSet rs = ps.executeQuery();
        %>
        <select placeholder="SELECT Mentor" name="subject" id="subject_input" required>
            <option value="" selected="selected">--SELECT MENTOR--</option>
                <%
                            while(rs.next())
                            {
                                String fname = rs.getString("mentorname");
                        %>
            <option value="<%=fname %>"><%=fname %></option>
                <%
                            }
                        %>

        </select>

        </div>

        <div class="submit">
            <input type="submit" value="Send Message" id="form_button" />
        </div>
    </form><!-- // End form -->
    <%
        }
        catch(SQLException sqe)
        {
            System.out.println(sqe);
        }
    %>
</div><!-- // End #container -->


</body>
    <%--<div class="container">--%>

        <%--<div class="row"><div class="col-md-4"></div>--%>
            <%--<div class="col-md-4" >--%>

        <%--<form style="margin-top: 500px;border: solid; border-color: #1b1e21; padding: 10px">--%>

                <%--<div class="form-group">--%>
                    <%--<label for="exampleInputEmail1">Email address</label>--%>
                    <%--<input class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email" type="email">--%>
                     <%--</div>--%>

                <%--<div class="form-group">--%>
                    <%--<label for="exampleSelect1">Example select</label>--%>
                    <%--<select class="form-control" id="exampleSelect1">--%>
                        <%--<option>1</option>--%>
                        <%--<option>2</option>--%>
                        <%--<option>3</option>--%>
                        <%--<option>4</option>--%>
                        <%--<option>5</option>--%>
                    <%--</select>--%>
                <%--</div>--%>




                <%--<button type="submit" class="btn btn-primary">Submit</button>--%>

        <%--</form>--%>
            <%--</div>--%>
            <%--<div class="col-md-4"></div>--%>
    <%--</div>--%>

    <%--</div>--%>



    <%--</div>--%>
</html>