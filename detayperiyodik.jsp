<%@include file="header.jsp"%>  
<%@page import="java.util.*"%>
<%@page import="java.text.*"%>

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
    <h3>Musteri Bilgileri</h3>
    <%@include file="connect.jsp"%>
<%

int g=0;

      
        int pid=Integer.parseInt(request.getParameter("pid"));
        
        String sorgu="select * from periyodik where pid=?";
        PreparedStatement sorgulama=con.prepareStatement(sorgu);
        sorgulama.setInt(1,pid);
        ResultSet sonuc=sorgulama.executeQuery();
        sonuc.next();
        
       String sorgu4="select * from yapilanis where proje_no=?";
        PreparedStatement sorgulama4=con.prepareStatement(sorgu4);
        sorgulama4.setString(1,request.getParameter("id"));
        ResultSet sonuc4=sorgulama4.executeQuery();
        sonuc4.next();
        
        
        String sorguu="select * from servisantlasmasi where projeno=? ";
        PreparedStatement s=con.prepareStatement(sorguu);
        s.setString(1,request.getParameter("id"));
        ResultSet result=s.executeQuery();
        result.next();
        
        
        String sorgu3="select * from musteri where firma_adi=?";
        PreparedStatement sorgula4=con.prepareStatement(sorgu3);
        sorgula4.setString(1,sonuc4.getString(2));
        ResultSet sonuc3=sorgula4.executeQuery();
        sonuc3.next();
        
       
       
        
    %>
    
     <table cellpadding="4" border="1">
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
        
        
        <h3>Proje Bilgisi</h3>
        
        <table border="1">
        <tr>
        
        <td>ProjeNo</td>
        <td>Yapilan Isin Cinsi</td>
        <td>Teslim Tarihi</td>
        <td>Tutar</td>
        <td>Bilgi</td>
        <td>Garanti Suresi</td>
        </tr>
        <td><%=sonuc4.getString(3)%></td>
        <td><%=sonuc4.getString(4)%></td>
        <td><%=sonuc4.getDate(5)%></td>
        <td><%=sonuc4.getFloat(6)%></td>
        <td><%=sonuc4.getString(7)%></td>
        <td><%=sonuc4.getInt(8)%></td>
        </table>
        
<hr>
    <strong>Servis Kapsami:<%=result.getString(4)%></strong>
        <hr>
        <h2>Periyodik Bakim Zamani Gelmistir</h2>
            
         <form action="detayperiyodik1.jsp" method=post>
         
         <input type=hidden value="<%=sonuc.getInt(1)%>" name="id">
         
         <p align=center><input type=submit value="Bu kaydi Print etmis yada arizaya bugun gidilcekse lutfen tiklayin"></p>
         
         </form>
          
         
        
        <%
   
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
    
    </body>
</html>
