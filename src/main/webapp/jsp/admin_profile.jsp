<%@ page import="java.sql.*" %>
<%@ page import="java.io.Writer" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <title>Drop Downlist</title>
</head>
<body>

        <form action="../AdminServlet" method="post" >
            <!-- Method can be set as POST for hiding values in URL-->
            <h2>Form</h2>
            <div class="form-group">
                <label>Select Starting roll_no:</label>
                <input class="form-control" name="startingrollno" type="text" value="">

            </div>
            <div class="form-group">
                <label>Select ending roll_no:</label>
                <input class="form-control" name="endingrollno" type="text" value="">
                <%
                    String Startingroll=request.getParameter("startingrollno");
                    System.out.println(Startingroll);
                %>

            </div>
            <div class="form-group">
                <label>Select Name of Mentor:</label>
                <%
                    try
                    {   Connection con;
                        PreparedStatement ps = null;
                        Class.forName("com.mysql.jdbc.Driver");
                        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mentorsys", "hello", "hello");
                        System.out.println("SL3 "+ "database successfully opened.");
                        String sql = "SELECT name FROM mentor where flag=0";
                        ps = con.prepareStatement(sql);
                        ResultSet rs = ps.executeQuery();
                %>
                <p>Select Name :
                    <select name="mentorselected">
                        <%
                            while(rs.next())
                            {
                                String fname = rs.getString("name");
                        %>
                        <option value="<%=fname %>"><%=fname %></option>
                        <%
                            }
                        %>
                    </select>
                </p>

            </div>
            <input class="submit" name="submit" type="submit" value="Insert">
        </form>
    <%
        }
        catch(SQLException sqe)
        {

            System.out.println(sqe);
        }
    %>
</form>
</body>
</html>


