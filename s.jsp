<%@include file="header.jsp"%>
  
<%--
The taglib directive below imports the JSTL library. If you uncomment it,
you must also add the JSTL library to the project. The Add Library... action
on Libraries node in Projects view can be used to add the JSTL 1.1 library.
--%>
<%--
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
--%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
       
        <title>JSP Page</title>
    </head>
    <body>
 
    <h1>JSP Page</h1>
    
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
    <%@include file="connect.jsp"%>
    
    <%
        


String sqlsorgu="INSERT INTO musteri(firma_adi,Sokak_No,cadde,semt,ilce,il,posta_kodu,ilgiliKisi,tel1,tel2,dahili_no,cep_tel,faks,email) values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)"; 

PreparedStatement sorgulama=con.prepareStatement(sqlsorgu);

sorgulama.setString(1,request.getParameter("fad"));
sorgulama.setString(2,request.getParameter("sokak"));
sorgulama.setString(3,request.getParameter("cadde"));
sorgulama.setString(4,request.getParameter("semt"));
sorgulama.setString(5,request.getParameter("ilce"));
sorgulama.setString(6,request.getParameter("il"));
sorgulama.setString(7,request.getParameter("posta"));
sorgulama.setString(8,request.getParameter("ilgili"));
sorgulama.setString(9,request.getParameter("tel1"));
sorgulama.setString(10,request.getParameter("tel2"));
sorgulama.setString(11,request.getParameter("dno"));
sorgulama.setString(12,request.getParameter("ceptel"));
sorgulama.setString(13,request.getParameter("faks"));
sorgulama.setString(14,request.getParameter("email"));

sorgulama.executeUpdate();

    
    %>
     <%@include file="disconnect.jsp"%>
    <br>
    <p>Kayit Eklenmistir</p>
    <a href="form.jsp">Son Hali gormek icin tikla</a>
    </body>
</html>