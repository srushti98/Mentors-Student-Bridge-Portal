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

@WebServlet("/EditParentDetails")
public class EditParentDetails extends HttpServlet {

    private Connection databaseConnection;

    public EditParentDetails() {
        super();
        //databaseConnection = DatabaseConnection.getDatabaseConnection();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {
            Connection con;
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mentorsys", "hello", "hello");
            out.println("SL3 " + "database successfully opened. in edit parents");
            ArrayList<String> error = new ArrayList<>();
            PreparedStatement ps = null;

            HttpSession session= request.getSession();
            if (session.getAttribute("stud_name")==null)
                response.sendRedirect("/index.jsp");
            String stud_name = (String)session.getAttribute("stud_name");
            String stud_mis_id = (String)session.getAttribute("stud_mis_id");

            String father_name = null;
            String father_edu = null;
            String father_occ = null;
            String father_contact = null;
            String father_email = null;
            String father_add = null;
            String mother_name = null;
            String mother_edu = null;
            String mother_occ = null;
            String mother_contact = null;
            String mother_email = null;
            String mother_add = null;
            String siblings = null;
            String sib_academics = null;

            out.println("SL3 " + "database successfully opened. in edit parents 2");

            father_name = request.getParameter("father_name");
            father_edu = request.getParameter("father_edu");
            father_occ = request.getParameter("father_occ");
            father_contact = request.getParameter("father_contact");
            father_email = request.getParameter("father_email");
            father_add = request.getParameter("father_add");
            mother_name = request.getParameter("mother_name");
            mother_edu = request.getParameter("mother_edu");
            mother_occ = request.getParameter("mother_occ");
            mother_contact = request.getParameter("mother_contact");
            mother_email = request.getParameter("mother_email");
            mother_add = request.getParameter("mother_add");
            siblings = request.getParameter("siblings");
            sib_academics = request.getParameter("sib_academics");

            System.out.println(father_name);
            System.out.println(mother_name);
            System.out.println(siblings);

//            int father_contact_int = Integer.parseInt(father_contact);
//            int mother_contact_int = Integer.parseInt(mother_contact);
            int siblings_int = Integer.parseInt(siblings);

            out.println("SL3 " + "database successfully opened. in edit parents 3");

            ps=con.prepareStatement("update Student_parent_details set father_name=?, father_edu=?, father_occ=?, father_contact=?, father_email=?, father_add=?, mother_name=?, mother_edu=?, mother_occ=?, mother_contact=?, mother_email=?, mother_add=?, siblings=?,sibling_academics=?,updated=1 where stud_mis_id=?");
            ps.setString(1,father_name);
            ps.setString(2,father_edu);
            ps.setString(3,father_occ);
            ps.setString(4,father_contact);
            ps.setString(5,father_email);
            ps.setString(6,father_add);
            ps.setString(7,mother_name);
            ps.setString(8,mother_edu);
            ps.setString(9,mother_occ);
            ps.setString(10,mother_contact);
            ps.setString(11,mother_email);
            ps.setString(12,mother_add);
            ps.setInt(13,siblings_int);
            ps.setString(14,sib_academics);
            ps.setString(15,stud_mis_id);

            int rs = ps.executeUpdate();
            out.println("SL3 " + "database successfully opened. in edit parent 3");
            if (rs>0) {
                //JOptionPane.showMessageDialog(null, "Profile Edited!!!");
                error.add("Academic Details");
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
