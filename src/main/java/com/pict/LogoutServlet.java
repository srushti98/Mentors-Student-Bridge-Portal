package com.pict;

import com.pict.database.DatabaseConnection;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.*;

import static java.lang.System.out;

@WebServlet("/LogoutServlet")
public class LogoutServlet extends HttpServlet {

    private Connection databaseConnection;

    public LogoutServlet () {
        super();
        //databaseConnection = DatabaseConnection.getDatabaseConnection();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        String login_mis_id=request.getParameter("login_mis_id");
        String login_pswd=request.getParameter("login_pswd");

        Connection con;
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        try {
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mentor_sys", "hello", "hello");
        } catch (SQLException e) {
            e.printStackTrace();
        }
        out.println ("SL3 "+ "database successfully opened.");
        out.print(login_mis_id);
        out.print(login_pswd);

        HttpSession session=request.getSession();
        session.removeAttribute("stud_name");
        session.invalidate();
        response.sendRedirect("../index.jsp");


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session=request.getSession();
        session.removeAttribute("stud_name");
        session.invalidate();
        response.sendRedirect("../index.jsp");


    }

}
