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

import static java.lang.System.out;


@WebServlet("/AdminChangeMentor")
public class AdminChangeMentor extends HttpServlet {
    //    String checkUserQuery = "";

    public AdminChangeMentor() {
        super();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Connection con;
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mentorsys", "root", "root@123");
            out.println("exporting " + "database successfully opened.");
            PreparedStatement preparedStatementstu = null;
            PreparedStatement preparedStatementmen = null;
            PreparedStatement preparedStatementallo = null;
            PreparedStatement err = null;
            PreparedStatement not_existing_roll_no = null;
            ArrayList<String> error = new ArrayList<>();
            String mentormis="";

            String startmis="";
            int test_flag=0;
            int test_roll_no=0;
            int not_exist=0;

            int intStartingroll = Integer.parseInt(request.getParameter("startingrollno"));
            //int intendingingroll = Integer.parseInt(request.getParameter("endingrollno"));
            String mentorselected = request.getParameter("mentorselected");

            //String endingingroll=String.valueOf(intendingingroll);

            out.print(intStartingroll);
            //out.println(endingingroll);
            out.println(mentorselected);
            not_existing_roll_no=con.prepareStatement("select stud_roll_no from student where stud_roll_no=?");
            not_existing_roll_no.setInt(1, intStartingroll);
            ResultSet rs = not_existing_roll_no.executeQuery();
            if(!rs.next()){
                        error.add("Roll number " + intStartingroll + " does not exist");
                        not_exist = 1;

            }
            if(not_exist!=1){
                String Startingroll = String.valueOf(intStartingroll);
                preparedStatementstu = con.prepareStatement("select stud_mis_id, stud_roll_no, stud_flag from student where stud_roll_no=?");
                preparedStatementstu.setString(1, Startingroll);
                ResultSet resultSetstu = preparedStatementstu.executeQuery();
                if (resultSetstu.next()) {
                    startmis = resultSetstu.getString("stud_mis_id");
                    test_flag = resultSetstu.getInt("stud_flag");
                    test_roll_no = resultSetstu.getInt("stud_roll_no");
                }
                preparedStatementmen = con.prepareStatement("select emp_id from mentor where mentorname=?");
                    preparedStatementmen.setString(1, mentorselected);
                    ResultSet resultSetmen = preparedStatementmen.executeQuery();
                    if (resultSetmen.next()) {
                        mentormis = resultSetmen.getString("emp_id");

                        out.println(mentormis);

                    } else {
                        out.println("invalid");
                    }

                preparedStatementallo = con.prepareStatement("update studentmentorrel set changeflag=1 where stud_mis_id=?  ");
                preparedStatementallo.setString(1, startmis);
                int updateQuery = preparedStatementallo.executeUpdate();
                if (updateQuery != 0) {
                    out.println("updated successfully");
                }

                preparedStatementallo = con.prepareStatement("insert into studentmentorrel(stud_mis_id,emp_id) values (?,?)");
                    preparedStatementallo.setString(1, startmis);
                    preparedStatementallo.setString(2, mentormis);
                    updateQuery = preparedStatementallo.executeUpdate();
                    if (updateQuery != 0) {
                        out.println("inserted successfully");
                    }
            }
            if(error.isEmpty()) {
                preparedStatementallo = con.prepareStatement("update mentor set mentor_flag=1 where emp_id=? ");
                preparedStatementallo.setString(1, mentormis);
                int updateQuery = preparedStatementallo.executeUpdate();
                if (updateQuery != 0) {
                    out.println("updated successfully");
                }

                HttpSession session = request.getSession();
                System.out.print(mentormis);
                session.setAttribute("getAlert", mentormis);//Just initialize a random variable.
                response.sendRedirect("/jsp/admin_index.jsp");

            }
            else
            {
                System.out.print(error);
                HttpSession session = request.getSession();
                session.setAttribute("getAlert", error);//Just initialize a random variable.
                response.sendRedirect("/jsp/admin_profile.jsp");
            }
        }


        catch(SQLException e) {
            out.println("SQLException caught: " +e.getMessage());
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}



