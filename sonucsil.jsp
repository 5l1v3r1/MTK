<%@include file="header.jsp"%>
<%@ include file="Resource.jsp" %>
<html>
    <head>
        <%@include file="header.html"%>
    </head>
    <body>
        <%@include file="topborder.jsp"%>
        <%
            PreparedStatement sorgulama=con.prepareStatement("delete from arizasonucu where sorun=?");
            sorgulama.setString(1,request.getParameter( "name"));
            sorgulama.executeUpdate();
            response.sendRedirect("servissonuc.jsp");
        %>
        <p><a href="servissonuc.jsp">Geri</a></p>
    </body>
</html>
<%@include file="disconnect.jsp"%>
<%@ include file="ResourceEnd.jsp" %>