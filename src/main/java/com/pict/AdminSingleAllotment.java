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

@WebServlet("/AdminSingleAllotment")
public class AdminSingleAllotment extends HttpServlet {
    private Connection databaseConnection;

    public AdminSingleAllotment() {
        super();
        databaseConnection = DatabaseConnection.getDatabaseConnection();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Connection con;
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mentorsys", "root", "root@123");
            out.println("SL3 " + "database successfully opened.");
            PreparedStatement not_existing_roll_no = null;
            PreparedStatement preparedStatementstu = null;
            PreparedStatement preparedStatementmen = null;
            PreparedStatement preparedStatementallo = null;
            PreparedStatement err = null;
            ArrayList<String> error = new ArrayList<>();
            String mentormis = "";
            String startmis = "";
            int test_flag = 0;
            int test_roll_no = 0;
            int not_exist = 0;

            int intStartingroll = Integer.parseInt(request.getParameter("startingrollno"));
            String mentorselected = request.getParameter("mentorselected");
            String Startingroll = request.getParameter("startingrollno");
            not_existing_roll_no = con.prepareStatement("select stud_roll_no from student where stud_roll_no=? ");
            not_existing_roll_no.setString(1,Startingroll);
            ResultSet rs = not_existing_roll_no.executeQuery();
            if(!rs.next()){
                error.add("Roll number " + Startingroll + " does not exist");
                not_exist = 1;
            }
            if(not_exist!=1){
                preparedStatementstu = con.prepareStatement("select stud_mis_id, stud_roll_no, stud_flag from student where stud_roll_no=?");
                preparedStatementstu.setString(1, Startingroll);
                ResultSet resultSetstu = preparedStatementstu.executeQuery();
                if (resultSetstu.next()) {
                    startmis = resultSetstu.getString("stud_mis_id");
                    test_flag = resultSetstu.getInt("stud_flag");
                    test_roll_no = resultSetstu.getInt("stud_roll_no");
                    if (test_flag == 1) {

                        error.add("The roll number " + test_roll_no + " is already alloted");
                    }
                    else
                    {
                        preparedStatementmen = con.prepareStatement("select emp_id from mentor where mentorname=?");
                        preparedStatementmen.setString(1, mentorselected);
                        ResultSet resultSetmen = preparedStatementmen.executeQuery();
                        if (resultSetmen.next()) {
                            mentormis = resultSetmen.getString("emp_id");

                            out.println(mentormis);

                        } else {
                            out.println("invalid");
                        }

                        preparedStatementallo = con.prepareStatement("insert into studentmentorrel(stud_mis_id, emp_id) values (?,?)");
                        preparedStatementallo.setString(1, startmis);
                        preparedStatementallo.setString(2, mentormis);
                        int updateQuery = preparedStatementallo.executeUpdate();
                        if (updateQuery != 0) {
                            out.println("inserted successfully");
                        }

                        preparedStatementallo = con.prepareStatement("update student set stud_flag=1 where stud_mis_id=? ");
                        preparedStatementallo.setString(1, startmis);
                        updateQuery = preparedStatementallo.executeUpdate();
                        if (updateQuery != 0) {
                            out.println("updated successfully");
                        }

                    }
                }
                else {
                    out.println("invalid");
                }


            }

            if(error.isEmpty()) {


                HttpSession session = request.getSession();
                session.setAttribute("getAlert", mentormis);//Just initialize a random variable.
                response.sendRedirect("/jsp/admin_index.jsp");

            }
            else {
                HttpSession session = request.getSession();
                System.out.print(error);
                session.setAttribute("getAlert", error);//Just initialize a random variable.
                response.sendRedirect("/jsp/admin_allotsingle.jsp");
            }

        } catch (SQLException e) {
            out.println("SQLException caught: " + e.getMessage());
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}