package com.pict;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

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
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mentorsys", "roo", "root@123");
        } catch (SQLException e) {
            e.printStackTrace();
        }
        out.println ("SL3 "+ "database successfully opened.");
        out.print(login_mis_id);
        out.print(login_pswd);

        HttpSession session=request.getSession();
        if (session.getAttribute("stud_name")!=null) {
            session.removeAttribute("stud_name");
            //session.invalidate();
        }
        if (session.getAttribute("mentor_id")!=null) {
            session.removeAttribute("mentor_id");
            //session.invalidate();
        }
        if (session.getAttribute("admin_id")!=null) {
            session.removeAttribute("admin_id");
            //session.invalidate();
        }
        response.sendRedirect("../index.jsp");


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session=request.getSession();
        if (session.getAttribute("stud_name")!=null) {
            session.removeAttribute("stud_name");
            //session.invalidate();
        }
        if (session.getAttribute("mentor_id")!=null) {
            session.removeAttribute("mentor_id");
            //session.invalidate();
        }
        if (session.getAttribute("admin_id")!=null) {
            session.removeAttribute("admin_id");
            //session.invalidate();
        }
        response.sendRedirect("../index.jsp");


    }

}
