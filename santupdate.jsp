<%@include file="header.jsp"%>
<%@ include file="Resource.jsp" %>
<html>
    <head>
        <%@include file="header.html"%>
    </head>
    <body>
        <%@include file="topborder.jsp"%>
    
<%


    String pno=request.getParameter("pno");
    String servis=request.getParameter("servis");
    int bakim=Integer.parseInt(request.getParameter("bakim"));
    String bay=request.getParameter("bay");
    String bgun=request.getParameter("bgun");
    String byil=request.getParameter("byil");
    String eay=request.getParameter("eay");
    String egun=request.getParameter("egun");
    String eyil=request.getParameter("eyil");
    
    String baslangic=byil+"/"+bgun+"/"+bay;
    String bitis=eyil+"/"+egun+"/"+eay;
     java.text.DateFormat df=new SimpleDateFormat("yyyy/dd/MM");
   
    String sorgu="update servisantlasmasi set projeno=?,baslangic=?,bitis=?,serviskapsami=?,periyodik_bakim=? where projeno=?";
    PreparedStatement sorgulama=con.prepareStatement(sorgu);
    sorgulama.setString(1,pno);
    sorgulama.setDate(2,new java.sql.Date(df.parse(baslangic).getTime()));
    sorgulama.setDate(3,new java.sql.Date(df.parse(bitis).getTime()));
    sorgulama.setString(4,servis);
    sorgulama.setInt(5,bakim);
    sorgulama.setString(6,pno);
    sorgulama.executeUpdate();
    
    
    %>
    <h1>Servis Antlasmasi</h1>
    
    <%--
    This example uses JSTL, uncomment the taglib directive above.
    To test, display the page like this: index.jsp?sayHello=true&name=Murphy
    --%>
    <%--
    <c:if test="${param.sayHello}">
        <!-- Let's welcome the user ${param.name} -->
        Hello ${param.name}!
    </c:if>
    --%>
    <p><a href="girismusteri.jsp">Geri</a></p>
    </body>
</html>
<%@include file="disconnect.jsp"%>
<%@ include file="ResourceEnd.jsp" %>