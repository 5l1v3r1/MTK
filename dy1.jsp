<%@include file="header.jsp"%>
<%@ include file="Resource.jsp" %>
<html>
    <head>
        <%@include file="header.html"%>
    </head>
    <body>
        <%@include file="topborder.jsp"%>
        <%
            String name=request.getParameter("name");
            String namea=request.getParameter("namea");
            PreparedStatement sorgulama=con.prepareStatement("update yapilaniss set projeismi=? where projeismi=?");
            sorgulama.setString(1,name);
            sorgulama.setString(2,namea);
            sorgulama.executeUpdate();
            response.sendRedirect("yapilanis.jsp");
        %>
        <p><a href="yapilanis.jsp">Geri</a></p>
    </body>
</html>
<%@include file="disconnect.jsp"%>
<%@ include file="ResourceEnd.jsp" %>