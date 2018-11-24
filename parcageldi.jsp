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

    <%



         String sorgu5="update kayit set onay=0 where mid=?";
         PreparedStatement sorgulama5=con.prepareStatement(sorgu5);
         sorgulama5.setInt(1,Integer.parseInt(request.getParameter("id")));
         sorgulama5.executeUpdate();


%>

           <%@include file="disconnect.jsp"%>


 <%
  response.sendRedirect("aktifariza.jsp");
        %>
        <p><a href="aktifariza.jsp">Geri</a></p>
</html>
    </body>