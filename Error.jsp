<%@ page language="java" contentType="text/html;charset=UTF-8" import="java.util.*,java.io.*,java.net.*" isErrorPage="true"%>
<%@ include file="Resource.jsp" %>

<html>
<head>
<%@ include file="header.html" %>
<title><%= resources.getString("Error")%></title>

</head>
<body>

<p><b><font size="5"><%= resources.getString("Error")%></font></p>
<br><br>
<p><strong><%= resources.getString("Error")%>:</strong> 
<%= (request.getParameter("message") != null ? request.getParameter("message") : resources.getString("UnknownError"))%>
<br><br>
<a href="JavaScript:window.history.go(-1)"><%=resources.getString("Back")%></a>

</body>
</html>
<%@ include file="ResourceEnd.jsp" %>