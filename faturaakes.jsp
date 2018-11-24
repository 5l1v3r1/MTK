<%@include file="header.jsp"%>
<%@ include file="Resource.jsp" %>
<html>
    <head>
        <%@include file="header.html"%>
    </head>
    <body>
        <%@include file="topborder.jsp"%>
<%

    PreparedStatement sorgulama=con.prepareStatement("update kayit set fatura_kesim=2 where mid=?");
    sorgulama.setInt(1,Integer.parseInt(request.getParameter("id")));
    sorgulama.executeUpdate();
    






%>

    
    <%--
    This example uses JSTL, uncomment the taglib directive above.
    To test, display the page like this: index.jsp?sayHello=true&name=Murphy
    --%>
    <%--
    <c:if test="${param.sayHello}">
        <!-- Let's welcome the user ${param.name} -->
        Hello ${param.name}!
    </c:if>
    --%>
    <p><a href=faturaa.jsp>Fatura Kesilmistir</a></p>
    </body>
</html>
<%@include file="disconnect.jsp"%>
<%@ include file="ResourceEnd.jsp" %>