<%@page import="java.io.OutputStream"%>
<%@ page import="java.sql.*" %>
<% Class.forName("com.mysql.jdbc.Driver"); %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<c:import url="header.jsp">
    <c:param name="title" value="User Page"></c:param>
</c:import>

<div class="keno"> </div>
<!--jsp:forward page="welcome.jsp" /-->

<% String user = (String)session.getAttribute("name");
if(user == null){%>
<br>
<div class="keno"> </div>
<center>
    <br>
    <meta http-equiv="refresh" content="0; url=${pageContext.request.contextPath}/index.jsp" />
</center>
<%} else{ %>
        
        
                
        
<!-- #########################################################           ############################################################              -->        
            
    <div class="container">
        <div class="keno"></div>

        
        
        <div class="row">
            
            <%  String exist = (String)session.getAttribute("exist");
                String Username = (String)session.getAttribute("name");
                
                Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "ADMIN", "admin");
                String sql = "select * from ads where user=?";
                PreparedStatement statement = connection.prepareStatement(sql);
                statement.setString(1,Username);
                ResultSet resultset = statement.executeQuery();
                
                if("1".equals(exist)){
                    resultset.next();  %>
       <div class="keno"></div>
         <div class="col-sm-5">
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
              <center>
              <form class="form-horizontal" action="deleteservlet2" method="post" enctype="multipart/form-data">
                        <div class="controls">
                            <button id="signin" name="delete" class="btn btn-danger"><span class="glyphicon glyphicon-trash"></span> Delete</button>
                        </div>
                </form>
              </center>
          </div>
        </div>
              
        <!-- #########################################################      Ads carousel images modal     ############################################################              -->
   
        <%@ include file="/WEB-INF/jspf/carousel.jspf"  %> 
              
              
        <div class="col-sm-7">
            <h3>You can only have one active ad at any time.</h3>
            <h5> -If you want to create a new ad please delete the old one first!</h5>
        </div>
        <center>
            <button class="btn btn-success btn-lg" href="#upload" onclick="$('#myModal2').modal();" data-target=".bs-modal-md"><span class="glyphicon glyphicon-picture"></span> Add Images</button>
        </center>
     <%
                }
        else{ %>
        <div class="col-sm-12">
                <h2> You don't have any ads at the moment!</h2>
                <h4> You can click the Create button and fill in all the field and add some photos of your apartment in order to max your chances in finding housemate faster.</h4>
                <h5> - Every bit of information helps!</h5>
        </div>
                
                <%@ include file="/WEB-INF/jspf/howtopage.jspf"  %> 
        
                <div class="keno"></div>
                
                <center>
                    <button class="btn btn-info btn-lg" href="#signup" onclick="$('#myModal1').modal();" data-target=".bs-modal-md"><span class="glyphicon glyphicon-pencil"></span> Create a new Ad</button>
                </center>
                
                <div class="keno"></div>
        <% }%>
    </div>
    <div class="keno"></div>
</div>
    <div class="keno"></div>

    
   
            
 <!-- #########################################################      Add images modal     ############################################################              -->

                
<%@ include file="/WEB-INF/jspf/images.jspf"  %> 
    

 <!-- #########################################################      Create ad modal     ############################################################              -->

                
<%@ include file="/WEB-INF/jspf/admodal.jspf"  %>   
    
    

<!--    #########################################################    How-to photos modal     ############################################################                 -->


<%@ include file="/WEB-INF/jspf/howtophotosmodal.jspf"  %>   
    

<!--  #####################################   footer ###########################   -->

<%@include file="footer.jsp" %>

<% }%>

