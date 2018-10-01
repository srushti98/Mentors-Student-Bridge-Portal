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

@WebServlet("/FileUploadServlet")
@MultipartConfig
public class FileUploadServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {
            Connection con;
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mentorsys", "hello", "hello");
            out.println("SL3 " + "database successfully opened.");
            PreparedStatement ps = null;

            HttpSession session = request.getSession();
            if (session.getAttribute("stud_name") == null)
                response.sendRedirect("/index.jsp");
            String stud_name = (String) session.getAttribute("stud_name");
            String stud_mis_id = (String) session.getAttribute("stud_mis_id");


            InputStream inputStream = null;
            Part filePart = request.getPart("photo");
            if (filePart != null) {
                // prints out some information for debugging
                System.out.println(filePart.getName());
                System.out.println(filePart.getSize());
                System.out.println(filePart.getContentType());

                // obtains input stream of the upload file
                inputStream = filePart.getInputStream();

                ps = con.prepareStatement("update student set stud_img=? where stud_mis_id=?");
                ps.setBlob(1, inputStream);
                ps.setString(2, stud_mis_id);

                int row = ps.executeUpdate();
                if (row > 0) {
                    System.out.println("Photo Uploaded!!!");
                }

            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
