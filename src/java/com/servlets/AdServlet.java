package com.servlets;

import com.dao.ProjectDao;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

//@WebServlet("/adservlet")
@MultipartConfig(maxFileSize = 16177215)	// upload file's size up to 16MB
public class AdServlet extends HttpServlet {
	
	// database connection settings
	private String dbURL = "jdbc:mysql://localhost:3306/test";
	private String dbUser = "ADMIN";
	private String dbPass = "admin";
	
    /**
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @Override
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
            
                response.setContentType("text/html");    
                PrintWriter out = response.getWriter();
                HttpSession session = request.getSession(false);
		// gets values of text fields
		String u=request.getParameter("username");
                String c=request.getParameter("city");    
                String g=request.getParameter("gender");
                String a=request.getParameter("age");
                String p=request.getParameter("phone");
                String ad=request.getParameter("address");    
                String r=request.getParameter("rent");
                String h=request.getParameter("hometype");
                String d=request.getParameter("description");
                String m=request.getParameter("usermail");
                
		
		InputStream inputStream = null;	// input stream of the upload file
		
		// obtains the upload file part in this multipart request
		Part filePart = request.getPart("photo");
		if (filePart != null) {
			// prints out some information for debugging
			//out.print(filePart.getName()+"   ");
			//out.print(filePart.getSize()+"   ");
			//out.print(filePart.getContentType()+"   ");
			
			// obtains input stream of the upload file
			inputStream = filePart.getInputStream();
		}
		
		Connection conn = null;	// connection to the database
		String message = null;	// message will be sent back to client
                String img = "noimage.jpg";
		
		try {
			// connects to the database
			DriverManager.registerDriver(new com.mysql.jdbc.Driver());
			conn = DriverManager.getConnection(dbURL, dbUser, dbPass);

			// constructs SQL statement
			String sql = "INSERT INTO `ads` (user, city,  gender,  age,  phone,  address,  rent,  hometype,  description, mail) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?,?)";
			PreparedStatement statement = conn.prepareStatement(sql);
                        statement.setString(1,u);
                        statement.setString(2,c);
                        statement.setString(3,g);
                        statement.setString(4,a);
                        statement.setString(5,p);
                        statement.setString(6,ad);
                        statement.setString(7,r);
                        statement.setString(8,h);
                        statement.setString(9,d);
                        statement.setString(10,m);

			// sends the statement to the database server
			int row = statement.executeUpdate();
			if (row > 0) {
                            session.setAttribute("exist","1");
			}
                    try {
                        ProjectDao.img(u,img);
                        
                        //if(row ==0){
                        //    message = "Sorry! something went wrong with your ad!";
                        //}
                    } catch (ClassNotFoundException ex) {
                        Logger.getLogger(AdServlet.class.getName()).log(Level.SEVERE, null, ex);
                    }
		} catch (SQLException ex) {
                    out.print("<div class=\"alert alert-danger\">\n" +
                        "            <a href=\"#\" class=\"close\" data-dismiss=\"alert\">&times;</a>\n" +
                        "            <strong>Sorry! </strong>"+ex.getMessage()+"\n" +
                        "        </div>");
                    RequestDispatcher rd=request.getRequestDispatcher("index.jsp");
                    
                    ex.printStackTrace();
                    rd.forward(request,response);
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
	}
}