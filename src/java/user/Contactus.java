
package user;

import com.sendgrid.SendGrid;
import com.sendgrid.SendGridException;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class Contactus extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet Contactus</title>");            
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet Contactus at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out=response.getWriter();
        
        String name=request.getParameter("username");
        String emailid=request.getParameter("email");
        String query=request.getParameter("query");
          SendGrid sendgrid = new SendGrid("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");

    SendGrid.Email email = new SendGrid.Email();
    email.addTo("info.dvloper@gmail.com");
    email.setFrom(emailid);
    email.setSubject("JeanStation: Contact Us");
    email.setText(query+"\n Regards "+name+"\n\n\n ");

    try {
      SendGrid.Response res = sendgrid.send(email);
      System.out.println(res.getMessage());
      out.println("<h4>Thank you for getting in touch!\n" +
"We appreciate you contacting us. We try to respond as soon as possible, so one of our Customer Service will get back to you within a few hours.\n" +
"Have a great day ahead!</h4>");
      out.println("<h5 style='text-align:center;'>Page will be redirect in 5 sec.</h4>");
           response.setHeader("Refresh", "5; URL=index.jsp");
    }
    catch (SendGridException e) {
      System.err.println(e);
    }
        
    }

   
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
