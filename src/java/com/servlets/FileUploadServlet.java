package com.servlets;
 
import com.dao.ProjectDao;
import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
 
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
 
@WebServlet("/FileUploadServlet")
@MultipartConfig(fileSizeThreshold=1024*1024*10, 	// 10 MB 
                 maxFileSize=1024*1024*50,      	// 50 MB
                 maxRequestSize=1024*1024*100)   	// 100 MB
public class FileUploadServlet extends HttpServlet {
 
    private static final long serialVersionUID = 205242440643911308L;
    public static String fn;
	
    /**
     * Directory where uploaded files will be saved, its relative to
     * the web application directory.
     */
    private static final String UPLOAD_DIR = "images";
     
    protected void doPost(HttpServletRequest request,
            HttpServletResponse response) throws ServletException, IOException {
        // gets absolute path of the web application
        String applicationPath = request.getServletContext().getRealPath("");
        // constructs path of the directory to save uploaded file
        String uploadFilePath = applicationPath + File.separator + UPLOAD_DIR;
        String n = (String)request.getSession().getAttribute("name");
         
        // creates the save directory if it does not exists
        File fileSaveDir = new File(uploadFilePath);
        if (!fileSaveDir.exists()) {
            fileSaveDir.mkdirs();
        }
        System.out.println("Upload File Directory="+fileSaveDir.getAbsolutePath());
        
        //Get all the parts from request and write it to the file on server
        for (Part part : request.getParts()) {
            String fileName = getFileName(part);
            fn = fileName;
            part.write(uploadFilePath + File.separator + fileName);
        }
        
        try {
            ProjectDao.img(n,fn);
        } catch (SQLException ex) {
            Logger.getLogger(FileUploadServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(FileUploadServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

 
        request.setAttribute("message", "File uploaded successfully to "+applicationPath);
        request.setAttribute("message2",fn);
        getServletContext().getRequestDispatcher("/userpage.jsp").forward(
                request, response);
    }
 
    /**
     * Utility method to get file name from HTTP header content-disposition
     */
    private String getFileName(Part part) {
        String contentDisp = part.getHeader("content-disposition");
        System.out.println("content-disposition header= "+contentDisp);
        String[] tokens = contentDisp.split(";");
        for (String token : tokens) {
            if (token.trim().startsWith("filename")) {
                return token.substring(token.indexOf("=") + 2, token.length()-1);
            }
        }
        return "";
    }
}