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
import java.util.ArrayList;
import java.util.List;
  
public class LoginServlet extends HttpServlet{  
  
    private static final long serialVersionUID = 1L; 
    public static List users;
  
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
        PrintWriter out = response.getWriter();    
          
        String n=request.getParameter("username");    
        String p=request.getParameter("userpass");
        
        response.setHeader("Cache-Control", "no-cache, no-store");
	response.setHeader("Pragma", "no-cache");
        
        HttpSession session = request.getSession();
        
        if(session!=null){
            try {
                if(ProjectDao.userexistad(n)){
                    session.setAttribute("exist","1");
                }
                else{
                    session.setAttribute("exist","0");
                }
            } catch (SQLException ex) {
                Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
        
        
        
        try {
            if(ProjectDao.validate(n, p)){ 
                if(session!=null) {
                    if(null == users) {
                        users = new ArrayList();
                    }
                    users.add(n);
                    session.setAttribute("name", n);
                    session.setAttribute("users", users);
                }
                RequestDispatcher rd=request.getRequestDispatcher("city.jsp");
                rd.include(request,response);
            }
            else{
                out.print("<div class=\"alert alert-danger\">\n" +
                        "            <a href=\"#\" class=\"close\" data-dismiss=\"alert\">&times;</a>\n" +
                        "            <strong>Sorry! </strong>Username or Password are incorrect !\n" +
                        "        </div>");
                RequestDispatcher rd=request.getRequestDispatcher("city.jsp");
                rd.include(request,response);   
            }
        } catch (SQLException ex) {
            Logger.getLogger(LoginServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
  
        out.close();    
    }    
}   