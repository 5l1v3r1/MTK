<%@include file="header.jsp"%>
<%@ include file="Resource.jsp" %>
<style type="text/css">
    <!--
    body {  font-family: Arial, Verdana, Helvetica, sans-serif; font-size: 12px;
    color: #666666}
    table {  font-family: Arial, Verdana, Helvetica, sans-serif; font-size: 12px; color: #666666}
 
    .bbb {  font-family: Arial, Verdana, Helvetica, sans-serif; font-size: 12px; color: #666666; line-height: 18px}
    .ccc {  font-family: Arial, Verdana, Helvetica, sans-serif; font-size: 12px; color: #666666}
    .ddd {  font-family: Arial, Verdana, Helvetica, sans-serif; font-size: 11px; color: #666666; line-height: normal}
    //-->
</style>
<%
    int f=0;
    int k=0;
    HttpSession onemli=request.getSession();
    if(onemli.getValue("pas")=="gecerli"||onemli.getValue("bilgiler")=="bilgiler"||onemli.getValue("ekleme")=="ekleme"||onemli.getValue("degistirme")=="degistirme"||onemli.getValue("raporlama")=="raporlama"||onemli.getValue("projeekle")=="projeekle"||onemli.getValue("projeduzelt")=="projeduzelt"||onemli.getValue("projesil")=="projesil"||onemli.getValue("faturakes")=="faturakes"||onemli.getValue("teklif")=="teklif"||onemli.getValue("bakma")=="bak") {
        f=1;
    }

 

    if(f==0) {

        response.sendRedirect("login.jsp");
    }
      String param = request.getParameter("param");
    if (param == null)
        param = "";

%>
<html>
    <head>
        <%@include file="header.html"%>
    </head>
    <body>
        
        <%@include file="topborder.jsp"%>

        <%
            try{
                if(onemli.getValue("user").equals("admin")&&onemli.getValue("pas").equals( "gecerli")) {
                    k=1;
        %>
        <%    if (param.compareTo("InformationEntry") != 0){
%><SPAN style="font-size: 12pt">
    <img SRC="right.gif"><b><a href="form.jsp?param=InformationEntry">Admin Islemleri</a></b> </SPAN><br />

<%  } else { %>

<SPAN style="font-size: 12pt"><b><img SRC="down.gif"><a href="form.jsp">Admin Islemleri</a></b> </SPAN>
        <p><a href="admindegistir.jsp" target="MainWnd" >Admin Bilgisi,Sifre Degistir</p>
        <p><a href="personel.jsp" target="MainWnd" >Personelleri Gor,Ekle,Cikar</a></p>
        <p><a href="yapilanis.jsp" target="MainWnd" >Yapilanisleri Ekle,Cikar,Goruntule</a></p>
        <p><a href="servissonuc.jsp" target="MainWnd">Servis sonucunda verilen yorumlari gor</a></p>
        <p><a href="kullanicilar.jsp" target="MainWnd" >Kullanicilara Bak,Ekle,degistir,yetki ver</a></p>
        <p><a href="externalpersonel.jsp" target="MainWnd" >Harici Firma Kullanici Islemleri</a></p>
        <p><a href="loggor.jsp" target="MainWnd" >Siteye Giren Kullanicilari Gor</a></p>
        <%}
            }
            } catch(Exception e) { out.println(e.getMessage());}
        %>
       
       
       
        <%    if (param.compareTo("Musteri") != 0){
%><SPAN style="font-size: 12pt">
    <img SRC="right.gif"><b><a href="form.jsp?param=Musteri" >Kullanici Islemleri</a></b></SPAN> <br />

<%  } else { %>
<SPAN style="font-size: 12pt"><b><img SRC="down.gif"><a href="form.jsp">Kullanici Islemleri</a></b></SPAN>
        <p align=left> <a href="addkayit.jsp"  target="MainWnd" >Musteri Ekle</a></p>
        <p align=left> <a href="projeekle.jsp"  target="MainWnd" >Proje Ekle</a></p>
       <p align=left ><a href="teklif1.jsp" target="MainWnd" >Teklifler </a></p>
       
        <p align=left><a href="kayitarizaa.jsp" target="MainWnd">Ariza Kayit Ekle</a></p>
         <p align=left ><a href="girismusteri.jsp" target="MainWnd">Tum Musteri Bilgileri ve Projeler</a></p>
       
         <%   } if (param.compareTo("arizawide") != 0){
%>

<SPAN style="font-size: 12pt">
    <img SRC="right.gif"><b><a href="form.jsp?param=arizawide">Servis Raporlamalari ve Aktif Arizalar</a></b></SPAN>
        
       <%  } else { %>
       <SPAN style="font-size: 12pt">         <img SRC="down.gif"><b><a href="form.jsp">Servis Raporlamalari ve Aktif Arizalar</a></b> </SPAN>
        <p><a href="aktifariza.jsp"  target="MainWnd" >Aktif Arizalar</a></p>
        <p>   <a href="onayariza.jsp"  target="MainWnd" >Onay Bekleyen Arizalar</a></p>


        <p><a href="faturaa.jsp"  target="MainWnd" >Fatura Kesimi icin Bekleyen Isler</a></p>




        <p> <a href="baksa.jsp"  target="MainWnd" >Servis Antlasmasi olan Musterilere Bak</a></p>

        <p>  <a href="rapor.jsp" target="MainWnd">Raporlamalar</a></p>

        <p> <a href="raporperiyodik.jsp" target="MainWnd">Periyodik Bakim Gidimleri</a></p>
   
      
        <%  if(k==0) { %>
        <p align=center><a href="kullanicisifre.jsp" target="MainWnd" >Kullanici Sifre Degistirme</a></p> <% } %>
        <p align=center><a href="login.jsp"  target="_top" >Logout</a></p>
        <% }%>
    </body>
</html>
<%@ include file="ResourceEnd.jsp" %>