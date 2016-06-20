

package Admin.product;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.Iterator;
import java.util.List;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

public class AddProduct extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AddProduct</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AddProduct at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       PrintWriter out=response.getWriter();
   
        
        
         File file ;
   int maxFileSize = 5000 * 1024;
   int maxMemSize = 5000 * 1024;
   ServletContext context = this.getServletContext();
   String filePath = context.getInitParameter("file-upload");
   // Verify the content type
   String contentType = request.getContentType();
   if ((contentType.indexOf("multipart/form-data") >= 0)) {

      DiskFileItemFactory factory = new DiskFileItemFactory();
      // maximum size that will be stored in memory
      factory.setSizeThreshold(maxMemSize);
      // Location to save data that is larger than maxMemSize.
      factory.setRepository(new File("c:\\temp"));

      // Create a new file upload handler
      ServletFileUpload upload = new ServletFileUpload(factory);
      // maximum file size to be uploaded.
      
      
      upload.setSizeMax( maxFileSize );
      try{ 
          Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
       Connection con=DriverManager.getConnection("jdbc:odbc:jeanstation","sa","domnic");
        PreparedStatement ps=con.prepareStatement("insert into product(pname,pcat,pdesc,price,img,pstatus) values(?,?,?,?,?,?)");
         // Parse the request to get file items.
         List fileItems = upload.parseRequest(request);

         // Process the uploaded file items
         Iterator i = fileItems.iterator();
         while ( i.hasNext () ) 
         {
            FileItem fi = (FileItem)i.next();
            if ( !fi.isFormField () )	
            {
            // Get the uploaded file parameters
            String fieldName = fi.getFieldName();
            String fileName = fi.getName();
            boolean isInMemory = fi.isInMemory();
            long sizeInBytes = fi.getSize();
            // Write the file
            if( fileName.lastIndexOf("\\") >= 0 ){
            file = new File( filePath + 
            fileName.substring( fileName.lastIndexOf("\\"))) ;
            }else{
            file = new File( filePath + 
            fileName.substring(fileName.lastIndexOf("\\")+1)) ;
            }
            fi.write( file ) ;
            
         
     
       
       
       
      
       ps.setString(5,fileName);
       
       
            }
             if(fi.isFormField()){  // Check regular field.
  String fieldName = (String)fi.getFieldName();
  if(fieldName.equalsIgnoreCase("prodname")){ 
   String pname = (String)fi.getString(); 
   ps.setString(1, pname);
         
  }
  if(fieldName.equalsIgnoreCase("pcat")){
   String pcat=(String)fi.getString();
   ps.setString(2, pcat);
     
  }
  if(fieldName.equalsIgnoreCase("pdesc")){
   String pdesc=(String)fi.getString();
   ps.setString(3, pdesc);
   
  }
  if(fieldName.equalsIgnoreCase("price")){
  int  price=Integer.parseInt(fi.getString());
  ps.setInt(4, price);
    
  }
   if(fieldName.equalsIgnoreCase("pstatus")){
   String pstatus=(String)fi.getString();
   ps.setString(6, pstatus);
    
  }        
             
         }
             
         }
         ps.executeUpdate();
       ps.close();
       con.close();
       out.println("<h3 style='text-align:center;'>Product data uploaded Successfully</h3>");
            out.println("<h5 style='text-align:center;'>Page will be redirect in 3 sec.</h4>");
            response.setHeader("Refresh", "5; URL=Dashboard.jsp");
      }catch(Exception ex) {
         out.println(ex);
      }
   }else{
      out.println("<html>");
      out.println("<head>");
      out.println("<title>Servlet upload</title>");  
      out.println("</head>");
      out.println("<body>");
      out.println("<p>No file uploaded</p>"); 
      out.println("</body>");
      out.println("</html>");
   }
 
    }

  
    @Override
    public String getServletInfo() {
        return "Short description";
    }

}
