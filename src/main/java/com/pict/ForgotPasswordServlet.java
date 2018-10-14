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
import java.util.regex.Pattern;

import static java.lang.System.out;


@WebServlet("/ForgotPasswordServlet")
public class ForgotPasswordServlet extends HttpServlet {

    private static final String SUBJECT = "Reset Password link";
    private Connection connection;

    public ForgotPasswordServlet(){
        super();
        connection= DatabaseConnection.getDatabaseConnection();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            String vmFileContent = "<!DOCTYPE html>\n" +
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
                    "<br><a href=\"http://localhost:8080/jsp/reset_password.jsp\" class=\"button\">Reset Password HERE!</a>\n" +
                    "\n" +
                    "</body>\n" +
                    "</html>\n Regards, Team ViSuSuMa";

            Connection con;
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mentorsys", "hello", "hello");
            out.println("SL3 " + "database successfully opened.");
            PreparedStatement preparedStatement = null;
            ArrayList<String> error = new ArrayList<>();
            String email="";
            int roll_no=0;
            int flag=0;
            email=request.getParameter("email");
            String roll_no1=request.getParameter("roll_no");
            out.println(email);
            String emailRegex = "^[a-zA-Z0-9_+&*-]+(?:\\."+
                    "[a-zA-Z0-9_+&*-]+)*@" +
                    "(?:[a-zA-Z0-9-]+\\.)+[a-z" +
                    "A-Z]{2,7}$";
            Pattern pat = Pattern.compile(emailRegex);
            if(email=="" || roll_no1=="") {
                if(email=="")
                    error.add("please Enter an email id");
                if(roll_no1=="")
                    error.add("please Enter the roll number");
                HttpSession session = request.getSession();
                session.setAttribute("getAlert", error);//Just initialize a random variable.
                response.sendRedirect("/jsp/forgot_password.jsp");
            }
            else {
                roll_no= Integer.parseInt(roll_no1);
                if(pat.matcher(email).matches()){
                    preparedStatement=con.prepareStatement("select stud_password from student where stud_email=? and stud_roll_no=?");
                    preparedStatement.setString(1,email);
                    preparedStatement.setString(2,roll_no1);
                    ResultSet rs=preparedStatement.executeQuery();
                    if(rs.next()){
                        out.println(email);
                        out.println(roll_no1);
                        HttpSession session = request.getSession();
                        session.setAttribute("EmailID",email);
                        session.setAttribute("rollNumber",roll_no1);
                        String password=rs.getString("stud_password");
                        out.println("password: "+password);
                        session.setAttribute("getAlert", password);//Just initialize a random variable.
//                        request.getRequestDispatcher("/jsp/reset_password.jsp").forward(request,response);
                        SendMailServlet.sendMail(request,response, email, SUBJECT, vmFileContent);
                        flag=1;
                    }
                    else {
                        error.add("Invalid Roll Number or E-mail ID");
                        HttpSession session = request.getSession();
                        session.setAttribute("getAlert", error);//Just initialize a random variable.
                        response.sendRedirect("/jsp/forgot_password.jsp");
                    }
                }
                else{
                    error.add("Invalid Email ID");
                    HttpSession session = request.getSession();
                    session.setAttribute("getAlert", error);//Just initialize a random variable.
                    response.sendRedirect("/jsp/forgot_password.jsp");
                }
            }
            if(flag==1)
                response.sendRedirect("https://accounts.google.com/signin/v2/identifier?flowName=GlifWebSignIn&flowEntry=ServiceLogin");
        }
        catch (SQLException e){
            out.println("SQLException caught: " +e.getMessage());
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}