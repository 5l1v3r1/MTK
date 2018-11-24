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
<%

    String firma=request.getParameter("firma");

    PreparedStatement sorgu=con.prepareStatement("select firma_adi,musteri_id from musteri where firma_adi LIKE ? ");
    sorgu.setString(1,firma+'%');
    ResultSet sonuc=sorgu.executeQuery();



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
    <table border="0">
   <% while(sonuc.next()) { %>
    <tr>
        <td><a href="kayitariza.jsp?firma=<%=sonuc.getString(2)%>"><%=sonuc.getString(1)%></a></td>
    </tr>
    <% }%>
    
    
    
    </table>
    </body>
         <%@include file="disconnect.jsp"%>

</html>
