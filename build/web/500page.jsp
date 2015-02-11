<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<c:import url="errorheader.jsp">
    <c:param name="title" value=":)"></c:param>
</c:import>

<div class="keno"></div>
<div class="container">
    <div class="keno"></div>
    <center>
        <div class="keno"><h1> You see this page cause a server error occurred.</h1> </div>
        <h4>It is nothing to be afraid !</h4>
        <h4 style="color:green">You will be redirected after reading this.</h4>
        
        <meta http-equiv="refresh" content="6; url=${pageContext.request.contextPath}/index.jsp" />
    </center>
</div>
