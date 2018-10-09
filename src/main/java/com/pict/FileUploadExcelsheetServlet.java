package com.pict;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;

@WebServlet("/FileUploadExcelsheetServlet")
@MultipartConfig
public class FileUploadExcelsheetServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        InputStream inputStream = null; // input stream of the upload file
//
//        // obtains the upload file part in this multipart request

        Part filePart = request.getPart("File");
        if (filePart != null) {
            // prints out some information for debugging
            System.out.println(filePart.getName());
            System.out.println(filePart.getSize());
            System.out.println(filePart.getContentType());

            // obtains input stream of the upload file
            inputStream = filePart.getInputStream();
        }



        Connection con;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mentorsys", "hello", "hello");
            System.out.println("SL3 " + "database successfully opened.");
            PreparedStatement ps = null;

            ArrayList dataHolder=readExcelFile(inputStream);
            String query="insert into trail values(?,?)";
            ps=con.prepareStatement(query);
            int count=0;
            ArrayList cellStoreArrayList=null;
            //For inserting into database
            System.out.print(dataHolder.size());
            //System.out.print(dataHolder.l());
            for (int i=1;i < dataHolder.size(); i++) {
                cellStoreArrayList=(ArrayList)dataHolder.get(i);
                ps.setString(1,((HSSFCell)cellStoreArrayList.get(0)).toString());
                ps.setString(2,((HSSFCell)cellStoreArrayList.get(1)).toString());
                //ps.setString(3,((HSSFCell)cellStoreArrayList.get(2)).toString());
                count= ps.executeUpdate();
                System.out.print(((HSSFCell)cellStoreArrayList.get(1)).toString() + "t");
            }
            if (count>0)
            {
                System.out.print("inserted successfully");
                response.sendRedirect("/jsp/admin_index.jsp");
            }
            else
            {
                System.out.print("data did not insert");
            }


        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
         catch (SQLException e) {
            e.printStackTrace();
        }





    }
    private static ArrayList readExcelFile(InputStream fileName)
    {
        /** --Define a ArrayList
         --Holds ArrayList Of Cells
         */
        ArrayList cellArrayLisstHolder = new ArrayList();
        try{
            /** Creating Input Stream**/
            //FileInputStream myInput = new FileInputStream(fileName.toFile());
            /** Create a POIFSFileSystem object**/
            POIFSFileSystem myFileSystem = new POIFSFileSystem(fileName);
            /** Create a workbook using the File System**/
            HSSFWorkbook myWorkBook = new HSSFWorkbook(myFileSystem);
            /** Get the first sheet from workbook**/
            HSSFSheet mySheet = myWorkBook.getSheetAt(0);
            /** We now need something to iterate through the cells.**/
            Iterator rowIter = mySheet.rowIterator();
            while(rowIter.hasNext()){
                HSSFRow myRow = (HSSFRow) rowIter.next();
                Iterator cellIter = myRow.cellIterator();
                ArrayList cellStoreArrayList=new ArrayList();
                while(cellIter.hasNext()){
                    HSSFCell myCell = (HSSFCell) cellIter.next();
                    cellStoreArrayList.add(myCell);
                }
                cellArrayLisstHolder.add(cellStoreArrayList);
            }
        }catch (Exception e){e.printStackTrace(); }

        return cellArrayLisstHolder;
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
//package com.pict;
//
//        import javax.servlet.ServletException;
//        import javax.servlet.annotation.MultipartConfig;
//        import javax.servlet.annotation.WebServlet;
//        import javax.servlet.http.*;
//        import java.io.IOException;
//        import java.io.InputStream;
//        import java.sql.Connection;
//        import java.sql.DriverManager;
//        import java.sql.PreparedStatement;
//        import java.sql.SQLException;
//
//        import static java.lang.System.out;

//@WebServlet("/FileUploadDBServlet")
//@MultipartConfig
//public class FileUploadDBServlet extends HttpServlet {
//
//    protected void doPost(HttpServletRequest request,
//                          HttpServletResponse response) throws ServletException, IOException {
//
//        InputStream inputStream = null; // input stream of the upload file
//
//        // obtains the upload file part in this multipart request
//        Part filePart = request.getPart("File");
//        if (filePart != null) {
//            // prints out some information for debugging
//            System.out.println(filePart.getName());
//            System.out.println(filePart.getSize());
//            System.out.println(filePart.getContentType());
//
//            // obtains input stream of the upload file
//            inputStream = filePart.getInputStream();
//        }
//
//
//        String message = null;  // message will be sent back to client
//
//        try {
//            // connects to the database
//            Connection con;
//            Class.forName("com.mysql.jdbc.Driver");
//            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mentorsys", "hello", "hello");
//            out.println("SL3 " + "database successfully opened.");
//            PreparedStatement ps = null;
//
//            HttpSession session = request.getSession();
//            String stud_mis_id = (String) session.getAttribute("stud_mis_id");
//            String stud_file_type="undertaking";
//
//
//            // constructs SQL statement
//            String sql = "INSERT INTO stud_documents (stud_mis_id,stud_file,file_type) values (?, ?,?)";
//            PreparedStatement statement = con.prepareStatement(sql);
//            statement.setString(1, stud_mis_id);
//
//            if (inputStream != null) {
//                // fetches input stream of the upload file for the blob column
//                statement.setBlob(2, inputStream);
//            }
//            statement.setString(3, stud_file_type);
//            // sends the statement to the database server
//            int row = statement.executeUpdate();
//            if (row > 0) {
//                message = "File uploaded and saved into database";
//            }
//        } catch (SQLException ex) {
//            message = "ERROR: " + ex.getMessage();
//            ex.printStackTrace();
//        } catch (ClassNotFoundException e) {
//            e.printStackTrace();
//        }
//        // sets the message in request scope
//        request.setAttribute("Message", message);
//
//        // forwards to the message page
//        getServletContext().getRequestDispatcher("/jsp/Message.jsp").forward(request, response);
//    }
//}
