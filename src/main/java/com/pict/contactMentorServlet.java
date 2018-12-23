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

@WebServlet("/contactMentorServlet")
public class contactMentorServlet extends HttpServlet {

    private Connection databaseConnection;

    public contactMentorServlet(){
        super();
        databaseConnection= DatabaseConnection.getDatabaseConnection();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Connection con;
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mentorsys", "root", "root@123");
            out.println("SL3 " + "database successfully opened. in edit leave");
            ArrayList<String> error = new ArrayList<>();
            PreparedStatement ps = null;

            HttpSession session = request.getSession();
            if (session.getAttribute("stud_name") == null)
                response.sendRedirect("/index.jsp");
            String stud_name = (String) session.getAttribute("stud_name");
            String stud_mis_id = (String) session.getAttribute("stud_mis_id");
            PreparedStatement ps1=con.prepareStatement("select emp_id from studentmentorrel where stud_mis_id=?");
            ps1.setString(1,stud_mis_id);
            ResultSet rs1=ps1.executeQuery();
            rs1.next();

            String emp_id = rs1.getString("emp_id");
            String title = request.getParameter("reason");
            String description = request.getParameter("description");

            ps = con.prepareStatement("insert into student_mentor_communication(stud_mis_id, emp_id, title, description, date) value (?,?,?,?,CURRENT_DATE)");

            ps.setString(1,stud_mis_id);
            ps.setString(2,emp_id);
            ps.setString(3,title);
            ps.setString(4,description);

            int rs=ps.executeUpdate();
            if(rs>0){
                //JOptionPane.showMessageDialog(null, "Profile Edited!!!");
                //error.add("Leave Application Recorded");
                session.setAttribute("getAlert", " SENT TO MENTOR");

            }
            else{
                error.add("An error occured");
                session.setAttribute("getAlert",error);
            }
            response.sendRedirect("/jsp/student_profile.jsp");
        }
        catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
