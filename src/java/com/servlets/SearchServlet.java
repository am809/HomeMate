package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class SearchServlet extends HttpServlet {
	
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
            String n=request.getParameter("minrent");
            String x=request.getParameter("maxrent");
            String na=request.getParameter("minage");
            String xa=request.getParameter("maxage");
            String c=request.getParameter("city");
                
            HttpSession session = request.getSession(false);
                
            if(session!=null) {
                session.setAttribute("city",c);
                session.setAttribute("minrent",n);
                session.setAttribute("maxrent",x);
                session.setAttribute("minage",na);
                session.setAttribute("maxage",xa);
            }
 
            RequestDispatcher rd=request.getRequestDispatcher("search.jsp");
            rd.forward(request,response);    
	}
}
