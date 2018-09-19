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

import static java.lang.System.out;

@WebServlet("/LogoutServlet")
public class LogoutServlet extends HttpServlet {

    private Connection databaseConnection;

    public LogoutServlet () {
        super();
        databaseConnection = DatabaseConnection.getDatabaseConnection();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session=request.getSession();
        session.removeAttribute("stud_name");
        session.invalidate();
        response.sendRedirect("../index.jsp");
    }

}
