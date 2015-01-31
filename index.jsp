<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="shortcut icon" href="${pageContext.request.contextPath}/images/ico2.png">

    <title>HomeMate</title>

    <!-- Bootstrap Core CSS -->
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">
    <!-- Custom CSS -->
    <link href="style.css" rel="stylesheet">
    <link href='http://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'>
    <style>
        .glyphicon-search {
            font-size: 30px;
        }
        .glyphicon-pencil {
            font-size: 30px;
        }
        .glyphicon-home {
            font-size: 30px;
        }
        @media(min-width:768px) {
            .glyphicon-search {
                font-size: 40px;
            }
        }
        @media(min-width:768px) {
            .glyphicon-pencil {
                font-size: 40px;
            }
        }
        @media(min-width:768px) {
            .glyphicon-home {
                font-size: 40px;
            }
        }
        @media(min-width:1000px) {
            .glyphicon-search {
                font-size: 50px;
            }
        }@media(min-width:1000px) {
            .glyphicon-pencil {
                font-size: 50px;
            }
        }
        @media(min-width:1000px) {
            .glyphicon-home {
                font-size: 50px;
            }
        }
    </style>


</head>

<body id="top" class="index" oncontextmenu="return false">

    <!-- Navigation -->
    <nav class="navbar navbar-inverse navbar-fixed-top">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
                <a class="navbar-brand page-scroll" href="#top">HomeMate</a>

            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    <li class="hidden">
                        <a href="#page-top"></a>
                    </li>
                    <li>
                        <a class="page-scroll" href="#services">Services</a>
                    </li>
                    <li>
                        <a class="page-scroll" href="#cities">Cities</a>
                    </li>
                    <li>
                        <a class="page-scroll" href="#about">About</a>
                    </li>
                    <li>
                        <a class="page-scroll" href="#map">Map</a>
                    </li>
                    <li>
                        <a class="page-scroll" href="#contact">Contact</a>
                    </li>
                    <% String user = (String)session.getAttribute("name");
                        if(user == null){
                            
                        }
                        else{%>
                            <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" ><span class="glyphicon glyphicon-user"></span> <%=session.getAttribute("name")%> <span class="caret"></span></a>
                            <ul class="dropdown-menu" role="menu">
                                <li><a> Welcome <strong><%=session.getAttribute("name")%></strong>!</a></li>
                                <%  String exist = (String)session.getAttribute("exist");
                                if("1".equals(exist)){ %>
                                    <li><a>You have <strong>1</strong> active Ad</a></li>
                                <% }else{%>
                                    <li><a>You have <strong>0</strong> active Ad</a></li>
                                <% }%>
                                <li class="divider"></li>
                                <%if("Admin".equals(user)){%>
                                    <li><a href="statistics.jsp"><span class="glyphicon glyphicon-stats"></span> Statistics</a></li>
                                <% }
                                else{%>
                                    <li><a href="userpage.jsp"><span class="glyphicon glyphicon-paperclip"></span> Your Ad</a></li>
                                <% }%>
                                <li><a href="logoutservlet"><span class="glyphicon glyphicon-log-out"></span> Sign out</a></li>
                            </ul> 
                        <% }%>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container-fluid -->
    </nav>


    <!-- Header -->
    <header>
        <div class="container">
            <div class="intro-text">
                <div class="intro-lead-in"><span style="font-family: 'Kaushan Script','Helvetica Neue',Helvetica,Arial,cursive;">Welcome To HomeMate !</span>  </div>
                <div class="intro-heading">Find fast and easy the perfect home and roommate</div>
                <a href="#services" class="page-scroll btn btn-xl">Tell Me More</a>
            </div>
        </div>
    </header>
    

    <!-- Services Section -->
    <section id="services">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2 class="section-heading">Services</h2>
                    <h3 class="section-subheading text-muted"></h3>
                </div>
            </div>
            <div class="row text-center">
                <div class="col-sm-4">
                    <ul class="timeline">
                        <li class="timeline-inverted">
                            <div class="timeline-image">
                                <h4><i class="glyphicon glyphicon-search"></i></h4>
                            </div>
                        </li>
                    </ul>
                    <h4 class="service-heading">Search</h4>
                    <p class="text-muted">Search homes from different cities around Greece</p>
                </div>
                <div class="col-sm-4">
                    <ul class="timeline">
                        <li class="timeline-inverted">
                            <div class="timeline-image">
                                <h4><i class="glyphicon glyphicon-pencil"></i></h4>
                            </div>
                        </li>
                    </ul>
                    <h4 class="service-heading">Create</h4>
                    <p class="text-muted">You can create an Ad about you and your home</p>
                </div>
                <div class="col-sm-4">
                    <ul class="timeline">
                        <li class="timeline-inverted">
                            <div class="timeline-image">
                                <h4><i class="glyphicon glyphicon-home"></i></h4>
                            </div>
                        </li>
                    </ul>
                    <h4 class="service-heading">Choose</h4>
                    <p class="text-muted">Choose the best home available for you fast and easy</p>
                </div>
            </div>
        </div>
    </section>

    <!-- Portfolio Grid Section -->
    <section id="cities" class="bg-light-gray">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2 class="section-heading">Cities</h2>
                    <h3 class="section-subheading text-muted">Choose the city you are interested in</h3>
                </div>
            </div>
            <div class="row">
                <div class="col-md-6 col-sm-12 cities-item">
                    <a href="athens" class="cities-link">
                        <div class="cities-hover">
                            <div class="cities-hover-content">
                                <i class="glyphicon"><h1>ATHENS</h1></i>
                            </div>
                        </div>
                        <img src="${pageContext.request.contextPath}/images/athens2.jpg" class="img-responsive" alt="">
                    </a>
                </div>
                <div class="col-md-6 col-sm-12 cities-item">
                    <a href="thess" class="cities-link">
                        <div class="cities-hover">
                            <div class="cities-hover-content">
                                <i class="glyphicon"><h1>THESSALONIKI</h1></i>
                            </div>
                        </div>
                        <img src="${pageContext.request.contextPath}/images/thess2.jpg" class="img-responsive" alt="">
                    </a>
                </div>
                <div class="col-md-6 col-sm-12 cities-item">
                    <a href="volos" class="cities-link">
                        <div class="cities-hover">
                            <div class="cities-hover-content">
                                <i class="glyphicon"><h1>VOLOS</h1></i>
                            </div>
                        </div>
                        <img src="${pageContext.request.contextPath}/images/volos2.jpg" class="img-responsive" alt="">
                    </a>
                </div>
                <div class="col-md-6 col-sm-12 cities-item">
                    <a href="patra" class="cities-link">
                        <div class="cities-hover">
                            <div class="cities-hover-content">
                                <i class="glyphicon"><h1>PATRA</h1></i>
                            </div>
                        </div>
                        <img src="${pageContext.request.contextPath}/images/patra2.jpg" class="img-responsive" alt="">
                    </a>
                </div>
            </div>
        </div>
    </section>

    <!-- About Section -->
    <section id="about">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2 class="section-heading">About</h2>
                    <h3 class="section-subheading text-muted">This site has been created for the course of <a href="http://inf-server.inf.uth.gr/mavcourses/texwww/"><h4>Web Technologies</h4></a> in the academic year of 2014-2015.</h3>
                </div>
            </div>
        </div>
    </section>
    
    
    
        
    <!-- MAP -->
    <section id="map" class="bg-light-gray">
                <div class="col-lg-12 text-center">
                    <h2 class="section-heading">Map</h2>
                    <h3 class="section-subheading text-muted">In the future this will display all the markers of the houses that have been added into this site.</h3>
                </div>
                <center>
                    <img src="https://maps.googleapis.com/maps/api/staticmap?center=38.5847777,23.8102717&zoom=7&size=900x900">
                </center>
                <br />
    </section>
    
    
    

    <section id="contact">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2 class="section-heading">Contact Us</h2>
                    <h2 class="section-subheading text-muted">Whatever you need we are here to help you.<p> So please send us an e-mail and we will reply shortly.<p> If you want a more direct approach don't hesitate to call us at:123 456 789 </h2>
                </div>
            </div>
            <div class="keno"/>
            <div class="row">
                <div class="col-lg-12 text-center">
                    <a class="btn btn-xl" href="mailto:dev@homemate.com?subject=HomeMate%20Contact%20Form&body=To%20Developer,%20%0D%0D%20My%20name%20is%20%22write%20your%20name%20%22%20and%20i%20am%20contacting%20you%20for%2E%2E%2E" target="_top">Send Message</a>
                </div>
                </div>
            </div>
    </section>
    
    
    
    
    
    
    
    
    <!-- #########################################################      Sign in/ register modal     ############################################################              -->
                    
                    
  <div class="modal fade bs-modal-sm" id="myModal" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-sm">
    <div class="modal-content">
        <br>
        <div class="bs-example bs-example-tabs">
            <ul id="myTab" class="nav nav-tabs">
              <li class="active"><a href="#signinn" data-toggle="tab">Admin Login</a></li>
            </ul>
        </div>
        
      <div class="modal-body">
            
        <div class="tab-pane fade active in" id="signinn">
            <form class="form-horizontal" action="j_security_check" method="post">
            <fieldset>
            <div class="control-group">
              <label class="control-label" for="username">Username:</label>
              <div class="controls">
                <input id="userid" name="j_username" type="text" class="form-control" required="required" class="input-medium">
              </div>
            </div>
            <div class="control-group">
              <label class="control-label" for="userpass">Password:</label>
              <div class="controls">
                <input id="passwordinput" name="j_password" type="password" class="form-control" required="required"  class="input-medium">
              </div>
            </div>
            <div class="control-group">
              <label class="control-label" for="signin"></label>
              <div class="controls">
                <button id="somebutton" id="signinn" name="signin" class="btn btn-success">Log In</button>
              </div>
            </div>
            </fieldset>
            </form>
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
    
    
    
    
    
    
    
    
    
    
    
    
    
    

    <footer>
        <div class="container">
            <div class="row">
                <div class="col-md-4">
                    <span class="copyright">Copyright &copy; HomeMate 2014-2015</span>
                </div>
                <div class="col-md-4">
                </div>
                <div class="col-md-4">
                    <ul class="list-inline quicklinks">
                        <li><a href="#">Privacy Policy</a>
                        </li>
                        <li><a href="#">Terms of Use</a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </footer>


    <!-- jQuery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
    <!-- Bootstrap Core JavaScript -->
    <script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
    <script language="javascript">
        document.onmousedown=disableclick;
        status="Right Click Disabled";
        Function disableclick(event){
          if(event.button==2){
             alert(status);
             return false;    
           }
        }
    </script>
    
</body>

</html>
