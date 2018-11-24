<%@page language="java" contentType="text/html;charset=UTF-8"  session="true" errorPage="Error.jsp"%>
<%@page pageEncoding="UTF-8"%>

<%@page import="java.sql.*"%>
<%@page import="java.text.*"%>
<%
    request.setCharacterEncoding("UTF-8");    
%>

<html>
    <head>
      <link rel="stylesheet" href="mtk.css" type="text/css">
        <link rel="stylesheet" href="chosen.css">
  <style type="text/css" media="all">
    /* fix rtl for demo */
    .chosen-rtl .chosen-drop { left: -9000px; }
  </style>

    <!-- Include all compiled plugins (below), or include individual files as needed -->
    
   
   

    </head>
    <body>
        <%@include file="topborder.jsp"%>

<%
if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) {    
   
   
    response.sendRedirect("login.jsp");
}


    
    
        String user=session.getAttribute("userid").toString();
        
        if(user.compareTo("palmet")==0||user.compareTo("nitel")==0||user.compareTo("mavili")==0||user.compareTo("kent")==0||user.compareTo("eec")==0||user.compareTo("kent")==0||user.compareTo("drager")==0)
        {
            
            response.sendRedirect("firmaMenu.jsp");
        }

        String param = request.getParameter("param");
    if (param == null)
        param = "";
       if(user.compareTo("admin")==0||user.compareTo("120293")==0||user.compareTo("137559")==0||user.compareTo("193174")==0||user.compareTo("194222")==0||user.compareTo("193139")==0||user.compareTo("196871")==0)
       {
           
           
            if (param.compareTo("InformationEntry") != 0){
%><SPAN style="font-size: 10pt">
    <p align="center">  <img SRC="right.gif"><b><a href="ArizaBildirim.jsp?param=InformationEntry">Admin Islemleri</a></b></p> </SPAN>

            <%
       }
     //out.print(user);
         else { %>

         <p align="center"><SPAN style="font-size: 10pt"><b><img SRC="down.gif"><a href="ArizaBildirim.jsp">Admin Islemleri</a></b> </SPAN></p>
           <p align="center"><a href="personel.jsp"  >Kullanıcı Ekle,Güncelle,Sil</a></p>
            <p align="center"><a href="lokasyon.jsp"  >Lokasyon Ekle,Güncelle,Sil</a></p>
            <p align="center"><a href="istatistik.jsp"  >İstatistikler</a></p>
             <p align="center"><a href="arizatipleri.jsp"  >Arıza Tipleri Sayfası</a></p>

        <%
            }
            }
            
%>
       <%    if (param.compareTo("Musteri") != 0){
%><SPAN style="font-size: 10pt">
    <p align="center">   <img SRC="right.gif"><b><a href="ArizaBildirim.jsp?param=Musteri" >Arıza Islemleri</a></b></p></SPAN> 

<%  } else { %>
<SPAN style="font-size: 10pt"><p align="center"><b><img SRC="down.gif"><a href="ArizaBildirim.jsp">Ariza Islemleri</a></b></SPAN></p>
        <p align="center"> <a  href='acikariza.jsp'>Açık Arızalar</a></p>
    <p align="center"> <a  href='ttonay.jsp'>TT Onayı Bekleyen Arızalar</a></p>
    <p align="center"> <a href='rapor.jsp'>Geçmiş Arıza Raporlama</a></p>
       
         <%   } %>
    <div align="center">
        <form action="palmetgazli.jsp">
        <input type="submit" value="PALMET Otomatik Gazlı Söndürme Girişi Sayfası" style="height:30px; width:350px">
</form>
<form action="nitelgazli.jsp">
        <input type="submit" value="NİTEL Otomatik Gazlı Söndürme Girişi Sayfası" style="height:30px; width:350px">
</form>

        <form action="maviliyangin.jsp">
    <input type="submit" value="MAVİLİ Yangın Algılama Arıza Girişi Sayfası" style="height:30px; width:350px">
</form>
                 <form action="kentkamera.jsp">
    <input type="submit" value="KENT Hybrid Kamera Arıza Girişi Sayfası" style="height:30px; width:350px">
</form>
        <form action="eecyangin.jsp">
    <input type="submit" value="EEC Yangın Algılama Arıza Girişi Sayfası" style="height:30px; width:350px">
</form>
        <form action="kenthirsiz.jsp">
    <input type="submit" value="KENT Hırsız Alarm Arıza Girişi Sayfası" style="height:30px; width:350px">
</form>


<form action="dragersabit.jsp">
    <input type="submit" value="DRAGER Sabit Tip Arıza Girişi Sayfası" style="height:30px; width:350px">
</form>
<form action="mavilisabit.jsp">
    <input type="submit" value="MAVİLİ Sabit Tip Arıza Girişi Sayfası" style="height:30px; width:350px">
</form>

<form action="arizaoncesi.jsp">
    <input size=500 type="submit" value="FİDES Kamera Arıza Girişi Sayfası" style="height:30px; width:350px">
</form>
    
 <form action="arizaoncesikgs.jsp">
    <input type="submit" value="FİDES KGS Arıza Girişi Sayfası" style="height:30px; width:350px">
</form>

         

    </div>
    </body>

            <p align="center"> <a align="right" href='sifredegistir.jsp'><%=user%></a></p>
             <p align="center"> <a align="right" href='isto.jsp'>İstatistikler</a></p>

         <p align="center"> <a align="right" href='logout.jsp'>Çıkış</a></p>

</html>
