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
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;

import static java.lang.System.out;

@WebServlet("/EditExtraDetails")
public class EditExtraDetails extends HttpServlet {

    private Connection databaseConnection;

    public EditExtraDetails() {
        super();
        //databaseConnection = DatabaseConnection.getDatabaseConnection();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {
            Connection con;
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mentorsys", "hello", "hello");
            out.println("SL3 " + "database successfully opened. in edit extra");
            ArrayList<String> error = new ArrayList<>();
            PreparedStatement ps = null;

            HttpSession session= request.getSession();
            if (session.getAttribute("stud_name")==null)
                response.sendRedirect("/index.jsp");
            String stud_name = (String)session.getAttribute("stud_name");
            String stud_mis_id = (String)session.getAttribute("stud_mis_id");

            String stud_hobbies = null;
            String stud_extra_activities = null;
            String stud_sports = null;
            String stud_achievements = null;
            String stud_scholarships = null;

            out.println("SL3 " + "database successfully opened. in edit extra 2");

            stud_hobbies = request.getParameter("stud_hobbies");
            stud_extra_activities = request.getParameter("stud_extra_activities");
            stud_sports = request.getParameter("stud_sports");
            stud_achievements = request.getParameter("stud_achievements");
            stud_scholarships = request.getParameter("stud_scholarships");

            System.out.println(stud_hobbies);
            System.out.println(stud_extra_activities);
            System.out.println(stud_achievements);

            out.println("SL3 " + "database successfully opened. in edit extra 3");

            ps=con.prepareStatement("update StudentExtraDetails set stud_hobbies=?, stud_extra_activities=?, stud_sports=?, stud_achievements=?, stud_scholarships=? where stud_mis_id=?");
            ps.setString(1,stud_hobbies);
            ps.setString(2,stud_extra_activities);
            ps.setString(3,stud_sports);
            ps.setString(4,stud_achievements);
            ps.setString(5,stud_scholarships);
            ps.setString(6,stud_mis_id);

            int rs = ps.executeUpdate();
            out.println("SL3 " + "database successfully opened. in edit extra 3");
            if (rs>0) {
                //JOptionPane.showMessageDialog(null, "Profile Edited!!!");
                error.add("Extra Details");
                session.setAttribute("getAlert", error);

            }
            response.sendRedirect("/jsp/student_profile.jsp");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }



    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
