package com.pict;

import com.pict.database.DatabaseConnection;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.*;
import java.sql.*;

import  org.apache.poi.hssf.usermodel.HSSFSheet;
import  org.apache.poi.hssf.usermodel.HSSFWorkbook;
import  org.apache.poi.hssf.usermodel.HSSFRow;
import  org.apache.poi.hssf.usermodel.HSSFCell;

import static java.lang.System.out;


@WebServlet("/ExportToExcelSheetServlet")
public class ExportToExcelSheetServlet extends HttpServlet {

    private Connection databaseconnection;
    private static final int BUFFER_SIZE = 4096;

//    private ExportToExcelSheetServlet(){
//        super();
//        databaseconnection= DatabaseConnection.getDatabaseConnection();
//    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Connection con;
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mentorsys", "hello", "hello");
            out.println("export " + "database successfully opened.");
            PreparedStatement ps = null;
            ps=con.prepareStatement("select * from studentmentorrel, student where student.stud_mis_id=studentmentorrel.stud_mis_id order by stud_roll_no");

            out.println("1");
            ResultSet rs=ps.executeQuery();

            HSSFWorkbook workbook=new HSSFWorkbook();
            out.println("2");
            HSSFSheet sheet=workbook.createSheet("Old_Mentor_student");
            out.println("3");
            HSSFRow row=sheet.createRow(1);

            out.println("4");
            HSSFCell cell;
            out.println("5");
            cell=row.createCell(0);
            cell.setCellValue("Mentor ID");
            cell=row.createCell(1);
            cell.setCellValue("MIS ID");
            out.println("6");

            int i=2;
            row = sheet.createRow(i);
            out.println("7");
            String mentor="";
            String mentor1="";
            while(rs.next()){
                cell = row.createCell(0);
                mentor1=rs.getString("emp_id");
                if(!mentor.equals(mentor1)) {
                    cell.setCellValue(mentor1);
                    mentor=mentor1;
                }
                cell = row.createCell(1);
                cell.setCellValue(rs.getString("stud_mis_id"));
                row=sheet.createRow(++i);
            }

            out.println("8");

            FileOutputStream out1=new FileOutputStream(new File("Student_mentor_information.xls"));

            workbook.write(out1);
            out1.close();

            out.println("File created successfully");

            String fileName ="Student_mentor_information.xls";

            InputStream inputStream = new FileInputStream(fileName);
            int fileLength = inputStream.available();

            System.out.println("fileLength = " + fileLength);

            ServletContext context = getServletContext();

            // sets MIME type for the file download
            String mimeType = context.getMimeType(fileName);
            if (mimeType == null) {
                mimeType = "application/octet-stream";
            }

            // set content properties and header attributes for the response
            response.setContentType(mimeType);
            response.setContentLength(fileLength);
            response.setContentType("application/vnd.ms-excel");
            String headerKey = "Content-Disposition";
            String headerValue = String.format("attachment; filename=\"%s\"", fileName);
            response.setHeader(headerKey, headerValue);

            // writes the file to the client
            OutputStream outStream = response.getOutputStream();

            byte[] buffer = new byte[BUFFER_SIZE];
            int bytesRead = -1;

            while ((bytesRead = inputStream.read(buffer)) != -1) {
                outStream.write(buffer, 0, bytesRead);
            }

            inputStream.close();
            outStream.close();

            con.close();

            HttpSession session= request.getSession();
            session.setAttribute("getAlert","Successfully");
            response.sendRedirect("/jsp/admin_index.jsp");
        }
        catch (ClassNotFoundException e) {
            e.printStackTrace();
            out.println(e);
        }
        catch (SQLException e) {
            e.printStackTrace();
            out.println(e);
        }
    }
}
