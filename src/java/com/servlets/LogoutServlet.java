/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author iobelika
 */
public class LogoutServlet extends HttpServlet {

    @Override

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        response.setContentType("text/html");
        
        String n = (String)request.getSession().getAttribute("name");
        
        LoginServlet.users.remove(n);

        try (PrintWriter out = response.getWriter()) {
            RequestDispatcher rd=request.getRequestDispatcher("logout.jsp");
            rd.forward(request,response);
        }
    }

}
