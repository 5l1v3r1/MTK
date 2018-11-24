<%@include file="header.jsp"%>
<%@ include file="Resource.jsp" %>
<html>
    <head>
        <%@include file="header.html"%>
    </head>
    <body>
        <%@include file="topborder.jsp"%>
   
     <%
    String il=request.getParameter("il");
    
    if(il==null)
        il="";
    String sorgu="select * from musteri where il LIKE ? and statu=1 ";
    PreparedStatement sorgulama=con.prepareStatement(sorgu);
    sorgulama.setString(1,il+'%');
    ResultSet sonuc=sorgulama.executeQuery();
            
            %>
            
            <table cellpadding="4" border=""1>
     <tr>
     <td><b>Projeler</b></td>
     <td><b>Guncelle</b></td>
     <td><b>Kayit Sil</b></td>
     <td><b>Musteri_No</b></td>
     <td><b>Firma_Adi</b></td>
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
         <td nowrap><a href="ildelete.jsp?id=<%=sonuc.getString(1) %>&&il=<%=il%>&&name=<%=sonuc.getString(2)%>">Kayit Sil</a></td>
        <td>&nbsp;<%=sonuc.getString(1)%></td>
        <td>&nbsp;<%=sonuc.getString(2)%></td>
        <td>&nbsp;<%=sonuc.getString(3)%></td>
        <td>&nbsp;<%=sonuc.getString(4)%></td>
        <td>&nbsp;<%=sonuc.getString(5)%></td>
        <td>&nbsp;<%=sonuc.getString(6)%></td>
        <td>&nbsp;<%=sonuc.getString(7)%></td>
        <td>&nbsp;<%=sonuc.getString(8)%></td>
        <td>&nbsp;<%=sonuc.getString(9)%></td>
        <td>&nbsp;<%=sonuc.getString(10)%></td>
        <td>&nbsp;<%=sonuc.getString(11)%></td>
        <td>&nbsp;<%=sonuc.getString(12)%></td>
        <td>&nbsp;<%=sonuc.getString(13)%></td>
        <td>&nbsp;<%=sonuc.getString(14)%></td>
         <td>&nbsp;<%=sonuc.getString(15)%></td>
                   </tr>
          <% modul++;
            }
            
              
            
     %>
      
     </table>
     
     <p><a href="girismusteri.jsp">Geri</a></p>
</html>
<%@include file="disconnect.jsp"%>
<%@ include file="ResourceEnd.jsp" %>