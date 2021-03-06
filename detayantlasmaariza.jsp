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
    
      
        String sorgu="select * from kayit where mid=?";
        PreparedStatement sorgulama=con.prepareStatement(sorgu);
        sorgulama.setInt(1,Integer.parseInt(request.getParameter("id")));
        ResultSet sonuc=sorgulama.executeQuery();
        sonuc.next();
       
       String sorgu2="select * from servisantlasmasi where projeno=?";
       PreparedStatement sorgulama2=con.prepareStatement(sorgu2);
       sorgulama2.setString(1,sonuc.getString(3));
       ResultSet sonuc2=sorgulama2.executeQuery();
      
        %>
        <h1>Servis Antlasmasi Bilgileri</h1>
        
        <table border="1">
        <tr>
        <td>Proje No</td>
        <td>Baslangic Zamani</td>
        <td>Bitis Zamani</td>
        <td>Servis Kapsami</td>
        <td>Periyodik Bakim</td>
        </tr>
        <% while(sonuc2.next()) {

 %>
        <tr>
        <td><%=sonuc2.getString(1)%></td>
        <td><%=sonuc2.getDate(2)%></td>
        <td><%=sonuc2.getDate(3)%></td>
        <td><%=sonuc2.getString(4)%></td>
        <td><%=sonuc2.getInt(5)%></td>
        </tr>
        <% } %>
        
        </table>
        <hr>
        <h2>Musteri Bilgileri</h2>
        <%
        String sorgu3="select * from musteri where firma_adi=?";
        PreparedStatement sorgu4=con.prepareStatement(sorgu3);
        sorgu4.setString(1,sonuc.getString(2));
        ResultSet sonuc3=sorgu4.executeQuery();
        sonuc3.next();
        %>
        
        <table cellpadding="4" border=""1>
     <tr>
     
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
          <tr>
          <td><%=sonuc3.getInt(1)%></td>
          <td><%=sonuc3.getString(2)%></td>
          <td><%=sonuc3.getString(3)%></td>
          <td><%=sonuc3.getString(4)%></td>
          <td><%=sonuc3.getString(5)%></td>
          <td><%=sonuc3.getString(6)%></td>
          <td><%=sonuc3.getString(7)%></td>
          <td><%=sonuc3.getString(8)%></td>
          <td><%=sonuc3.getString(9)%></td>
          <td><%=sonuc3.getString(10)%></td>
          <td><%=sonuc3.getString(11)%></td>
          <td><%=sonuc3.getString(12)%></td>
          <td><%=sonuc3.getString(13)%></td>
          <td><%=sonuc3.getString(14)%></td>
          <td><%=sonuc3.getString(15)%></td>
          </tr>
        </table>
        <strong>Servis Antlasmasi Var</strong>
        <hr>
        <h2>Ariza Bilgileri</h2>
        
         <table border="1">
         <tr>
         <td><strong>ProjeNo</strong></td>
         <td><strong>Firma_Adi</strong></td>
         <td><strong>Kayit Tarihi ve Saati</strong></td>
         <td><strong>Sikayeti Soleyen Ilgili Kisi</strong></td>
         <td><strong>Tel</strong></td>
         <td><strong>Sorun</strong></td>
         <td><strong>Sikayeti Kaydeden</strong></td>
         </tr>
            <tr>
       <td><%=sonuc.getString(3)%></td>
       <td><%=sonuc.getString(2)%></td>
       <td><%=sonuc.getDate(4)%>----<%=sonuc.getTime(5)%></td>     
       <td><%=sonuc.getString(6)%></td>           
        <td><%=sonuc.getString(7)%></td> 
        <td><%=sonuc.getString(8)%></td>
        <td><%=sonuc.getString(9)%></td>
            </tr>
            
         </table>
         
          <form action="detayantlasmaariza1.jsp" method=post>
         
         <input type=hidden value="<%=sonuc.getInt(1)%>" name="id">
         
         <p align=center><input type=submit value="Bu kaydi Print etmis yada arizaya bugun gidilcekse lutfen tiklayin"></p>
         
         </form>
        
         
         
        
         
      
         
        <%
        
      
        %>
        
     <%@include file="disconnect.jsp"%>
    </body>
</html>
