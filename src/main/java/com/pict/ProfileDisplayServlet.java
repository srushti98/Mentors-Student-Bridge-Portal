package com.pict;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.SQLException;

import static java.lang.System.out;

//@WebServlet("/ProfileDisplayServlet")
public class ProfileDisplayServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    public ProfileDisplayServlet() {
        super();
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        HttpSession session= request.getSession();
        if (session.getAttribute("stud_name")==null)
            response.sendRedirect("/index.jsp");
        String s_stud_name = (String)session.getAttribute("stud_name");
        String stud_mis_id = (String)session.getAttribute("stud_mis_id");
        out.println("SL3 " + "database successfully opened. in profiledisplay servlet");
//        int proid = Integer.parseInt(stud_mis_id);
        profilepicDAO dao = new profilepicDAO();

        try {
            profilepic pro = dao.get(stud_mis_id);

            request.setAttribute("pro", pro);

            String page = "/jsp/student_profile.jsp";
            RequestDispatcher requestDispatcher = request.getRequestDispatcher(page);
            requestDispatcher.forward(request, response);

            //response.sendRedirect("/jsp/student_profile.jsp");

        } catch (SQLException e) {
            e.printStackTrace();
        }


    }
}
