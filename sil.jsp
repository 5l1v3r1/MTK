<%@page import="java.sql.*"%>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
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

 <%
int f=0;
HttpSession onemli=request.getSession();
if(onemli.getValue("user").equals("admin")&&onemli.getValue("pas")=="gecerli")
{
   f=1;
}
try{
if(onemli.getValue("bilgiler")=="bilgiler")
{
    f=1;
}
} catch(Exception e) { }

if(f==0)
{
    out.println("<strong><a href=form.jsp>Yetkiniz Yok</a></strong>");
}
else{
%>
    
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
    <%
    
    
    int id=Integer.parseInt(request.getParameter("id"));
    String name=request.getParameter("name");
       %>
    <form action="delete.jsp" method=post>
  
    <input type=hidden name="id" value="<%=id%>">
    
    <p>Musteri Id si <%=id%></p>
    <p>Firma   Adi   <%=name%></p>
    <p>Olan sirketi silmekten eminmisiniz? </p>
    
    <p><input type=submit value="sil">
    
    </form>
    <p><a href="formmusteri.jsp">Vazgectim</a></p>
    <% } %>
    </body>
</html>
