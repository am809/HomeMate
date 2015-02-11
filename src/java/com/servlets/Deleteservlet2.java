package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.RequestDispatcher;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class Deleteservlet2 extends HttpServlet {
	
	// database connection settings
	private final String dbURL = "jdbc:mysql://localhost:3306/test";
	private final String dbUser = "ADMIN";
	private final String dbPass = "admin";
	
    /**
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @Override
	protected void doPost(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
            
                response.setContentType("text/html");    
                PrintWriter out = response.getWriter();
                
                HttpSession session = request.getSession(false);
                String u =(String) session.getAttribute("name");
                
                                
		
		Connection conn = null;	// connection to the database
		String message = null;	// message will be sent back to client
                
                 
		
		try {
			// connects to the database
			DriverManager.registerDriver(new com.mysql.jdbc.Driver());
			conn = DriverManager.getConnection(dbURL, dbUser, dbPass);
                        
                        
                        
                        
			// constructs SQL statement
			String sql = "DELETE FROM ads WHERE user=?";
			PreparedStatement statement = conn.prepareStatement(sql);
                        statement.setString(1,u);
                        
                        
                        int row = statement.executeUpdate();
                        if (row > 0) {
                            session.setAttribute("exist","0");
			}

                        
                        //if(row ==0){
                        //    message = "Sorry! something went wrong with your ad!";
                        //}
		} catch (SQLException ex) {
                    out.print("<div class=\"alert alert-danger\">\n" +
                        "            <a href=\"#\" class=\"close\" data-dismiss=\"alert\">&times;</a>\n" +
                        "            <strong>Sorry! </strong>"+ex.getMessage()+"\n" +
                        "        </div>");
			ex.printStackTrace();
		} finally {
                    if (conn != null) {
			// closes the database connection
			try {
                            conn.close();
			} catch (SQLException ex) {
                            ex.printStackTrace();
			}
                    }
                    RequestDispatcher rd=request.getRequestDispatcher("userpage.jsp");
                    rd.include(request,response); 
		}
                out.close();    
	}
}
