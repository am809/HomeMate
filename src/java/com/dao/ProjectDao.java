package com.dao;  
  
import static java.lang.System.out;
import java.sql.Connection;  
import java.sql.DriverManager;  
import java.sql.PreparedStatement;  
import java.sql.ResultSet;  
import java.sql.SQLException; 
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;


public class ProjectDao { 
    public static String message = "";
    
    /**
     *
     * @param name
     * @param pass
     * @param mail
     * @param first
     * @param last
     * @return
     * @throws SQLException
     * @throws ClassNotFoundException
     */
    public static boolean register(String name, String pass, String mail, String first, String last) throws SQLException, ClassNotFoundException { 
        boolean status = false;
        boolean val = false;
        String connectionURL ="jdbc:mysql://localhost:3306/test";
        Connection connection = null;
        PreparedStatement pstatement = null;
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
        } catch (InstantiationException | IllegalAccessException ex) {
            Logger.getLogger(ProjectDao.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        //koitaei an uparxei allos user me to idio onoma
        String nm = name;
        val = ProjectDao.uservalidate(nm);
        if(val){
            message = "This username is already taken,<p> try another one!";
        }
        
        /*
        //koitaei gia kodiko megalutero apo 2
        if(pass.length() < 2 ) {
            message = "->Password must be > 1";
            return false;
        }
        
        // den prepei o kodikos na mhn periexei xarakthra kenou
        if(!pass.matches("\\w*\\S+\\w*")) {
            message = "->Password cannot contain space";
            return false;
        }
        
        if(!name.matches("\\w*\\S+\\w*")) {
            message = "->Username cannot contain space";
            return false;
        }
                */
        
        if(!mail.matches("\\w+@\\w+\\.\\w+")) {
            message = "->Invalid email address";
            return false;
        }
        
        
        
        //den prepei na einai null 'h keno
        if(name!=null && pass!=null && mail!=null && !val){
            if(name!="" && pass!="" && mail!="") {
                try {
                    connection = DriverManager.getConnection(connectionURL,"ADMIN","admin");
                    String queryString = "INSERT INTO `signup` (user, password, mail, first, last) VALUES (?, ?, ?, ?, ?)";
                    pstatement = connection.prepareStatement(queryString);
                    pstatement.setString(1, name);
                    pstatement.setString(2, pass);
                    pstatement.setString(3, mail);
                    pstatement.setString(4, first);
                    pstatement.setString(5, last);
                    int updateQuery = pstatement.executeUpdate();
                    
                    if (updateQuery != 0) {
                        status = true;
                    }
                }
                catch (Exception ex) {
                    out.println("Unable to connect to batabase.");
                }
                finally {
                    pstatement.close();
                    connection.close();
                }
                //message ="";
            }
            }
        return status;
    }
    
    
    public static boolean validate(String name, String pass) throws SQLException {          
        boolean status = false;  
        Connection conn = null; 
        Statement stmt = null;
        PreparedStatement pst = null;  
        ResultSet rs = null;  
  
        String url = "jdbc:mysql://localhost:3306/";  
        String dbName = "test";  
        String driver = "com.mysql.jdbc.Driver";  
        String userName = "ADMIN";  
        String password = "admin";
 
        try {  
            Class.forName(driver).newInstance();  
            conn = DriverManager  
                    .getConnection(url + dbName, userName, password);  
            pst = conn  
                    .prepareStatement("select * from signup where user=? and password=?");  
            pst.setString(1, name);
            pst.setString(2, pass);
  
            rs = pst.executeQuery();  
            status = rs.next();  
  
        } catch (Exception e) {  
            System.out.println(e);  
        } finally {  
            if (conn != null) {  
                try {  
                    conn.close();  
                } catch (SQLException e) {  
                    e.printStackTrace();  
                }  
            }  
            if (pst != null) {  
                try {  
                    pst.close();  
                } catch (SQLException e) {  
                    e.printStackTrace();  
                }  
            }  
            if (rs != null) {  
                try {  
                    rs.close();  
                } catch (SQLException e) {  
                    e.printStackTrace();  
                }  
            }
        }  
        return status;  
    }
    
    
    
    public static boolean uservalidate(String name) throws SQLException {          
        boolean status = false;  
        Connection conn = null; 
        Statement stmt = null;
        PreparedStatement pst = null;  
        ResultSet rs = null;  
  
        String url = "jdbc:mysql://localhost:3306/";  
        String dbName = "test";  
        String driver = "com.mysql.jdbc.Driver";  
        String userName = "ADMIN";  
        String password = "admin";
 
        try {  
            Class.forName(driver).newInstance();  
            conn = DriverManager  
                    .getConnection(url + dbName, userName, password); 
            pst = conn  
                    .prepareStatement("select * from `signup` where user=?");  
            pst.setString(1, name); 
            rs = pst.executeQuery();  
            status = rs.next();  
  
        } catch (Exception e) {  
            System.out.println(e);  
        } finally {  
            if (conn != null) {  
                try {  
                    conn.close();  
                } catch (SQLException e) {  
                    e.printStackTrace();  
                }  
            }  
            if (pst != null) {  
                try {  
                    pst.close();  
                } catch (SQLException e) {  
                    e.printStackTrace();  
                }  
            }  
            if (rs != null) {  
                try {  
                    rs.close();  
                } catch (SQLException e) {  
                    e.printStackTrace();  
                }  
            }
        }  
        return status;  
    }
    

    public static boolean img(String user, String img) throws SQLException, ClassNotFoundException { 
        boolean status = false;
        boolean val = false;
        String connectionURL ="jdbc:mysql://localhost:3306/test";
        Connection connection = null;
        PreparedStatement pstatement = null;
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
        } catch (InstantiationException | IllegalAccessException ex) {
            Logger.getLogger(ProjectDao.class.getName()).log(Level.SEVERE, null, ex);
        }
                
            
        //den prepei na einai null 'h keno
        if(user!=null && img!=null){
                try {
                    connection = DriverManager.getConnection(connectionURL,"ADMIN","admin");
                    String queryString = "UPDATE `ads` SET img=? where user=?";
                    pstatement = connection.prepareStatement(queryString);
                    pstatement.setString(1, img);
                    pstatement.setString(2, user);
                    
                    int updateQuery = pstatement.executeUpdate();
                    
                    if (updateQuery != 0) {
                        status = true;
                    }
                }
                catch (Exception ex) {
                    out.println("Unable to connect to batabase.");
                }
                finally {
                    pstatement.close();
                    connection.close();
                }
                //message ="";
            }
        return status;
    }
    
    
    

    
    public static boolean geolocate(String user, String lat, String lon) throws SQLException {
        message = "into delete";
        boolean status = false;  
        Connection conn = null; 
        Statement stmt = null;
        PreparedStatement pst = null;  
        ResultSet rs = null;  
  
        String url = "jdbc:mysql://localhost:3306/";  
        String dbName = "test";  
        String driver = "com.mysql.jdbc.Driver";  
        String userName = "ADMIN";  
        String password = "admin";
 
        try {  
            Class.forName(driver).newInstance();  
            conn = DriverManager.getConnection(url + dbName, userName, password); 
            pst = conn.prepareStatement("INSERT INTO `geolocation` (user, lan, lon) VALUES (?, ?,?)");  
            pst.setString(1, user);
            pst.setString(2, lat);
            pst.setString(3, lon);
            
            rs = pst.executeQuery();  
            status = rs.next();  
  
        } catch (Exception e) {  
            System.out.println(e);  
        } finally {  
            if (conn != null) {  
                try {  
                    conn.close();  
                } catch (SQLException e) {  
                    e.printStackTrace();  
                }  
            }  
            if (pst != null) {  
                try {  
                    pst.close();  
                } catch (SQLException e) {  
                    e.printStackTrace();  
                }  
            }  
            if (rs != null) {  
                try {  
                    rs.close();  
                } catch (SQLException e) {  
                    e.printStackTrace();  
                }  
            }
        }  
        return status;  
    }
    
    
        public static boolean userexistad(String name) throws SQLException {          
        boolean status = false;  
        Connection conn = null; 
        Statement stmt = null;
        PreparedStatement pst = null;  
        ResultSet rs = null;  
  
        String url = "jdbc:mysql://localhost:3306/";  
        String dbName = "test";  
        String driver = "com.mysql.jdbc.Driver";  
        String userName = "ADMIN";  
        String password = "admin";
 
        try {  
            Class.forName(driver).newInstance();  
            conn = DriverManager  
                    .getConnection(url + dbName, userName, password); 
            pst = conn  
                    .prepareStatement("select * from `ads` where user=?");  
            pst.setString(1, name); 
            rs = pst.executeQuery();  
            status = rs.next();  
  
        } catch (Exception e) {  
            System.out.println(e);  
        } finally {  
            if (conn != null) {  
                try {  
                    conn.close();  
                } catch (SQLException e) {  
                    e.printStackTrace();  
                }  
            }  
            if (pst != null) {  
                try {  
                    pst.close();  
                } catch (SQLException e) {  
                    e.printStackTrace();  
                }  
            }  
            if (rs != null) {  
                try {  
                    rs.close();  
                } catch (SQLException e) {  
                    e.printStackTrace();  
                }  
            }
        }  
        return status;  
    }
    
    

}  