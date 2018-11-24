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

HttpSession onemli=request.getSession();
if(onemli.getValue("pas")!="gecerli")
{
    response.sendRedirect("login.jsp");
}



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
    <h3><strong style="font-size="15">Musteri Bilgileri</strong></h3>
      <%@include file="connect.jsp"%>
    <%
        
       
        Statement st=con.createStatement();
        ResultSet sonuc=st.executeQuery("select * from musteri ");
%>
     <table cellpadding="4" border="1">
     <tr>
     <td><b>Projeler</b></td>
     <td><b>Guncelle</b></td>
     <td><b>Kayit Sil</b></td>
     <td><b>Musteri_No</b></td>
     <td><b>Firma_Ad?</b></td>
     <td><b>Sokak/No</b></td>
     <td><b>Cadde</b></td>
     <td><b>Semt</b></td>
     <td><b>Ilce</b></td>
     <td><b>Il</b></td>
     <td><b>PostaKodu</b></td>
     <td><b>Yetkili_Kisi</b></td>
     <td><b>Tel1</b></td>
     <td><b>Tel2</b></td>
     <td><b>Dahili_No</b></td>
     <td><b>Cep_Tel</b></td>
     <td><b>Faks_No</b></td>
     <td><b>Email Adresi</b></td>
     </tr>
     <%
            int modul=1;
            String fonrengi;
            
            while(sonuc.next())
            {
                if(modul%2==1)  fonrengi="green";
                else        fonrengi="red";
                
                %>
          <tr>
        <td><a href="projeler.jsp?id=<%=sonuc.getString(1) %>&&name=<%=sonuc.getString(2)%>">Projeler</a></td>
       <td><a href="cv.jsp?id=<%=sonuc.getString(1) %>">Guncelle</a></td>
         <td><a href=sil.jsp?id=<%=sonuc.getString(1) %>&&name=<%=sonuc.getString(2)%>>Kayit SIl</a></td>
        <td><%=sonuc.getString(1)%></td>
        <td><%=sonuc.getString(2)%></td>
        <td><%=sonuc.getString(3)%></td>
        <td><%=sonuc.getString(4)%></td>
        <td><%=sonuc.getString(5)%></td>
        <td><%=sonuc.getString(6)%></td>
        <td><%=sonuc.getString(7)%></td>
        <td><%=sonuc.getString(8)%></td>
        <td><%=sonuc.getString(9)%></td>
        <td><%=sonuc.getString(10)%></td>
        <td><%=sonuc.getString(11)%></td>
        <td><%=sonuc.getString(12)%></td>
        <td><%=sonuc.getString(13)%></td>
        <td><%=sonuc.getString(14)%></td>
         <td><%=sonuc.getString(15)%></td>
                   </tr>
          <% modul++;
            }
            
               
            
     %>
        <%@include file="disconnect.jsp"%>
     </table>
     
     <p><a href="form.jsp">Geri</a></p
    </body>
</html>
