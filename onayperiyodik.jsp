<%@page contentType="text/html"%>
<%@page import="java.sql.*"%>
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


    
    <%--
    This example uses JSTL, uncomment the taglib directive above.
    To test, display the page like this: index.jsp?sayHello=true&name=Murphy
    --%>
    <%--
    <c:if test="${param.sayHello}">
        <!-- Let's welcome the user ${param.name} -->
        Hello ${param.name}!
    </c:if>
    --%><%
    
    int id=Integer.parseInt(request.getParameter("id"));
    String name=request.getParameter("name");
    String pno=request.getParameter("pno");
    
    
    %>
    <h1><%=name.toUpperCase() %> Sirketinin --<%=pno%> lu projesine periyodik Bakim </h1>
    <form action="op1.jsp" method=post>
    <input type=hidden value="<%=id%>" name="id">
    
    <table>
    
    <tr>
    <td>Extra Bi Sorun Olduysa Lutfen yazip ondan sonraa gidildi buttonuna basiniz</td>
    <td><textarea name="extra"></textarea></td>
    </tr>
    <tr>
    <td><input type=submit value="Gidildi"></td>
    </tr>
    
    
    
    </table>
    
    
    </form>
    </body>
</html>
