<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<head>   
<link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.1.1/css/bootstrap.min.css">

<link href="style.css" rel="stylesheet">
<link href='http://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'>
<link rel="shortcut icon" href="${pageContext.request.contextPath}/images/ico2.png">






<title>${param.title}</title>  
</head>  
<body oncontextmenu="return false">
    <nav class="navbar navbar-inverse navbar-fixed-top ">
        <div class="container">
            <div class="container-fluid">
                <div class="navbar-header">
                  <a class="navbar-brand " href="index.jsp">HomeMate</a>
                </div>
                <div>
                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="index.jsp#services"> Services</a></li>
                        <li><a href="index.jsp#cities"> Cities</a></li>
                        <li><a href="index.jsp#about"> About</a></li>
                        <li><a href="index.jsp#map"> Map</a></li>
                        <li><a href="index.jsp#contact"> Contact</a></li>
                        <% String user = (String)session.getAttribute("name");
                        if(user == null){%>
                            <li><a href="#signup" data-toggle="modal" data-target=".bs-modal-sm"><span class="glyphicon glyphicon-log-out"></span> Sign in/Register</a></li>
                        <% }
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
            </div>
        </div>
    </nav>

<div class="keno"></div>

<!-- #########################################################      Sign in/ register modal     ############################################################              -->
                    
 <%@ include file="/WEB-INF/jspf/log-reg.jspf"  %>     

<div class="keno"></div>     

    
    
