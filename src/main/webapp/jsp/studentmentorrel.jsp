<%--
  Created by IntelliJ IDEA.
  User: vipul
  Date: 18/9/18
  Time: 9:59 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.sql.*" %>
<%@ page import="java.io.Writer" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Drop Downlist</title>

    <meta name="viewport" content="width=device-width,initial-state=1"/>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.min.css">
    <script src="<%=request.getContextPath()%>/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container-fluid">
    <div class="row">
        <div class="col-md-4 form"></div>
        <div class="col-md-4 form">
            <table class='table table-striped'>
                <tr>
                    <th>Student MIS ID</th>
                    <th>Mentor MIS ID</th>
                </tr>
                <%
                try
                {   Connection con;
                    PreparedStatement ps = null;
                    Class.forName("com.mysql.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mentorsys", "hello", "hello");
                    System.out.println("SL3 "+ "database successfully opened.");
                    String sql = "SELECT * FROM studentmentorrel";
                    ps = con.prepareStatement(sql);
                    ResultSet rs = ps.executeQuery();
                    while (rs.next())
                        {
                            String mentor_ID=rs.getString("emp_id");
                            String student_ID=rs.getString("mis_id");
                %>
                <th><%=mentor_ID%></th>
                <th><%=student_ID%></th>
                <%
                        }
                        }
                        catch(SQLException sqe)
                        {
                            System.out.println(sqe);
                        }
                %>
</body>
</html>
