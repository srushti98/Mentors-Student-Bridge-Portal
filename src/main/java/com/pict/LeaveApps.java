package com.pict;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.Date;

import static java.lang.System.out;

@WebServlet("/LeaveApps")
public class LeaveApps extends HttpServlet {

    private Connection databaseConnection;

    public LeaveApps() {
        super();
        //databaseConnection = DatabaseConnection.getDatabaseConnection();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {
            Connection con;
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mentorsys", "hello", "hello");
            out.println("SL3 " + "database successfully opened. in edit leave");
            ArrayList<String> error = new ArrayList<>();
            PreparedStatement ps = null;

            HttpSession session= request.getSession();
            if (session.getAttribute("stud_name")==null)
                response.sendRedirect("/index.jsp");
            String stud_name = (String)session.getAttribute("stud_name");
            String stud_mis_id = (String)session.getAttribute("stud_mis_id");

            String attendance_prior = null;
            java.sql.Date dob = null;
            Date start_date = null;
            Date end_date = null;
            String no_of_hrs = null;
            String reason = null;

            out.println("SL3 " + "database successfully opened. in edit leave 2");

            attendance_prior = request.getParameter("attendance_prior");
            start_date = java.sql.Date.valueOf(request.getParameter("start_date"));
            end_date = java.sql.Date.valueOf(request.getParameter("end_date")) ;
            no_of_hrs = request.getParameter("no_of_hrs");
            reason = request.getParameter("reason");

            System.out.println(start_date);
            System.out.println(end_date);
            System.out.println(reason);

            out.println("SL3 " + "database successfully opened. in edit leave 3");

            ps=con.prepareStatement("insert into leave_apps(stud_mis_id, attendance_prior, start_date, end_date, no_of_hrs, reason) values (?,?,?,?,?,?)");
            ps.setString(1,stud_mis_id);
            ps.setString(2,attendance_prior);
            ps.setDate(3, (java.sql.Date) start_date);
            ps.setDate(4, (java.sql.Date) end_date);
            ps.setString(5,no_of_hrs);
            ps.setString(6,reason);

            int rs = ps.executeUpdate();
            out.println("SL3 " + "database successfully opened. in edit leave 4");
            if (rs>0) {
                //JOptionPane.showMessageDialog(null, "Profile Edited!!!");
                error.add("Leave Application Recorded");
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
