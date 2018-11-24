<%@include file="header.jsp"%>
<%@ include file="Resource.jsp" %>
<html>
    <head>
        <%@include file="header.html"%>
    </head>
    <body>
        <%@include file="topborder.jsp"%>
    <%

    String sqlsorgu="delete from kayit where mid=? ";
    PreparedStatement ps=con.prepareStatement(sqlsorgu);
    ps.setInt(1,Integer.parseInt(request.getParameter("id")));
    ps.executeUpdate();

    response.sendRedirect("acikariza.jsp");
    %>
  
</body>
</html>
<%@include file="disconnect.jsp"%>
<%@ include file="ResourceEnd.jsp" %>