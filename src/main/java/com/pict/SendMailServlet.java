package com.pict;

import com.pict.database.DatabaseConnection;

import javax.persistence.criteria.CriteriaBuilder;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

import javax.mail.internet.InternetAddress;
import java.security.Security;
import java.sql.*;
import java.util.*;
import javax.mail.internet.MimeMessage;
import  javax.mail.Session;
import java.util.Date;
import java.util.Properties;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Transport;
import javax.mail.PasswordAuthentication;
import javax.servlet.http.HttpSession;

import java.io.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.regex.Pattern;

import java.util.Locale;



import static java.lang.System.out;

@WebServlet("/SendMailServlet")
public class SendMailServlet extends HttpServlet {

    private static final String USERNAME = "visrusuma@gmail.com";
    private static final String PASSWORD = "vrspsrms";

    private static final String HOST = "smtp.gmail.com";
    private static final String PORT = "465";

    protected static void sendMail(HttpServletRequest request, HttpServletResponse response, String to,String SUBJECT, String vmFileContent) throws ServletException, IOException {
        try {
            out.println("Send reset link to: "+to);
            Connection con;
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mentor_sys", "hello", "hello");
            PreparedStatement preparedStatement=null;
            Security.addProvider(new com.sun.net.ssl.internal.ssl.Provider());
            Properties properties=new Properties();
            properties.setProperty("mail.smtp.host", HOST);
            properties.setProperty("mail.stmp.user", USERNAME);
            properties.setProperty("mail.smtp.starttls.enable", "true");
            properties.setProperty("mail.smtps.auth", "true");
            properties.setProperty("mail.smtp.port", "587");
            properties.setProperty("mail.smtp.connectiontimeout", "30000");
            properties.setProperty("mail.smtp.timeout", "30000");
            properties.setProperty("mail.smtp.password", PASSWORD);

//            Session session = Session.getInstance(properties, new javax.mail.Authenticator() {
//                protected PasswordAuthentication getPasswordAuthentication() {
//                    String username = USERNAME;
//                    String password = PASSWORD;
//                    out.println("Authentication in progress");
//                    return new PasswordAuthentication(username, password);
//                }
//            });
            Session session = Session.getDefaultInstance(properties, new javax.mail.Authenticator()
            {
                protected PasswordAuthentication getPasswordAuthentication()
                {
                    return new PasswordAuthentication(USERNAME,PASSWORD);
                }
            });

            String from = USERNAME;
            String subject = SUBJECT;
            MimeMessage msg = new MimeMessage(session);

            try{
                msg.setFrom(new InternetAddress(from));
                InternetAddress addressTo = new InternetAddress(to);
                msg.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
                msg.setSubject(subject);

                //  Send the complete message parts
                out.println("going to send!");
                msg.setContent(vmFileContent,"text/html");
                out.println("about to send!");
                Transport transport = session.getTransport("smtp");
                out.println("about to connect!");
                transport.connect("smtp.gmail.com",587,USERNAME,PASSWORD);
                out.println("connected!");
                transport.sendMessage(msg,msg.getRecipients(Message.RecipientType.TO));
                transport.close();
                out.println("sent!");

            }catch (Exception exc){
                System.out.println(exc);
            }
        }
        catch(SQLException e){
            out.println("SQL Exception caught "+e.getMessage());
        }
        catch(ClassNotFoundException c){
            c.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
