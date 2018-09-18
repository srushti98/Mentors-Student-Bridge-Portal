<%--
  Created by IntelliJ IDEA.
  User: srushti
  Date: 11/9/18
  Time: 2:48 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.sql.*" %>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Helloooo</title>
</head>
<body>

<%
    try {
        Connection con;
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mentorsys", "hello", "hello");
        out.println("SL3 " + "database successfully opened.");
        PreparedStatement preparedStatementstu = null;
        PreparedStatement preparedStatementmen = null;
        PreparedStatement preparedStatementallo = null;
        String mentormis="";
        String startmis="";

        int intStartingroll = Integer.parseInt(request.getParameter("startingrollno"));
        int intendingingroll = Integer.parseInt(request.getParameter("endingrollno"));
        String mentorselected = request.getParameter("mentorselected");

        String endingingroll=String.valueOf(intendingingroll);

        out.print(intStartingroll);
        out.println(endingingroll);
        out.println(mentorselected);

        for (int i=intStartingroll;i<=intendingingroll;i++)
        {
            String Startingroll=String.valueOf(i);
            preparedStatementstu = con.prepareStatement("select mis_id from student where roll_no=?");

            preparedStatementstu.setString(1, Startingroll);
            ResultSet resultSetstu = preparedStatementstu.executeQuery();
            if (resultSetstu.next()) {
                startmis = resultSetstu.getString("mis_id");

                out.println(startmis);

            } else {
                out.println("invalid");
            }

            preparedStatementmen = con.prepareStatement("select emp_id from mentor where name=?");
            preparedStatementmen.setString(1, mentorselected);
            ResultSet resultSetmen = preparedStatementmen.executeQuery();
            if (resultSetmen.next()) {
                mentormis = resultSetmen.getString("emp_id");

                out.println(mentormis);

            } else {
                out.println("invalid");
            }



                          /* createStatement() is used for create statement
                  object that is used for
            sending sql statements to the specified database. */
            preparedStatementallo = con.prepareStatement("insert into studentmentorrel values (?,?)");
            preparedStatementallo.setString(1, startmis);
            preparedStatementallo.setString(2, mentormis);
            int updateQuery = preparedStatementallo.executeUpdate();
            if (updateQuery != 0) {
                out.println("inserted successfully");
            }

            preparedStatementallo = con.prepareStatement("update student set stu_flag=1 where mis_id=? ");
            preparedStatementallo.setString(1, startmis);
            updateQuery = preparedStatementallo.executeUpdate();
            if (updateQuery != 0) {
                out.println("updated successfully");
            }

        }
        preparedStatementallo = con.prepareStatement("update mentor set flag=1 where emp_id=? ");
        preparedStatementallo.setString(1, mentormis);
        int updateQuery = preparedStatementallo.executeUpdate();
        if (updateQuery != 0) {
            out.println("updated successfully");
        }




        }
    catch(SQLException e) {
        out.println("SQLException caught: " +e.getMessage());
    }

%>

</body>
</html>
