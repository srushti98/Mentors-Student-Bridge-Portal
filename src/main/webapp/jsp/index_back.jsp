<%@ page import="java.sql.*" %>

<html>
<head>
    <title>Using GET and POST Method to Read Form Data</title>
</head>

<body>

<%

    out.println("hellooooooooo");
    try {
        String login_mis_id=request.getParameter("login_mis_id");
        String login_pswd=request.getParameter("login_pswd");

        Connection con;
        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mentorsys", "hello", "hello");
        out.println ("SL3 "+ "database successfully opened.");
        out.print(login_mis_id);
        out.print(login_pswd);
        PreparedStatement preparedStatement = null;

        if(login_mis_id.startsWith("P"))
        {
            out.print("in mentor");
            preparedStatement = con.prepareStatement("select emp_id,mentorpassword from mentor where emp_id=? and mentorpassword=?");
            preparedStatement.setString(1,login_mis_id);
            preparedStatement.setString(2,login_pswd);

            ResultSet resultSet = preparedStatement.executeQuery();
            if(resultSet.next()){
                out.print("Success");
                response.sendRedirect("/layouts/mentor_profile.html");
            }else{
                out.print("Inavalid");
            }

        }
        else if(login_mis_id.startsWith("I"))
        {
            out.print("in student");
            preparedStatement = con.prepareStatement("select mis_id,studentpassword from student where mis_id=? and studentpassword=?");
            preparedStatement.setString(1,login_mis_id);
            preparedStatement.setString(2,login_pswd);

            ResultSet resultSet = preparedStatement.executeQuery();
            if(resultSet.next()){
                out.print("Success");

                response.sendRedirect("/layouts/f3.html");
            }else{
                out.print("Inavalid");
            }

        }
        else if(login_mis_id.startsWith("A"))
        {
            out.print("in student");
            preparedStatement = con.prepareStatement("select admin_id,admin_password from admin where admin_id=? and admin_password=?");
            preparedStatement.setString(1,login_mis_id);
            preparedStatement.setString(2,login_pswd);

            ResultSet resultSet = preparedStatement.executeQuery();
            if(resultSet.next()){
                out.print("Success");

                response.sendRedirect("/jsp/admin_profile.jsp");
            }else{
                out.print("Inavalid");
            }

        }




    }
    catch(SQLException e) {
        out.println("SQLException caught: " +e.getMessage());
    }


%>
</body>
</html>



