<%@include file="header.jsp"%>
<%@ include file="Resource.jsp" %>
<html>
    <head>
        <%@include file="header.html"%>
    </head>
    <body>
        <%@include file="topborder.jsp"%>
        <%
            PreparedStatement sorgulama=con.prepareStatement("insert into personel (name,surname) values(?,?)");
            sorgulama.setString(1,request.getParameter( "ad"));
            sorgulama.setString(2,request.getParameter( "soyad"));
            sorgulama.executeUpdate();
            response.sendRedirect("personel.jsp");
        %>
        <p><a href="personel.jsp">Eklenmistir</a></p>
    </body>
</html>
<%@include file="disconnect.jsp"%>
<%@include file="ResourceEnd.jsp" %>