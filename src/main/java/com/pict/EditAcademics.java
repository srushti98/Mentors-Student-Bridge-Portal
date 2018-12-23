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

@WebServlet("/EditAcademics")
public class EditAcademics extends HttpServlet {

    private Connection databaseConnection;

    public EditAcademics() {
        super();
        //databaseConnection = DatabaseConnection.getDatabaseConnection();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {
            Connection con;
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mentorsys", "root", "root@123");
            out.println("SL3 " + "database successfully opened. in edit academics");
            ArrayList<String> error = new ArrayList<>();
            PreparedStatement ps = null;

            HttpSession session= request.getSession();
            if (session.getAttribute("stud_name")==null)
                response.sendRedirect("/index.jsp");
            String stud_name = (String)session.getAttribute("stud_name");
            String stud_mis_id = (String)session.getAttribute("stud_mis_id");

            String ssc_sch = null;
            String ssc_pc = null;
            String hsc_sch = null;
            String hsc_pc = null;
            String pcm = null;
            String cet = null;
            String jee = null;
            String dip_pc = null;
            String adm_cat = null;
            String car_plan = null;
            String sub_interest = null;
            String preference = null;
            String affinity = null;

            out.println("SL3 " + "database successfully opened. in edit academics 2");

            ssc_sch = request.getParameter("ssc_sch");
            ssc_pc = request.getParameter("ssc_pc");
            hsc_sch = request.getParameter("hsc_sch");
            hsc_pc = request.getParameter("hsc_pc");
            pcm = request.getParameter("pcm");
            cet = request.getParameter("cet");
            jee = request.getParameter("jee");
            dip_pc = request.getParameter("dip_pc");
            adm_cat = request.getParameter("adm_cat");
            car_plan = request.getParameter("car_plan");
            sub_interest = request.getParameter("sub_interest");
            preference = request.getParameter("preference");
            affinity = request.getParameter("affinity");
            System.out.println(ssc_pc);
            System.out.println(hsc_pc);
            System.out.println(hsc_sch);

            float ssc_pc_int = Float.parseFloat(ssc_pc);
            float hsc_pc_int = Float.parseFloat(hsc_pc);
            //float m=
            int pcm_int = Integer.parseInt(pcm);
            int cet_int = Integer.parseInt(cet);
            int dip_pc_int = Integer.parseInt(dip_pc);
            int jee_int = Integer.parseInt(jee);

            out.println("SL3 " + "database successfully opened. in edit academics 2");

            ps=con.prepareStatement("update StudentAcademicDetails set SSC_school=?, SSC_percentage=?, HSC_school=?, HSC_percentage=?, PCM_marks_total=?, CET_marks=?, JEE_marks=?, diploma_percentage=?, admission_category=?, subject_area_interest=?, career_plan=?, preference=?, affinity=?,updated=1 where stud_mis_id=?");
            ps.setString(1,ssc_sch);
            ps.setFloat(2, ssc_pc_int);
            ps.setString(3,hsc_sch);
            ps.setFloat(4, hsc_pc_int);
            ps.setInt(5,pcm_int);
            ps.setInt(6,cet_int);
            ps.setInt(7,jee_int);
            ps.setInt(8,dip_pc_int);
            ps.setString(9,adm_cat);
            ps.setString(10,sub_interest);
            ps.setString(11,car_plan);
            ps.setString(12,preference);
            ps.setString(13,affinity);
            ps.setString(14,stud_mis_id);

            int rs = ps.executeUpdate();
            out.println("SL3 " + "database successfully opened. in edit academics 3");
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
