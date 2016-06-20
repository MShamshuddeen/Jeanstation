

package user.buynow;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class BuyNowLogin extends HttpServlet {

   
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet BuyNowLogin</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet BuyNowLogin at " + request.getContextPath() + "</h1>");
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
       int pid=Integer.parseInt(request.getParameter("pid"));
       int quantity=Integer.parseInt(request.getParameter("quantity"));
       String size=request.getParameter("size");
       String email=request.getParameter("email");
       String password=request.getParameter("password");
    
        try{
            Class.forName("sun.jdbc.odbc.JdbcOdbcDriver");
            Connection con=DriverManager.getConnection("jdbc:odbc:jeanstation","sa","domnic");
            Statement st=con.createStatement();
            ResultSet rs=st.executeQuery("select*from users where email='"+email+"' and pswd='"+password+"' ");
            if(rs.next()){
                String name=rs.getString(2);
             HttpSession hs=request.getSession();
             hs.setAttribute("username", name);
            out.println("<h4 style='text-align:center;'>Login Successfully</h4>");
           //    out.println("<a href='BuyNow.jsp?pid="+pid+"&quantity="+quantity+"&size="+size+"'>go back</a>");
               response.setHeader("Refresh", "2; URL=BuyNow.jsp?pid="+pid+"&quantity="+quantity+"&size="+size+"");
            }
            else{
               out.println("<h4 style='text-align:center;'>Login Failed</h4>");
              // out.println("<a href='BuyNow.jsp?pid="+pid+"&quantity="+quantity+"&size="+size+"'>go back</a>");
               response.setHeader("Refresh", "2; URL=BuyNow.jsp?pid="+pid+"&quantity="+quantity+"&size="+size+"");
      //  RequestDispatcher rd=request.getRequestDispatcher("BuyNow.jsp?pid='"+pid+"'&quantity='"+quantity+"'&psize='"+size+"'");
         //   rd.forward(request, response);
            }
           
       }
       catch(Exception e){
          out.println("<h4>"+e+"</h4>");
       }
       
       
       
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
