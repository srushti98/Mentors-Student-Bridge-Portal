package com.pict;

import com.pict.database.DatabaseConnection;

import javax.persistence.criteria.CriteriaBuilder;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;

import static java.lang.System.getProperty;
import static java.lang.System.out;

@WebServlet("/resetPasswordServlet")
public class resetPasswordServlet extends HttpServlet {
    private Connection connection;
    public resetPasswordServlet(){
        super();
        connection= DatabaseConnection.getDatabaseConnection();
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try{
            ArrayList error=new ArrayList();
            Connection con;
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mentor_sys", "hello", "hello");
            PreparedStatement preparedStatement=null;
            out.println("hello world1");
            String new_password=request.getParameter("password");
            out.println("hello world2");
            String email= (String)request.getParameter("email");
            out.println("hello world3");
            String roll_no1=(String)request.getParameter("roll_no");
            out.println(email);
            out.println(roll_no1);
            out.println(new_password);
            out.println("hello world4");
            int roll_no= Integer.parseInt(roll_no1);
            preparedStatement=con.prepareStatement("update student set stud_password=? where stud_roll_no=? and stud_email=?");
            preparedStatement.setString(1,new_password);
            preparedStatement.setString(3,email);
            preparedStatement.setInt(2,roll_no);
            if(preparedStatement.executeUpdate()!=0) {
                out.println("SUccess");
                HttpSession session = request.getSession();
                session.setAttribute("getAlert", new_password);//Just initialize a random variable.
                response.sendRedirect("/index.jsp");
            }
            else {
                error.add("Not able to be updated due to some unknown reason");
                HttpSession session = request.getSession();
                session.setAttribute("getError", error);//Just initialize a random variable.
                response.sendRedirect("/index.jsp");
            }

        }
        catch (SQLException e){
            out.println("SQLException caught: " +e.getMessage());
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
