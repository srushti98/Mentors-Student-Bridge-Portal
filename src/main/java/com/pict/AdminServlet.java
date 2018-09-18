package com.pict;

import com.pict.database.DatabaseConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.nio.file.spi.FileSystemProvider;
import java.sql.*;

import static java.lang.System.out;


@WebServlet("/AdminServlet")
public class AdminServlet extends HttpServlet {
    private Connection databaseConnection;
//    String checkUserQuery = "";

    public AdminServlet() {
        super();
        databaseConnection = DatabaseConnection.getDatabaseConnection();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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

            HttpSession session=request.getSession();
            session.setAttribute("getAlert", "Yes");//Just initialize a random variable.
            response.sendRedirect("/jsp/admin_index.jsp");


        }
        catch(SQLException e) {
            out.println("SQLException caught: " +e.getMessage());
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
