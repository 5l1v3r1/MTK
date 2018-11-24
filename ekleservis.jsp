<%@include file="header.jsp"%>
<%@ include file="Resource.jsp" %>
<html>
    <head>
        <%@include file="header.html"%>
    </head>
    <body>
        <%@include file="topborder.jsp"%>
        <%
            PreparedStatement sorgulama=con.prepareStatement("insert into arizasonucu values(?)");
            sorgulama.setString(1,request.getParameter( "mesaj"));
            sorgulama.executeUpdate();
            response.sendRedirect("servissonuc.jsp");
        %>
        
    </body>
</html>
<%@include file="disconnect.jsp"%>
<%@ include file="ResourceEnd.jsp" %>