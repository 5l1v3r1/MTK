<%@include file="header.jsp"%>
<%@ include file="Resource.jsp" %>
<html>
    <head>
        <%@include file="header.html"%>
    </head>
    <body>
        <%@include file="topborder.jsp"%>
    <%
  
    String proje=request.getParameter("proje");
    int i=0;
 
        out.println(proje);
    String sorgu="select * from yapilanis where proje_no LIKE ? order by firma_adi";
    PreparedStatement sorgulama=con.prepareStatement(sorgu);
    sorgulama.setString(1,proje+'%');
    ResultSet sonuc=sorgulama.executeQuery();
      try{
    String firmaname;
    if(sonuc.next())
    {

    firmaname=sonuc.getString(2);
    
    }
    
    else
            firmaname=" ";
  
    sonuc.beforeFirst();
        java.util.Date d=new java.util.Date();
        DateFormat df=new SimpleDateFormat("yyyy-MM-dd");
    %>
    
     <table border="1">
    <tr>
    
    <td><b>Firma Adi</b></td>
    <td><b>Proje No</b></td>
    <td><b>Yapilan Isin Cinsi</b></td>
    <td><b>Teslim Tarihi</b></td>
    <td><b>Tutar</b></td>
    <td><b>Birim</b></td>
    <td><b>Bilgi</b></td>
    <td><b>Garanti Suresi</b></td>
    <td><b>Son Kullanicisi</b></td>
    <td><b>Proje Ekle</b></td>
    <td><b>Proje Duzelt</b></td>
    <td><b>Proje Sil</b></td>
    <td><b>Servis Antlasmasi</b></td>
    </tr>
  
 <%
        
      while(sonuc.next())
{
           
          String sorgu2="select count(*) from servisantlasmasi where projeno=? ";
 PreparedStatement sorgulama2=con.prepareStatement(sorgu2);
     sorgulama2.setString(1,sonuc.getString(3));
      ResultSet sonuc2=sorgulama2.executeQuery();      
    sonuc2.next();
           String sorgu3="select * from servisantlasmasi where projeno=? ";
           PreparedStatement sorgulama3=con.prepareStatement(sorgu3);
           sorgulama3.setString(1,sonuc.getString(3));
           ResultSet sonuc3=sorgulama3.executeQuery();
           sonuc3.next();
   
        %>
    <tr>
   
    <td><%=sonuc.getString(2)%></td>
    <td><%=sonuc.getString(3)%></td>  
    <td width="120" height="80"><%=sonuc.getString(4)%></td>    
  
    <%
  try{ %>
    <td><%=sonuc.getDate(5)%></td>
    <%}   catch(Exception e){ }%>
    <td><%=sonuc.getFloat(6)%></td>
    <td><%=sonuc.getString(9)%></td>
      <td><%=sonuc.getString(7)%></td>  
    
     <td><%=sonuc.getInt(8)%></td>
      <td><%=sonuc.getString(10)%></td>
    
    <td nowrap><a href="projeekle2.jsp?id=<%=sonuc.getInt(1)%>&&name=<%=sonuc.getString(2)%>">Proje Ekle</a></td>
    <td nowrap><a href="projeduzelt.jsp?id=<%=sonuc.getString(3)%>&&proje=<%=proje%>">Proje Duzelt</a></td>
     <td nowrap><a href="silproje.jsp?id=<%=sonuc.getString(3)%>&&nam=<%=sonuc.getInt(1)%>&&isim=<%=firmaname%>&&proje=<%=proje%>">Proje sil</a></td>
      <% if(Integer.parseInt(sonuc2.getString(1))>0){ 
               try{
                if(df.format(sonuc3.getDate(3)).compareTo(df.format(d))==0){
i=1;%>
                 <td nowrap><a href="baksaozel.jsp?pno=<%=sonuc.getString(3)%>">Servis Antlasmasinin Son gunu</a></td><% }}catch(Exception e){ out.println(e.getMessage());}  %>
                <%  if(sonuc3.getDate(3).before(d)&&i!=1){ %>
        <td nowrap><a href="updateservis.jsp?pno=<%=sonuc.getString(3)%>">Servis Antlasmasi Bitmis Tekrar Yapmak icin tiklayin</a></td>    <% } else if(i!=1) {%>        
                

     <td nowrap><a href="baksaozel.jsp?pno=<%=sonuc.getString(3)%>">Servis Antlasmasi Var Bakmak icin tiklayin</a></td><% } } %>
      <% if(Integer.parseInt(sonuc2.getString(1))==0){ %>
     <td nowrap><a href="servisantlasmasiyap.jsp?pno=<%=sonuc.getString(3)%>">Servis Antlasmasi Yok Yapmak icin tiklayin</a></td><% } %>
  <%  
  i=0;
        }
    }
    catch(Exception e)
    {
        %><p>Proje bulunamadi</p> <% 
    }

     
%>

    </table>
       <p><a href="girismusteri.jsp">Geri</a></p>
    </body>
</html>
<%@include file="disconnect.jsp"%>
<%@ include file="ResourceEnd.jsp" %>