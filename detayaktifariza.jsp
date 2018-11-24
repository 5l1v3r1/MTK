<%@include file="header.jsp"%>
<%@ include file="Resource.jsp" %>
<html>
    <head>
        <%@include file="header.html"%>
    </head>
    <body>
        <%@include file="topborder.jsp"%>
    
<%

    if(request.getParameter("btn_submit")==null)
    {    
    
int g=0;
java.util.Date d=new java.util.Date();

        String sorgu="select * from kayit where mid=?";
        PreparedStatement sorgulama=con.prepareStatement(sorgu);
        sorgulama.setInt(1,Integer.parseInt(request.getParameter("id")));
        ResultSet sonuc=sorgulama.executeQuery();
        sonuc.next();
        String pno=sonuc.getString(3);
        String bolge=sonuc.getString("bolge");
        
        int z=0;
                if(!pno.equals("ProjesizAriza")){
                z=1;
                    }

        int garanti=Integer.parseInt(request.getParameter("garan"));

        String gg=" ";

        if(garanti==1)  gg="Garanti Suresi icinde";
        else            gg="Garanti suresi bitmis";
        /*String sorgu3="select count(*) from musteri where firma_adi=? and statu=1";
        PreparedStatement sorgula4=con.prepareStatement(sorgu3);
        sorgula4.setString(1,sonuc.getString(2));
        ResultSet sonuc3=sorgula4.executeQuery();
        sonuc3.next();*/

        String sorgu4="select * from yapilanis where proje_no=?";
        PreparedStatement sorgulama4=con.prepareStatement(sorgu4);
        sorgulama4.setString(1,sonuc.getString(3));
        ResultSet sonuc4=sorgulama4.executeQuery();
        sonuc4.next();

    %>
    <h1><%=sonuc.getString(2)%>-ARIZA KAYDI</h1>


    
     <% if(z==1){
    
     
     %>
        <h3>Proje Bilgisi</h3>
  
        <table border="1" align="center">
        <tr>

        <td>ProjeNo</td>
        <td>Yapilan Isin Cinsi</td>
        <td>Teslim Tarihi</td>
        <td>Tutar</td>
        <td>Birim</td>
        <td>Bilgi</td>
        <td>Garanti Suresi</td>
        </tr>

        <td><%=sonuc4.getString(3)%></td>
        <td><%=sonuc4.getString(4)%></td>
        <td><%=sonuc4.getDate(5)%></td>
        <td><%=sonuc4.getFloat(6)%></td>
        <td><%=sonuc4.getString(9)%></td>
        <td><%=sonuc4.getString(7)%></td>
        <td><%=sonuc4.getInt(8)%></td>

        </table>
       <% } 
       
       
       %>
        <h2><%=gg%></h2>
        
        <%
             if(bolge.compareTo("TELEKOM")==0)
     {
         out.println("<b>Lokasyon:</b> "+sonuc.getString("lokasyon"));
         out.println("<br><b>Sistem:</b> "+sonuc.getString("sistem").toUpperCase());
         out.println("<br><b>ArizaTipi:</b> "+sonuc.getString("arizatipi"));
         out.println("<br><b>Onem:</b> "+sonuc.getString("onem"));
         out.println("<br><b>Detay</b> "+sonuc.getString("pre"));

         if(sonuc.getString("filename").compareTo("")!=0){
    %>                    
<a href=ArizaBildirimFaz2/uploads/<%=sonuc.getString("filename")%>>Ekli Dosya</a>
<%
         }
         if(Integer.parseInt(sonuc.getString("antlasma"))==1)
         {
             out.print("<b>Onem</b> :TT Ariza");
         }
         if(Integer.parseInt(sonuc.getString("antlasma"))==2)
         {
             out.print("<b>Onem</b> :  Destek Ariza");
         }
     }
            %>
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
         <td><strong>Gelmesi Istenilen Personel</strong></td>
         <td><strong>Randevu Saati</strong></td>
         <td><strong>ARIZA Notu</strong></td>
         </tr>
            <tr>
       <td><%=sonuc.getString(3)%></td>
       <td><%=sonuc.getString(2)%></td>
       <td><%=sonuc.getDate(4)%>----<%=sonuc.getTime(5)%></td>
       <td><%=sonuc.getString(6)%></td>
        <td><%=sonuc.getString(7)%></td>
        <td><%=sonuc.getString(8)%></td>
        <td><%=sonuc.getString(9)%></td>
          <td><%=sonuc.getString(22)%></td>
          <%

if(sonuc.getTimestamp(23)!=null){
%>
          <td><%=sonuc.getTimestamp(23)%></td>   <% } 
else{
    %><td></td> <%
}
          
          %>
          
          <td><%=sonuc.getString("extra2")%></td>
            </tr>

         </table>

<!--         <form action="detayaktifariza1.jsp" method=post>

         <input type=hidden value="<%=sonuc.getInt(1)%>" name="id">

         <p align=center><input type=submit value="Bu kaydi Print etmis yada arizaya bugun gidilcekse lutfen tiklayin"></p>

         </form>-->

<hr>


         <h2>ARIZA ile ilgili not</h2>

                 <form action="detayaktifariza.jsp" method=post>
                     <input name="id" type="hidden" value="<%=sonuc.getInt(1)%>"></input>
                     <textarea name="arizaNot" rows="5" cols="30" ></textarea>
                  <br>
                  <input name="btn_submit" type="submit" value="Gonder"></input>
                     
                 </form>
    </body>
    
    <% } 
    else
    {
        
        int id =Integer.parseInt(request.getParameter("id"));
        String not=request.getParameter("arizaNot");
        out.print(id);
        out.print(not);
         String sorgu="update kayit set extra2=? where mid=?";
    PreparedStatement sorgulama=con.prepareStatement(sorgu);
    sorgulama.setString(1,not);
    sorgulama.setInt(2, id);
    sorgulama.executeUpdate();
    }
    %>
</html>
<%@include file="disconnect.jsp"%>
<%@ include file="ResourceEnd.jsp" %>