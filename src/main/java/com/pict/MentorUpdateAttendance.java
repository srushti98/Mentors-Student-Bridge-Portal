package com.pict;

import com.pict.database.DatabaseConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import static java.lang.System.out;

@WebServlet("/MentorUpdateAttendance")
public class MentorUpdateAttendance extends HttpServlet {
    private Connection databaseConnection;

    public MentorUpdateAttendance() {
        super();
        databaseConnection = DatabaseConnection.getDatabaseConnection();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Connection con;
            PreparedStatement ps = null;
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mentorsys", "hello", "hello");
            String activityid = (String)request.getParameter("id");
            String language="";
            String lang[] = request.getParameterValues("attendance");
            int i;
            out.println("Students attended are :");
            out.println(activityid);
            for(i=0;i<lang.length;i++)
            {
                language=lang[i];
                ps = con.prepareStatement("update student_activity_list set attended=1 where stud_mis_id=? and activity_id=?");
                ps.setString(1, language);
                ps.setString(2, activityid);
                int updateQuery = ps.executeUpdate();
                if (updateQuery != 0) {
                    out.println("updated successfully");
                }
            }
            response.sendRedirect("/jsp/mentor_showmeetings.jsp");
        }
        catch (SQLException e) {
            out.println("SQLException caught: " + e.getMessage());
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

