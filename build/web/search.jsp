
<%@ page import="java.io.OutputStream"%>
<%@ page import="java.sql.*" %>
<% Class.forName("com.mysql.jdbc.Driver"); %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<c:import url="header.jsp">
    <c:param name="title" value="HomeMate Search"></c:param>
</c:import>
<%@ include file="/WEB-INF/jspf/sliders.jspf"  %>
                    
<%          String Userminrent = (String)session.getAttribute("minrent");
            String Usermaxrent = (String)session.getAttribute("maxrent");
            String Userminage = (String)session.getAttribute("minage");
            String Usermaxage = (String)session.getAttribute("maxage");
            String Usercity = (String)session.getAttribute("city");

            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "ADMIN", "admin");
            
            String sql = "select * from ads where city=? and rent >=? and rent <=? and age>=? and age<=?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setString(1,Usercity);
            statement.setString(2,Userminrent);
            statement.setString(3,Usermaxrent);
            statement.setString(4,Userminage);
            statement.setString(5,Usermaxage);
            ResultSet resultset = statement.executeQuery();
        %> 
      
<!-- #########################################################      Ads list     ############################################################              -->          
     
    <div class="container">
    <ul class="thumbnails list-unstyled">
    <% while(resultset.next()){ 
                //Blob blob = resultset.getBlob(10);
                //int blobLength = (int) blob.length();  
                //byte[] image = blob.getBytes(1, blobLength); 
    %>
        <li class="col-md-4 col-sm-12">
          <div class="thumbnail" style="padding: 0">
            <div style="padding:4px">
              <img style="width:100%" onclick="$('#bs-example-modal-lg<%= resultset.getString(1) %>').modal();" data-target=".bs-modal-md" src="${pageContext.request.contextPath}/images/<%= resultset.getString(10) %>">
            </div>
            <div class="caption">
                <div class="row">
                    <div class="col-sm-3 text-center">
                        <img class="img-circle" src="${pageContext.request.contextPath}/images/noimage.jpg" style="width: 80px;height:80px;">
                    </div>
                    <div class="col-sm-9">
                        <h2><%= resultset.getString(2) %></h2>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-8">
                        <span class="glyphicon glyphicon-map-marker"></span> <b><%= resultset.getString(6) %></b>
                    </div>
                    <div class=" col-sm-4 ">
                        <span class="glyphicon glyphicon-home"></span> <b><%= resultset.getString(8) %></b>
                    </div>
                </div>
                <div class="row">
                    <div class="col-sm-4">
                       <span class="glyphicon glyphicon-envelope"></span><b> Contact:</b>
                    </div>
                    <div class="col-sm-1 col-sm-offset-1">
                        <a href="tel:<%= resultset.getString(5) %>" class="btn btn-info btn-xs" role="button">Call</a>
                    </div>
                    <div class="col-sm-1 col-sm-offset-1">
                        <a href="mailto:<%= resultset.getString(11) %>" class="btn btn-info btn-xs" role="button">Mail</a>
                    </div>
                </div>
              <p><span class="glyphicon glyphicon-paperclip"></span><b> Description:</b> <%= resultset.getString(9) %></p>
            </div>
            <div class="modal-footer" >
              <div class="row" style="text-align: center">
                <div class="col-sm-4"><b>GENDER</b><br/><small> <span class="glyphicon glyphicon-user"></span> <%= resultset.getString(3) %></small></div>
                <div class="col-sm-4"><b>RENT</b><br/><small> <span class="glyphicon glyphicon-euro"></span> <%= resultset.getString(7) %></small></div>
                <div class="col-sm-4"><b>AGE</b><br/><small> <span class="glyphicon glyphicon-stats"></span> <%= resultset.getString(4) %></small></div>
              </div>
              </div>
          </div>   
        </li>
        <%@ include file="/WEB-INF/jspf/carousel.jspf"  %>
    <% } %>
    </ul>
    </div>
    
    <div class="keno" />
    
    
<%@include file="footer.jsp" %> 



