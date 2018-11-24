<%@include file="header.jsp"%>
<%@ include file="Resource.jsp" %>
<html>
    <head>
        <%@include file="header.html"%>
    </head>
    <body>
        <%@include file="topborder.jsp"%>
        <%
            PreparedStatement sorgulama=con.prepareStatement("update personel set name=?,surname=? where personel_id=?");
            sorgulama.setString(1,request.getParameter("ad"));
            sorgulama.setString(2,request.getParameter( "soyad"));
            sorgulama.setInt(3,Integer.parseInt(request.getParameter("id")));
            sorgulama.executeUpdate();
            response.sendRedirect("personel.jsp");
        %>
        <p><a href="personel.jsp">Geri</a></p>
    </body>
</html>
<%@include file="disconnect.jsp"%>
<%@include file="ResourceEnd.jsp" %>