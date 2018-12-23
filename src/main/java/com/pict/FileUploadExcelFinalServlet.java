
package com.pict;

        import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.poifs.filesystem.POIFSFileSystem;

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
import java.util.ArrayList;
import java.util.Iterator;

@WebServlet("/FileUploadExcelFinalServlet")
@MultipartConfig
public class FileUploadExcelFinalServlet extends HttpServlet {
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
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mentorsys", "root", "root@123");
            System.out.println("SL3 " + "database successfully opened.");
            PreparedStatement ps = null;

            ArrayList dataHolder=readExcelFile(inputStream);
            String temppass="123456";
            String query="insert into student(stud_mis_id,stud_name,stud_roll_no,stud_password) values(?,?,?,?)";
            ps=con.prepareStatement(query);
            int count=0;
            ArrayList cellStoreArrayList=null;
            //For inserting into database
            System.out.print(dataHolder.size());
            //System.out.print(dataHolder.l());
            for (int i=8;i < dataHolder.size(); i++) {
                cellStoreArrayList=(ArrayList)dataHolder.get(i);
                ps.setString(1,((HSSFCell)cellStoreArrayList.get(1)).toString());
                ps.setString(2,((HSSFCell)cellStoreArrayList.get(2)).toString());
                String tempstring1;
                String tempstring2;
                String tempstring3;
                tempstring1=((HSSFCell)cellStoreArrayList.get(1)).toString();
                tempstring2=((HSSFCell)cellStoreArrayList.get(2)).toString();
                tempstring3=((HSSFCell)cellStoreArrayList.get(4)).toString();
                System.out.print("\n\nthe value in temp1 is::"+tempstring1);
                System.out.print("\nthe value in temp2 is::"+tempstring2);
                System.out.print("\nthe value in temp3 is::"+tempstring3);
                float floatroll=Float.parseFloat(tempstring3);
                int introll=Math.round(floatroll);

                System.out.print("\nthe value in int is::"+introll);
                ps.setInt(3,introll);
                ps.setString(4,temppass);
                count= ps.executeUpdate();
                //System.out.print(((HSSFCell)cellStoreArrayList.get(1)).toString() + "t");
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
            HttpSession session = request.getSession();
            String error="Some students already exist";
            System.out.print(error);
            session.setAttribute("getAlert", error);//Just initialize a random variable.
            response.sendRedirect("/jsp/admin_excelsheet.jsp");
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
