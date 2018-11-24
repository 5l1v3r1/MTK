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
      
       String sorgu2="select * from servisantlasmasi where projeno=?";
        PreparedStatement ps=con.prepareStatement(sorgu2);
       
        ps.setString(1,request.getParameter("pno"));
        ResultSet sonuc=ps.executeQuery();
                       
                %>
                
                <table border="1">
<tr>

<td>Baslangic zamani</td>
<td>Bitis Zamani</td>
<td>Servis Kapsami</td>
<td>Periyodik Bakim</td>
<td>Servis Antlasmasini sil</td>
</tr>

 <% while(sonuc.next())      {   %>
        
        <tr>
       
         <td><%=sonuc.getString(2) %></td>
          <td><%=sonuc.getString(3) %></td>
           <td><%=sonuc.getString(4) %></td>
           <td><%=sonuc.getString(5) %></td>
           <td><a href="baksasil.jsp?pno=<%=sonuc.getString(1)%>">Servis Antlasmasini Sil</a></td>
        </tr>
        <% } 

%>

     <%@include file="disconnect.jsp"%>
     
    </body>
</html>
