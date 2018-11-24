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

    <form action="kullasifre.jsp" method=post>
    <table>
    <tr>
    
    <td>Lutfen Eski sifreyi giriniz&nbsp;<input type=password name="sifre"> </td>
    </tr>
    <tr>
    
    <td>Yeni Sifreyi Giriniz&nbsp;&nbsp;&nbsp;<input type=password name="ysifre"> </td>
    </tr>
    <tr>
    <td>Yeni Sifreyi Tekrar Giriniz&nbsp; <input type=password name="tekrars?fre"></td>
    </tr>
    <tr>
    
    <td><input type=submit value="degistir"></td>
    </tr>

    </table>
  </form>
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
    <p><a href="form.jsp">Geri</a></p>
    </body>
         <%@include file="disconnect.jsp"%>
</html>
