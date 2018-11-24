<%@include file="header.jsp"%>
<%@ include file="Resource.jsp" %>
<html>
    <head>
        <%@include file="header.html"%>
    </head>
    <body>
        <%@include file="topborder.jsp"%>
        <%
            PreparedStatement sorgulama=con.prepareStatement("delete from kullanicilar where kullaniciid=?");
            int id =Integer.parseInt(request.getParameter("user"));
            sorgulama.setInt(1,id);
            sorgulama.executeUpdate();
        %>
        <p><a href="kullanicilar.jsp">Silinmistir</a></p>
    </body>
</html>
<%@include file="disconnect.jsp"%>
<%@ include file="ResourceEnd.jsp" %>

<%  response.sendRedirect("kullanicilar.jsp"); %>