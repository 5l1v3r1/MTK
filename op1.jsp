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
<%@include file="connect.jsp"%>
    
<%

        int pid=Integer.parseInt(request.getParameter("id"));
        String extra=request.getParameter("extra");
        
        if(extra==null)
        {
            extra="";
        }
        
           
   
    
    String sorgu="update periyodik set onay=2,onaytarihi=?,extrabilgi=? where pid=?";
    PreparedStatement sorgulama=con.prepareStatement(sorgu);
    sorgulama.setDate(1,new java.sql.Date(System.currentTimeMillis()));
    sorgulama.setString(2,extra);
    sorgulama.setInt(3,pid);
    sorgulama.executeUpdate();
    
   
    
    
    
    %>
     <%@include file="disconnect.jsp"%>
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
    <p><a href="onayariza.jsp">Back</a></p>
    
    </body>
</html>
