package com.pict;

import com.pict.database.DatabaseConnection;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.*;

import  org.apache.poi.hssf.usermodel.HSSFSheet;
import  org.apache.poi.hssf.usermodel.HSSFWorkbook;
import  org.apache.poi.hssf.usermodel.HSSFRow;
import  org.apache.poi.hssf.usermodel.HSSFCell;

import static java.lang.System.out;


@WebServlet("/ExportToExcelSheetServlet")
public class ExportToExcelSheetServlet extends HttpServlet {

    private Connection databaseconnection;

    private ExportToExcelSheetServlet(){
        super();
        databaseconnection= DatabaseConnection.getDatabaseConnection();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        try {
            Connection con;
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mentorsys", "hello", "hello");
            out.println("export " + "database successfully opened.");
            PreparedStatement ps = null;
            ps=con.prepareStatement("select * from studentmentorrel");

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

            int i=2;
            row = sheet.createRow(i);
            while(rs.next()){
                cell = row.createCell(0);
                cell.setCellValue(rs.getString("emp_id"));
                cell = row.createCell(1);
                cell.setCellValue(rs.getString("stud_mis_id"));
                row=sheet.createRow(++i);
            }

            FileOutputStream out1=new FileOutputStream(new File("Student_mentor_information.xls"));

            workbook.write(out1);
            out1.close();

            out.println("File created successfully");

            con.close();


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

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
