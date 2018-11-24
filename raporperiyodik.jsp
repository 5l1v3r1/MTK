<%@include file="header.jsp"%>
<%@ include file="Resource.jsp" %>
<html>
    <head>
        <%@include file="header.html"%>
    </head>
    <body>
        <%@include file="topborder.jsp"%>

   <%
          java.util.Date d=new java.util.Date();
int f=0;
HttpSession onemli=request.getSession();
if(onemli.getValue("user").equals("admin")&&onemli.getValue("pas")=="gecerli")
{
   f=1;
}
try{
if(onemli.getValue("raporlama")=="raporlama")
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
    
    <%
    
        Statement sorgulama=con.createStatement();
        ResultSet sonuc=sorgulama.executeQuery("select * from periyodik where onay=2 order by onaytarihi desc");
        
        %>
        
        <table border="1">
        
        <tr>
        <td><strong>Proje No</strong></td>
 
       
        <td><strong>Kayit Tarihi</strong></td>
      
      
        <td><strong>Onay Tarihi</strong></td>
       
        <td><strong>Extra Bilgi</strong></td>
        </tr>
        
        <% while(sonuc.next()) { %>
        <tr>
        <td><%=sonuc.getString(2)%></td>
        <td><%=sonuc.getDate(6)%></td>
        <td><%=sonuc.getDate(4)%></td>
        <td><%=sonuc.getString(5)%></td>
        </tr>
        <% } %>
        
        
        
        
        
        
        </table>
      
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
    
    
    <% } %>
 

    </body>
</html>
<%@include file="disconnect.jsp"%>
<%@ include file="ResourceEnd.jsp" %>