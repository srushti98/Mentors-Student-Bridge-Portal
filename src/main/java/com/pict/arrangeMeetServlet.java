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

import static java.lang.System.out;

@WebServlet("/arrangeMeetServlet")
public class arrangeMeetServlet extends HttpServlet {
    private Connection databaseConnection;
    private int flag=0;

    public arrangeMeetServlet(){
        super();
        databaseConnection= DatabaseConnection.getDatabaseConnection();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {
            HttpSession sess=request.getSession(false);
            String mentor_mis= (String) sess.getAttribute("stud_name");
            String Title=request.getParameter("name");
            String Agenda=request.getParameter("meeting_agenda");
            String date1 =request.getParameter("meeting_date");
//            SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy-mm-dd");
//            Date date1= (Date) simpleDateFormat.parse(date);
            Date date=Date.valueOf(date1);
            Connection con;
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mentorsys", "hello", "hello");
            out.println ("SL3 "+ "database successfully opened.");
            PreparedStatement preparedStatement=null;
            PreparedStatement preparedStatement2=null;



            preparedStatement=con.prepareStatement("insert into activity_list (mentor_id, activity_name, activity_date, activity_title, activity_content) values(?, 'meeting', ?, ?, ?)");
            preparedStatement.setString(1,mentor_mis);
            preparedStatement.setDate(2, date);
            preparedStatement.setString(3,Title);
            preparedStatement.setString(4,Agenda);
            preparedStatement.execute();

            preparedStatement=con.prepareStatement("select distinct stud_email from student s,student_activity_list sa, activity_list al where al.mentor_id=? and al.activity_id=sa.activity_id and sa.stud_mis_id=s.stud_mis_id");
            preparedStatement.setString(1,mentor_mis);
            ResultSet resultSet=preparedStatement.executeQuery();
            while (resultSet.next()){
                String file_content="<!DOCTYPE html>\n" +
                        "<html>\n" +
                        "<head>\n" +
                        "<style>\n" +
                        ".button {\n" +
                        "  display: inline-block;\n" +
                        "  padding: 15px 25px;\n" +
                        "  font-size: 24px;\n" +
                        "  cursor: pointer;\n" +
                        "  text-align: center;\n" +
                        "  text-decoration: none;\n" +
                        "  outline: none;\n" +
                        "  color: #fff;\n" +
                        "  background-color: #4CAF50;\n" +
                        "  border: none;\n" +
                        "  border-radius: 15px;\n" +
                        "  box-shadow: 0 9px #999;\n" +
                        "}\n" +
                        "\n" +
                        ".button:hover {background-color: #3e8e41}\n" +
                        "\n" +
                        ".button:active {\n" +
                        "  background-color: #3e8e41;\n" +
                        "  box-shadow: 0 5px #666;\n" +
                        "  transform: translateY(4px);\n" +
                        "}\n" +
                        "</style>" +
                        "</head>\n" +
                        "<body>\n" +
                        "\n" +
                        "<h2>Follow The Below Link</h2>\n" +
                        "\n" +
                        "<h4>The mentor has arranged a meeting</h4>\n" +
                        "\n" +
                        "<br><a href=\"http://localhost:8080\" class=\"button\">Check The Date!</a>\n" +
                        "\n" +
                        "</body>\n" +
                        "</html>\n Regards, Team ViSuSuMa";
                String subject="**Urgent**";
                String email=resultSet.getString("stud_email");
                SendMailServlet.sendMail(request,response, email, subject, file_content);
                flag=1;
            }
    }
        catch(SQLException e) {
            out.println("SQLException caught: " +e.getMessage());
        }

        catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        if (flag==1) {
            HttpSession session = request.getSession();
            session.setAttribute("getAlert", "YOUR MEETING HAS BEEN SCHEDULED");
            response.sendRedirect("/jsp/mentor_meeting.jsp");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
