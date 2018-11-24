<%@include file="header.jsp"%>
<%@ include file="Resource.jsp" %>
<html>
    <head>
        <%@include file="header.html"%>
    </head>
    <body>
        <%@include file="topborder.jsp"%>
        <% 
            PreparedStatement ps=con.prepareStatement("delete from personel where personel_id=?");
            ps.setInt(1,Integer.parseInt(request.getParameter("id")));
            ps.executeUpdate();
            response.sendRedirect("personel.jsp");
        %>
        <p><a href="personel.jsp">Geri</a></p>
    </body>
</html>
<%@include file="disconnect.jsp"%>
<%@include file="ResourceEnd.jsp" %>