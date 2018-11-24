<%@include file="header.jsp"%>
<%@page import="java.sql.*"%>
<%
    request.setCharacterEncoding("UTF-8");    
%>
<%@page language="java" contentType="text/html;charset=UTF-8"  session="true"%>

<%@ include file="Resource.jsp" %>
<html>
    <head>
              <link rel="stylesheet" href="mtk.css" type="text/css">

        <%@include file="header.html"%>
    </head>
    <body>
        <%@include file="topborder.jsp"%>
        <%
    HttpSession onemli=request.getSession(true);
            onemli.removeValue("upload");

if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) {    
   
   
    response.sendRedirect("login.jsp");
}
%>

<p align="center"><a href="arizatipi.jsp?tip=kgs"  >Kgs Arıza Tipi Ekle,Güncelle,Sil</a></p>
<p align="center"><a href="arizatipi.jsp?tip=kamera"  >Kamera Arıza Tipi Ekle,Güncelle,Sil</a></p>
<p align="center"><a href="arizatipi.jsp?tip=Hybrid kamera"  >Hybrid Kamera Arıza Tipi Ekle,Güncelle,Sil</a></p>
<p align="center"><a href="arizatipi.jsp?tip=Hirsiz Alarm"  >Hırsız Alarm Arıza Tipi Ekle,Güncelle,Sil</a></p>
<p align="center"><a href="arizatipi.jsp?tip=Yangin Algilama"  >Yangın Algılama Arıza Tipi Ekle,Güncelle,Sil)</a></p>
<p align="center"><a href="arizatipi.jsp?tip=Sabit Tip"  >Sabit Tip Arıza Tipi Ekle,Güncelle,Sil</a></p>
<p align="center"><a href="arizatipi.jsp?tip=Gazli Sondurme"  >Gazlı Söndürme Arıza Tipi Ekle,Güncelle,Sil</a></p>
<hr>

                    <p align="center"><a href="ArizaBildirim.jsp">Geri</a></p>

    </body>
</html>
<%@include file="disconnect.jsp"%>
<%@ include file="ResourceEnd.jsp" %>

