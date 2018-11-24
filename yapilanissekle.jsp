<%@include file="header.jsp"%>
<%@ include file="Resource.jsp" %>
<html>
    <head>
        <%@include file="header.html"%>
    </head>
    <body>
        <%@include file="topborder.jsp"%>
        <%
            PreparedStatement sorgulama=con.prepareStatement("insert into yapilaniss values(?)");
            sorgulama.setString(1,request.getParameter("is"));
            sorgulama.executeUpdate();
            response.sendRedirect("yapilanis.jsp");
        %>
        <p><a href="yapilanis.jsp">Geri</a></p>
    </body>
</html>
<%@include file="disconnect.jsp"%>
<%@ include file="ResourceEnd.jsp" %>