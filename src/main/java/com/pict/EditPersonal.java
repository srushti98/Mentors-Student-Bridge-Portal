package com.pict;

import com.pict.database.DatabaseConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;

import static java.lang.System.out;

@WebServlet("/EditPersonal")
public class EditPersonal extends HttpServlet {

    private Connection databaseConnection;

    public EditPersonal() {
        super();
        databaseConnection = DatabaseConnection.getDatabaseConnection();
    }


    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {
            Connection con;
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mentorsys", "hello", "hello");
            out.println("SL3 " + "database successfully opened.");
            ArrayList<String> error = new ArrayList<>();
            PreparedStatement ps = null;

            HttpSession session= request.getSession();
            if (session.getAttribute("stud_name")==null)
                response.sendRedirect("/index.jsp");
            String stud_name = (String)session.getAttribute("stud_name");
            String stud_mis_id = (String)session.getAttribute("stud_mis_id");

            String roll = null;
            String batch = null;
            String div = null;
            String email = null;
            String contact = null;
            Date dob = null;
            String gender = null;
            String bg = null;
            String year = null;
            String prn = null;
            String local = null;
            String permanent = null;

            roll = request.getParameter("stud_roll");
            div = request.getParameter("stud_div");
            batch = request.getParameter("stud_batch");
            email = request.getParameter("stud_email");
            contact = request.getParameter("stud_contact");
            dob = Date.valueOf(request.getParameter("stud_dob"));
            gender = request.getParameter("stud_gender");
            bg = request.getParameter("stud_bg");
            year = request.getParameter("stud_year");
            prn = request.getParameter("prn_no");
            local = request.getParameter("stud_local_add");
            permanent = request.getParameter("stud_per_add");

            int roll_int = Integer.parseInt(roll);
//            int contact_int = Integer.parseInt(contact.trim());
            int year_int = Integer.parseInt(year);

            ps=con.prepareStatement("update student set stud_roll_no=?,stud_batch=?,stud_blodgrp=?,stud_contact_no=?,stud_div=?,stud_dob=?,stud_email=?,stud_gender=?,stud_year=?,stud_prn=?,stud_local_add=?,stud_per_add=?,updated=1 where stud_mis_id=?");
            ps.setInt(1,roll_int);
            ps.setString(2,batch);
            ps.setString(3,bg);
            ps.setString(4,contact);
            ps.setString(5,div);
            ps.setDate(6,dob);
            ps.setString(7,email);
            ps.setString(8,gender);
            ps.setInt(9,year_int);
            ps.setString(10,prn);
            ps.setString(11,local);
            ps.setString(12,permanent);
            ps.setString(13,stud_mis_id);

            int rs = ps.executeUpdate();

            if (rs>0) {
                //JOptionPane.showMessageDialog(null, "Profile Edited!!!");
                error.add("Personal Details Updated");
                session.setAttribute("getAlert", error);
                response.sendRedirect("/jsp/student_profile.jsp");
            }

        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
