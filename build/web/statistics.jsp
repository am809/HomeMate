<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<c:import url="errorheader.jsp">
    <c:param name="title" value="Admin Page."></c:param>
</c:import>

<div class="keno"/>

<% String user = (String)session.getAttribute("name");
if("Admin".equals(user)){%>

<sql:transaction dataSource="jdbc/test" >
    
    
    
    
    <c:forEach items="${imagenames}" var="imagename">
        <img src="images/${imagename}">
    </c:forEach>
    
    
    
    
    
    <sql:query sql="select * from ads order by city asc" var="results" />     
    <div class="container">
        <div class="keno"/>
        <c:set var="counter" value="0" />
        <c:forEach var="ads" items="${results.rows}" varStatus="row">
            <c:set var="counter" value="${counter+1}" />
        </c:forEach>
        <p><h3><center>Site Statistics !!</center></h3>
        <br>
        <p><h4>There are currently <a style="color:green"><c:out value="${counter}"></c:out> </a> Ads up and running ! 


        <sql:query sql="select * from signup order by user asc" var="results2" />     
        <c:set var="counter2" value="0" />
        <c:forEach var="users" items="${results2.rows}" varStatus="row">
            <c:set var="counter2" value="${counter2+1}" />
        </c:forEach>
        <p><h4>There are currently <a style="color:green">${counter2}</a> Users registered !
                <p><h4>So only <a style="color:red">${counter2 - counter}</a> users don't have any ads at the moment.
    </div>
                
</sql:transaction>
        
        <h4> <a style="color:blue"><%=com.servlets.Listen.getNumberOfSessions()%></a> users currently using the app. </h4>
        <h4>The registered users that have been logged into the site are : <a style="color:green"><% 
        List users = (List)session.getAttribute("users");
        for(int i=0; null!=users && i < users.size(); i++) {
            out.println( users.get(i)+", ");
        }  
    %></a></h4>
<%} else{ %>
        <p><h3><center>
                <br>
                Sorry You have to be the Administrator to see this page !!
                <div class="keno"/>
                <a style="color:green">You will be redirected after reading this !</a>
            </center></h3>
        
        <meta http-equiv="refresh" content="6; url=${pageContext.request.contextPath}/index.jsp" />
    <%}%>



    
    





