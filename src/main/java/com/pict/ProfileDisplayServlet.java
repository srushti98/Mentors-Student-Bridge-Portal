package com.pict;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/ProfileDisplayServlet")
public class ProfileDisplayServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    public ProfileDisplayServlet() {
        super();
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        int proid = Integer.parseInt(request.getParameter("id"));
        profilepicDAO dao = new profilepicDAO();

        try {
            profilepic pro = dao.get(proid);

            request.setAttribute("pro", pro);

            String page = "jsp/student_profile.jsp";
            RequestDispatcher requestDispatcher = request.getRequestDispatcher(page);
            requestDispatcher.forward(request, response);

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
