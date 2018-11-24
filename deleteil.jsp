<%@include file="header.jsp"%>
<%@ include file="Resource.jsp" %>
<html>
    <head>
        <%@include file="header.html"%>
    </head>
    <body>
        <%@include file="topborder.jsp"%>
    <%
    
    String sqlsorgu="delete from musteri where musteri_id=? ";
    PreparedStatement ps=con.prepareStatement(sqlsorgu);
    ps.setInt(1,Integer.parseInt(request.getParameter("id")));
    ps.executeUpdate();
 
    %>   
    <a href="ilarama.jsp?il=<%=request.getParameter("il")%>">Son Hali gormek icin tikla</a>
</body>
</html>
<%@include file="disconnect.jsp"%>
<%@ include file="ResourceEnd.jsp" %>