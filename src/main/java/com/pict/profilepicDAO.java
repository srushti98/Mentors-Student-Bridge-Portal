package com.pict;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.*;
import java.util.Base64;

import static java.lang.System.out;

public class profilepicDAO   {

    private HttpServletRequest request;
    private HttpServletResponse response;

    public profilepic get(String stud_mis_id) throws SQLException, IOException {
        profilepic pro = null;

        String sql = "SELECT stud_img FROM student WHERE stud_mis_id = ?";

        try  {
            Connection con;
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mentorsys", "hello", "hello");
            out.println("SL3 " + "database successfully opened. in profile pic dao");
            PreparedStatement statement = con.prepareStatement(sql);

//            HttpSession session = request.getSession();
//            if (session.getAttribute("stud_name") == null)
//                response.sendRedirect("/index.jsp");
//            String stud_name = (String) session.getAttribute("stud_name");
//            String stud_mis_id = (String) session.getAttribute("stud_mis_id");
            out.println("SL3 " + "database successfully " + stud_mis_id);


            statement.setString(1,stud_mis_id );
            ResultSet result = statement.executeQuery();

            if (result.next()) {
                pro = new profilepic();
                Blob blob = result.getBlob("stud_img");

                InputStream inputStream = blob.getBinaryStream();
                ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
                byte[] buffer = new byte[4096];
                int bytesRead = -1;

                while ((bytesRead = inputStream.read(buffer)) != -1) {
                    outputStream.write(buffer, 0, bytesRead);
                }

                byte[] imageBytes = outputStream.toByteArray();
                String base64Image = Base64.getEncoder().encodeToString(imageBytes);


                inputStream.close();
                outputStream.close();

                pro.setBase64Image(base64Image);
            }

        } catch (SQLException | IOException ex) {
            ex.printStackTrace();
            throw ex;
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }

       return pro;
    }

}
