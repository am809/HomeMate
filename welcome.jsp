
<%@page import="java.io.OutputStream"%>
<%@ page import="java.sql.*" %>
<% Class.forName("com.mysql.jdbc.Driver"); %>
  
<head>  
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1"> 
<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
<style>
.back-to-top {
    position: fixed;
    bottom: 20px;
    right: 20px;
    display:none;
}
.alert {
    position: fixed;
    top: 8.5%;
    left: 50%;
    transform: translate(-50%, -50%);
}
</style>




<title>HomeMate</title>  
</head> 
<body onload="getLocation()">

    <div class="container">
    <nav class="navbar navbar-inverse">
      <div class="container-fluid">
        <div class="navbar-header">
          <a class="navbar-brand ">HomeMate</a>
        </div>
        <div>
          <ul class="nav navbar-nav">
              <li><a href="welcome.jsp"> Home</a></li>
              <li><a href="useradservlet"> How-to</a></li>
              <li><a href="about.jsp"> About</a></li>
              <li><a href="cities.jsp"> cities</a></li>
          </ul>
          <ul class="nav navbar-nav navbar-right">
            <!--<li><a href="loginservlet"><span class="glyphicon glyphicon-log-out"></span> Sign in</a></li> -->
          </ul>
        </div>
      </div>
    </nav>
    </div>
        
 
        
        
        
        

       
        <div class="container"><hr class="featurette-divider"></div>
        <center>
        <div class="container">
            
            <div class='col-sm-3'>
        <p>Click the button to get your coordinates.</p>
        <button class="btn btn-info" onclick="getLocation()">Try It</button>
        <p id="demo"></p>
        <form class="form-horizontal" action="geolocationservlet" method="post" enctype="multipart/form-data">
            <fieldset>
                <div class="control-group">  
                    <div class="controls">
                        <input type="text" class="form-control"  id="latit" name="latitude" readonly>
                    </div>  
                </div>
                <div class="control-group">  
                    <div class="controls">
                        <input type="text" class="form-control" id="longit" name="longitude" readonly>
                    </div>  
                </div>
                <p>
                
                <div class="control-group">
                    <div class="controls">
                        <button id="signin" name="signin" class="btn btn-info">Save</button>
                    </div>
                </div> 
            </fieldset>
            </form>
            </div>
             
        </div>
           </center>
        

        
        
<!-- #########################################################      Buttons     ############################################################              -->             
    <div class="container">
        <div class="jumbotron">
            <div class="row">
        <div class="col-sm-2 col-sm-offset-1">
            <button class="btn btn-primary" href="#signup" onclick="$('#myModal1').modal();" data-target=".bs-modal-md"><span class="glyphicon glyphicon-pencil"></span> Create</button>
        </div>
        
        <div class="col-sm-2">
            <button class="btn btn-warning" onclick="$('#myModal3').modal();" data-target=".bs-modal-md"><span class="glyphicon glyphicon-search"></span> Search</button>
        </div>
        
        <div class="col-sm-2">
            <button class="btn btn-danger" href="#delete" onclick="$('#myModal2').modal();" data-target=".bs-modal-md"><span class="glyphicon glyphicon-trash"></span> Delete</button>
        </div> 
        
        <div class="col-sm-2">
            <button class="btn btn-info" href="#signup" data-toggle="modal" data-target=".bs-modal-sm"><span class="glyphicon glyphicon-log-in"></span> Sign In</button>
        </div>
                
        <div class="col-sm-2">
            <form class="form-horizontal" action="logoutservlet" method="get">
                <div class="controls">
                    <button id="signin" name="signout" class="btn btn-success"><span class="glyphicon glyphicon-log-out"></span> Sign out</button>
                </div>
            </form>
         </div>
            </div>
    </div>
    </div>
                
            
    <div class="container"><hr class="featurette-divider"></div>
    
    
    
    
    
    
    
    
    
    

 <!-- #########################################################      Create ad modal     ############################################################              -->
    
<div class="modal fade bs-modal-md" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-md">
    <div class="modal-content">
        
      <div class="modal-body">
            
            <form class="form-horizontal" action="adservlet" method="post" enctype="multipart/form-data">
            <fieldset>
                
                <div class="control-group">
                <label class="control-label" for="username">Username:</label>  
                    <div class="controls">
                        <input class="form-control" type="text" name="username" value ="<%=session.getAttribute("name")%>" readonly>
                    </div>  
                </div>
                        
                <div class="control-group">
                <label class="control-label" for="city">City:</label>
                <div class="controls">
                    <select class="form-control" name="city" autofocus>
                        <option value="Athens">Athens</option>
                        <option value="Volos">Volos</option>
                        <option value="Larissa">Larissa</option>
                        <option value="Thessaloniki">Thessaloniki</option>
                    </select>
                </div>  
                </div>
                    
                <div class="control-group">
                <label class="control-label" for="age">Age:</label>
                <div class="controls">
                    <input class="form-control" type="number" name="age" min="18" max="30" value="18" required="required" /> 
                </div>
                </div>
                    
                <div class="control-group">
                <label class="control-label" for="phone">Phone:</label>
                <div class="controls">
                    <input class="form-control" type="text" name="phone" value="6900000000" pattern="[6]+[9]+[0-9]{8}" title="10 digits like 69********" required="required" />  
                </div>
                </div>
                    
                <div class="control-group">
                <label class="control-label" for="address">Address:</label>
                <div class="controls">
                    <input class="form-control" type="text" name="address" value="Test 1" required="required" />
                </div>
                </div>
                <div class="control-group">
                <label class="control-label" for="rent">Rent:</label>
                <div class="controls">
                    <input class="form-control" type="number" name="rent" min="50" max="1000" step="5" value="100" required="required" /> 
                </div>
                </div>
                    
                <div class="control-group">
                <label class="control-label" for="hometype">Hometype:</label>
                <div class="controls">
                    <select class="form-control" name="hometype">
                        <option value="Single">Single</option>
                        <option value="Double">Double</option>
                        <option value="Triple">Triple</option>
                    </select>
                </div>
                </div>
                    
                <div class="control-group">
                <div class="row">
                <div class="col-sm-4">
                <label class="control-label" for="gender">Gender:</label>
                <div class="controls">
                    <input type="radio" name="gender" value="male" checked>  Male     <input type="radio" name="gender" value="female">  Female
                </div>
                </div>
                    <div class="col-sm-8">
                    <label class="control-label" for="file">File input:</label>
                    <div class="controls">
                        <input type="file" name="photo" accept="image/*">
                        <p class="help-block">Please choose a picture of your apartment.</p>
                    </div>
                        
                    </div>
                </div>
                </div>
                    
                <div class="control-group">
                <label class="control-label" for="description">Description:</label>
                <div class="controls">
                    <textarea class="form-control" name="description" rows="5" cols="40"></textarea>
                </div>
                </div>

                <div class="control-group">
                <label class="control-label" for="create"></label>
                <div class="controls">
                    <button id="signin" name="create" class="btn btn-success">Create</button>
                </div>
                </div> 
            </fieldset>
            </form>

            <center>
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </center>
                    
            </div>
        </div>
    </div>
</div>
                    
                    
 <!-- #########################################################      Sign in/ register modal     ############################################################              -->
                    
                    
  <div class="modal fade bs-modal-sm" id="myModal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
        <br>
        <div class="bs-example bs-example-tabs">
            <ul id="myTab" class="nav nav-tabs">
              <li class="active"><a href="#signinn" data-toggle="tab">Sign In</a></li>
              <li class=""><a href="#signup" data-toggle="tab">Register</a></li>
              <li class=""><a href="#why" data-toggle="tab">Why?</a></li>
            </ul>
        </div>
        
      <div class="modal-body">
        <div id="myTabContent" class="tab-content">
        <div class="tab-pane fade in" id="why">
        <p>We need this information so that you can receive access to the site and its content. Rest assured your information will not be sold, traded, or given to anyone.</p>
        <p></p><br> Please contact <a mailto:href="dev@homemate.com"></a>dev@homemate.com</a> for any other inquiries.</p>
        </div>
            
        <div class="tab-pane fade active in" id="signinn">
            <form class="form-horizontal" action="loginServlet" method="post">
            <fieldset>
            <div class="control-group">
              <label class="control-label" for="username">Username:</label>
              <div class="controls">
                <input id="userid" name="username" type="text" class="form-control" placeholder="username" pattern="[0-9A-Za-z]+[0-9A-Za-z]+[0-9A-Za-z]+[0-9A-Za-z]*" title="At least 3 letters/digits" required="required" class="input-medium">
              </div>
            </div>
            <div class="control-group">
              <label class="control-label" for="userpass">Password:</label>
              <div class="controls">
                <input id="passwordinput" name="userpass" class="form-control" type="password" placeholder="********" pattern="[0-9A-Za-z]+[0-9A-Za-z]+[0-9A-Za-z]*" title="At least 2 letters/digits" required="required"  class="input-medium">
              </div>
            </div>
            <div class="control-group">
              <label class="control-label" for="signin"></label>
              <div class="controls">
                <button id="somebutton" id="signinn" name="signin" class="btn btn-success">Sign In</button>
              </div>
            </div>
            </fieldset>
            </form>
        </div>
        <div class="tab-pane fade" id="signup">
            <form class="form-horizontal" action="signupservlet" method="post">
            <fieldset> 
                <table>
                    <div class="control-group">
                        <label class="control-label">First Name:</label>  
                        <input class="form-control" type="text" name="userfirst" pattern="[A-Za-z]+[A-Za-z]+[A-Za-z]+[A-Za-z]*" title="At least 3 letters" required="required" autofocus=""/>
                    </div>
                    <div class="control-group">
                        <label class="control-label">Last Name:</label>
                        <input class="form-control" type="text" name="userlast" pattern="[A-Za-z]+[A-Za-z]+[A-Za-z]+[A-Za-z]*" title="At least 3 letters" required="required" />
                    </div>
                    <div class="control-group">
                        <label class="control-label">Username:</label>  
                        <input class="form-control" type="text" name="username" placeholder="username" pattern="[0-9A-Za-z]+[0-9A-Za-z]+[0-9A-Za-z]+[0-9A-Za-z]*" title="At least 3 letters/digits" required="required" />
                    </div>  
                    <div class="control-group">
                        <label class="control-label">Password:</label>  
                        <input class="form-control" type="password" name="userpass" placeholder="********" pattern="[0-9A-Za-z]+[0-9A-Za-z]+[0-9A-Za-z]*" title="At least 2 letters/digits" required="required" />
                    </div>  
                    <div class="control-group">
                        <label class="control-label">E-mail:</label>
                        <input class="form-control" type="email" name="usermail" placeholder="something@gmail.com" required="required" />
                    </div>
                    <div class="control-group">
                        <label class="control-label"></label>
                        <div class="controls">
                            <input class="btn btn-success" type="submit" value="Sign up" />
                        </div>
                    </div>
                </table>  
            </fieldset>
        </form>
      </div>
    </div>
      </div>
      <div class="modal-footer">
      <center>
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        </center>
      </div>
    </div>
  </div>
</div>
                    
<!-- #########################################################      sql connection and query     ############################################################              -->                    
                    
                    
<% 
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/test", "ADMIN", "admin");
            Statement statement = connection.createStatement();
            ResultSet resultset = statement.executeQuery("select * from ads");
        %> 
                    
<!-- #########################################################      Delete modal     ############################################################              -->                    
                    
 <div class="modal fade bs-modal-md" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-md">
    <div class="modal-content">
        
      <div class="modal-body">
            
            <form class="form-horizontal" action="deleteservlet2" method="post" enctype="multipart/form-data">
            <fieldset>
                <div class="control-group">
                <label class="control-label" for="delete"></label>
                <div class="controls">
                    <button id="signin" name="delete" class="btn btn-danger">Delete</button>
                </div>
                </div> 
            </fieldset>
            </form>

            <center>
                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </center>
                    
            </div>
        </div>
    </div>
</div>
                
                
                    
                    

        
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
              <img style="width:100%" onclick="$('#bs-example-modal-lg').modal();" data-target=".bs-modal-md" src="">
            </div>
            <div class="caption">
                <div class="row">
                    <div class="col-sm-3 text-center">
                        <img class="img-circle" src="" style="width: 80px;height:80px;">
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
                        <a href="tel:6974294489" class="btn btn-info btn-xs" role="button">Call</a>
                    </div>
                    <div class="col-sm-1 col-sm-offset-1">
                        <a href="mailto:" class="btn btn-info btn-xs" role="button">Mail</a>
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
    <% } %>
    </ul>
    </div>
    
    
    
<!-- #########################################################      Ads carousel images modal     ############################################################              -->
    
 <div class="modal fade" id="bs-example-modal-lg" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
        <!-- Wrapper for slides -->
        <div class="carousel-inner">
          <div class="item active">
           <img class="img-responsive" src="" alt="...">
          </div>
          <div class="item">
            <img class="img-responsive" src="" alt="...">
          </div>
           <div class="item">
            <img class="img-responsive" src="" alt="...">
          </div>
        </div>

        <!-- Controls -->
        <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
          <span class="glyphicon glyphicon-chevron-left"></span>
        </a>
        <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
          <span class="glyphicon glyphicon-chevron-right"></span>
        </a>
      </div>
    </div>
  </div>
</div>
    
    
<!-- #########################################################      Search modal     ############################################################              -->
    
    <div class="modal fade" id="myModal3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
		<div class="modal-header">
                    <h2>Search!</h2>
                </div>
                <div class="control-group">
                    <div class="controls">
                        <button id="signin" name="search" class="btn btn-warning">Search</button>
                    </div>
                </div>
		<div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>
    
    
    
    
    </body>
    
    

    
<!-- #########################################################      footer     ############################################################              -->
    
    <footer>

   </footer>
    
    </div>

    <script>
    var x = document.getElementById("demo");

    function getLocation() {
        if (navigator.geolocation) {
            navigator.geolocation.getCurrentPosition(showPosition);
        } else { 
            x.innerHTML = "Geolocation is not supported by this browser.";
        }
    }

    function showPosition(position) {
        latitude = position.coords.latitude;
        longitude = position.coords.longitude;
        document.getElementById("latit").value = latitude;
        document.getElementById("longit").value = longitude;
    }
    </script>
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>


  
  <!-- END BODY -->


