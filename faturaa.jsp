<%@include file="header.jsp"%>
<%@ include file="Resource.jsp" %>
<html>
    <head>
        <%@include file="header.html"%>
    </head>
    <body>
        <%@include file="topborder.jsp"%>
    <%
int f=0;
HttpSession onemli=request.getSession();
if(onemli.getValue("user").equals("admin")&&onemli.getValue("pas")=="gecerli")
{
   f=1;
}
try{
if(onemli.getValue("faturakes")=="faturakes")
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
    ResultSet sonuc=sorgulama.executeQuery("select * from kayit where fatura_kesim=1 order by onay_tarihi,onay_saati");      
    
        
    
   %> 
    <table border="1">
    
    
    <tr>
    <td><strong>Firma Adi</strong></td>
    <td><strong>Proje No</strong></td>
    <td><strong>Onay Tarihi</strong></td>
    <td><strong>Onay Saati</strong></td>
    <td><strong>Not</strong></td>
    <td><strong>Ucret</strong></td>
    <td><strong>Fatura Kes</strong></td>
    </tr>
    <% while(sonuc.next()) { %>
    <tr>
    <td><%=sonuc.getString(2)%></td>
    <td><%=sonuc.getString(3)%></td>
    <td><%=sonuc.getDate(11)%></td>
    <td><%=sonuc.getTime(19)%></td>
    <td><%=sonuc.getString(20)%></td>
    <td><%=sonuc.getFloat(15)%></td>
    <td><a href="faturaakes.jsp?id=<%=sonuc.getInt(1)%>">Faturayi Kes</a></td>
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
   
    </body>
         <% } %>
</html>
<%@include file="disconnect.jsp"%>
<%@ include file="ResourceEnd.jsp" %>