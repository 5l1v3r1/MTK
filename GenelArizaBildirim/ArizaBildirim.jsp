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
        
        

        String param = request.getParameter("param");
    if (param == null)
        param = "";
 
            
%>
       <%    if (param.compareTo("Musteri") != 0){
%><SPAN style="font-size: 10pt">
    <p align="center">   <img SRC="right.gif"><b><a href="ArizaBildirim.jsp?param=Musteri" >Arıza Islemleri</a></b></p></SPAN> 

<%  } else { %>
<SPAN style="font-size: 10pt"><p align="center"><b><img SRC="down.gif"><a href="ArizaBildirim.jsp">Ariza Islemleri</a></b></SPAN></p>
        <p align="center"> <a  href='acikariza.jsp'>Açık Arızalar</a></p>
    <p align="center"> <a  href='onay.jsp'>Onay Bekleyen Arızalar</a></p>
    <p align="center"> <a href='rapor.jsp'>Geçmiş Arıza Raporlama</a></p>
       
         <%   } %>
    <div align="center">
        
    
 <form action="genelarizagiris.jsp">
    <input type="submit" value="Arıza Girişi Sayfası" style="height:30px; width:350px">
</form>

         

    </div>
    </body>

            <p align="center"> <a align="right" href='sifredegistir.jsp'><%=user%></a></p>

         <p align="center"> <a align="right" href='logout.jsp'>Çıkış</a></p>

</html>
