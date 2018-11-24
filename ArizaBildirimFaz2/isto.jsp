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

<p align="center"><a href="frame.jsp"  >Fides Kamera </a></p>
<p align="center"><a href="framegks.jsp"  >Fides  KGS</a></p>
<p align="center"><a href="grafikler.jsp"  >Kamera & KGS Genel Istatistik</a></p>

<p align="center"><a href="framepalmetgaz.jsp"  >Palmet Otomatik Gazlı</a></p>
<p align="center"><a href="framenitelgaz.jsp"  >Nitel Otomatik Gazlı</a></p>
<p align="center"><a href="framemaviliyangin.jsp"  >Mavili Yangın Algılama</a></p>
<p align="center"><a href="framekentkamera.jsp"  >Kent Hybrid Kamera</a></p>
<p align="center"><a href="frameeecyangin.jsp"  >EEC Yangın Algılama</a></p>
<p align="center"><a href="framekenthirsiz.jsp"  >Kent Hırsız Alarm</a></p>
<p align="center"><a href="framedragersabit.jsp"  >Drager Sabit Tip</a></p>
<p align="center"><a href="framemavilisabit.jsp"  >Mavili Sabit Tip</a></p>

<hr>

                    <p align="center"><a href="ArizaBildirim.jsp">Geri</a></p>

    </body>
</html>
<%@include file="disconnect.jsp"%>
<%@ include file="ResourceEnd.jsp" %>

