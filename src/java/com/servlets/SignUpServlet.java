package com.servlets;  
  
import java.io.IOException;  
import java.io.PrintWriter;  
  
import javax.servlet.RequestDispatcher;  
import javax.servlet.ServletException;  
import javax.servlet.http.HttpServlet;  
import javax.servlet.http.HttpServletRequest;  
import javax.servlet.http.HttpServletResponse;  
import javax.servlet.http.HttpSession;  
  
import com.dao.ProjectDao;  
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
  
public class SignUpServlet extends HttpServlet{  
  
    private static final long serialVersionUID = 1L; 
  
    /**
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @Override
    public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {    
  
        response.setContentType("text/html");  
        
        response.setHeader("Cache-Control", "no-cache, no-store");
	response.setHeader("Pragma", "no-cache");
        
        PrintWriter out = response.getWriter();    
          
        String n=request.getParameter("username");    
        String p=request.getParameter("userpass");
        String m=request.getParameter("usermail");
        String f=request.getParameter("userfirst");
        String l=request.getParameter("userlast");
        
        


          
        
  
        try {
            if(ProjectDao.register(n, p, m, f, l)){
                HttpSession session = request.getSession(false);  
                if(session!=null)  
                session.setAttribute("name", n);
                RequestDispatcher rd=request.getRequestDispatcher("userpage.jsp");
                rd.forward(request,response);
            }
            else{
                out.print("<div class=\"alert alert-danger\">\n" +
                        "            <a href=\"#\" class=\"close\" data-dismiss=\"alert\">&times;</a>\n" +
                        "            <strong>Sorry! </strong>"+ProjectDao.message+"\n" +
                        "        </div>");
                RequestDispatcher rd=request.getRequestDispatcher("city.jsp");
                rd.include(request,response);    
            }
        } catch (SQLException ex) {
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(SignUpServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
  
        out.close();    
    }    
}   