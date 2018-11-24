<%@page language="java" contentType="text/html;charset=UTF-8"  session="true" %>
<%@page pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="java.text.*" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
     
    </head>
    <body>
       <%
session.setAttribute("userid", null);
session.invalidate();
response.sendRedirect("login.jsp");
%>
    </body>
</html>
