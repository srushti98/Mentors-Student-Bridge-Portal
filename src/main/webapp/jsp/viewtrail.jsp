<%@ page import="java.sql.*" %><%--
  Created by IntelliJ IDEA.
  User: srushti
  Date: 11/10/18
  Time: 11:14 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/css/bootstrap.min.css" integrity="sha384-Smlep5jCw/wG7hdkwQ/Z5nLIefveQRIY9nfy6xoR1uRYBtpZgI6339F5dgvm/e9B" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/icon?family=Material+Icons"
          rel="stylesheet">


    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.2/js/bootstrap.min.js" integrity="sha384-o+RDsa0aLu++PJvFqy8fFScvbHFLtbvScb8AjopnFD+iEQ7wo/CG0xlczd+2O/em" crossorigin="anonymous"></script><title>Register!!!</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.css" rel="stylesheet" />
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/1.1.3/sweetalert.min.js"></script>
    <link rel="stylesheet" href="/css/viewtrail.css">

    <title>Title</title>
</head>
<body>


<div class="container">

    <table class=".table-responsive" >
        <thead>
        <tr class=".table-responsive">
            <th >MIS-ID</th>
            <th >Name</th>
            <th >Profile</th>
        </tr>
        </thead>

        <%
            try
            {   Connection con;
                PreparedStatement ps = null;
                Class.forName("com.mysql.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mentorsys", "root", "root@123");
                System.out.println("SL3 "+ "database successfully opened.");
                //String menid = (String)session.getAttribute("stud_name");
                String menid="P123456787";
                //System.out.println(menid);
                String sql = "select s.stud_mis_id,s.stud_name from student s,studentmentorrel sm where  s.stud_mis_id=sm.stud_mis_id and sm.emp_id=? order by s.stud_roll_no;";

                ps = con.prepareStatement(sql);
                ps.setString(1,menid);
                ResultSet rs = ps.executeQuery();
                while (rs.next())
                {
                    System.out.print("hello");
                    String student_id=rs.getString("s.stud_mis_id");
                    String student_name=rs.getString("s.stud_name");
                    System.out.println(student_id + student_name);
        %>
        <tbody class=".table-responsive">
        <tr class=".table-responsive">
            <td style="color: #2f28d6"><%=student_id%></td>
            <td style="color: #2f28d6"><%=student_name%></td>
            <%--<td style="color: #2f28d6"><button class="button" href="/jsp/mentor_view_student.jsp?id=<%=student_id%>"><span style="font-size: x-large">View </span></button></td>--%>
            <td><a  href="/jsp/mentor_view_student.jsp?id=<%=student_id%>"><button class="button"><span style="font-size: x-large">View</span></button></a></td>
        </tr>

        <%
                }
            }
            catch(SQLException sqe)
            {
                System.out.println(sqe);
            }
        %>
        </tr>
        </tbody>
    </table>
</div>
</body>
</html>
