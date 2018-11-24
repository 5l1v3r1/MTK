<%@page language="java" contentType="text/html;charset=UTF-8"  session="true" errorPage="Error.jsp"%>
<%@page pageEncoding="UTF-8"%>

<%@page import="java.sql.*"%>
<%@page import="java.text.*"%>
<%
    request.setCharacterEncoding("UTF-8");    
    if ((session.getAttribute("userid") == null) || (session.getAttribute("userid") == "")) {    
   
   
    response.sendRedirect("login.jsp");
}
%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
       <link rel="stylesheet" href="mtk.css" type="text/css">
    </head>
    <body>        <%@include file="topborder.jsp"%>

        
        <br><br><br>
         <p align="center"><a href="personel.jsp" target="MainWnd" >Kullanıcı Ekle,Güncelle,Sil</a></p>
            <p align="center"><a href="lokasyon.jsp" target="MainWnd" >Lokasyon Ekle,Güncelle,Sil</a></p>
            <p align="center"><a href="arizatipi.jsp?tip=kgs" target="MainWnd" >Kgs Arıza Tipi Ekle,Güncelle,Sil</a></p>
            <p align="center"><a href="arizatipi.jsp?tip=kamera" target="MainWnd" >Kamera Arıza Tipi Ekle,Güncelle,Sil</a></p>
            <p align="center"><a href="ArizaBildirim.jsp" target="MainWnd" >Geri</a></p>

    </body>
</html>
