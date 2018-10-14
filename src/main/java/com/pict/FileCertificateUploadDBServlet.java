package com.pict;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import static java.lang.System.out;

@WebServlet("/FileCertificateUploadDBServlet")
@MultipartConfig
public class FileCertificateUploadDBServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        InputStream inputStream = null; // input stream of the upload file

        // obtains the upload file part in this multipart request
        Part filePart = request.getPart("File");
        if (filePart != null) {
            // prints out some information for debugging
            System.out.println(filePart.getName());
            System.out.println(filePart.getSize());
            System.out.println(filePart.getContentType());

            // obtains input stream of the upload file
            inputStream = filePart.getInputStream();
        }
//        System.out.print("########in servelt#########");
        System.out.print(filePart.getSize());


        String message = null;  // message will be sent back to client

        try {
            // connects to the database
            Connection con;
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mentorsys", "hello", "hello");
            out.println("SL3 " + "database successfully opened.");
            PreparedStatement ps = null;

            HttpSession session = request.getSession();
            String stud_mis_id = (String) session.getAttribute("stud_mis_id");
            String stud_file_type="certificates";


            // constructs SQL statement
            String sql = "INSERT INTO stud_documents (stud_mis_id,stud_file,file_type) values (?, ?,?)";
            PreparedStatement statement = con.prepareStatement(sql);
            statement.setString(1, stud_mis_id);

            if (inputStream != null) {
                // fetches input stream of the upload file for the blob column
                statement.setBlob(2, inputStream);
            }
            statement.setString(3, stud_file_type);
            // sends the statement to the database server
            int row = statement.executeUpdate();
            if (row > 0) {
//                message = "File uploaded and saved into database";
                //HttpSession session = request.getSession();
                session.setAttribute("getAlert", "successfully submitted");//Just initialize a random variable.
                response.sendRedirect("/forms1/upload_docs.jsp");
            }
        } catch (SQLException ex) {
            message = "ERROR: " + ex.getMessage();
            ex.printStackTrace();
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        // sets the message in request scope
//            request.setAttribute("Message", message);
//
//            // forwards to the message page
//            getServletContext().getRequestDispatcher("/jsp/Message.jsp").forward(request, response);
    }


    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
