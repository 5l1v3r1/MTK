<%@include file="header.jsp"%>
<%@ include file="Resource.jsp" %>
<html>
    <head>
        <%@include file="header.html"%>
    </head>
    <body>
        <%@include file="topborder.jsp"%>
     <%
    
    String sqlsorgu="delete from yapilanis where proje_no=? and musteri_id=?";
    PreparedStatement ps=con.prepareStatement(sqlsorgu);
    ps.setString(1,request.getParameter("id"));
ps.setInt(2,Integer.parseInt(request.getParameter("nam")));
    ps.executeUpdate();
    String sorgu2="delete from servisantlasmasi where projeno=?";
    PreparedStatement sorgulama=con.prepareStatement(sorgu2);
    sorgulama.setString(1,request.getParameter("id"));
    sorgulama.executeUpdate();
    
    %>
    <a href="projearama.jsp?proje=<%=request.getParameter("proje")%>">Son Hali gormek icin tikla</a>
    </body>
</html>
<%@include file="disconnect.jsp"%>
<%@ include file="ResourceEnd.jsp" %>