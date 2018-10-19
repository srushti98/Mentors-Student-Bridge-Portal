package com.pict;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.*;

import static java.lang.System.out;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    private Connection databaseConnection;
//    String checkUserQuery = "";

    public LoginServlet() {
        super();
        // databaseConnection = DatabaseConnection.getDatabaseConnection();
    }



    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
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
                    String username = resultSet.getString("emp_id");

                    HttpSession session= request.getSession();
                    session.setAttribute("mentor_id",username);
                    response.sendRedirect("/jsp/mentor_profile.jsp");
                }else{
                    response.sendRedirect("index.jsp");
                    out.print("Inavalid");
                }

            }
            else if(login_mis_id.startsWith("I") || login_mis_id.startsWith("E") || login_mis_id.startsWith("C"))
            {
                out.print("in student");
                preparedStatement = con.prepareStatement("select * from student where stud_mis_id=? and stud_password=?");
                preparedStatement.setString(1,login_mis_id);
                preparedStatement.setString(2,login_pswd);

                ResultSet resultSet = preparedStatement.executeQuery();
                if(resultSet.next()){
                    out.print("Success");
                    String username = resultSet.getString("stud_name");

                    HttpSession session= request.getSession();
                    session.setAttribute("stud_name",username);
                    session.setAttribute("stud_mis_id",login_mis_id);

                    response.sendRedirect("/jsp/student_profile.jsp");
                }else{
                    HttpSession session= request.getSession();
                    session.setAttribute("error","Error! Invalid user or password");
                    response.sendRedirect("index.jsp");
                    out.print("Inavalid");
                }

            }
            else if(login_mis_id.startsWith("A"))
            {
                out.print("in admin");
                preparedStatement = con.prepareStatement("select admin_id,admin_password from admin where admin_id=? and admin_password=?");
                preparedStatement.setString(1,login_mis_id);
                preparedStatement.setString(2,login_pswd);

                ResultSet resultSet = preparedStatement.executeQuery();
                if(resultSet.next()){
                    out.print("Success");

                    String username="ADMIN";
                    HttpSession session= request.getSession();
                    session.setAttribute("admin_id",username);

                    response.sendRedirect("/jsp/admin_index.jsp");
                }else{
                    response.sendRedirect("index.jsp");
                    out.print("Inavalid");
                }

            }




        }
        catch(SQLException e) {
            out.println("SQLException caught: " +e.getMessage());
        }

        catch (ClassNotFoundException e) {
            e.printStackTrace();
        }


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
